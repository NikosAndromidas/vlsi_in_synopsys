module fp32mul(clk, rst, a, b, z);

input clk, rst;
input [31:0] a, b;
output reg [31:0] z;

reg [2:0] counter;

reg [23:0] a_m, b_m, z_m;
reg [9:0] a_e, b_e, z_e;
reg a_s, b_s, z_s;

reg [49:0] product;

reg guard_bit, round_bit, sticky;

always @(posedge clk) begin
	if(rst)
		counter <= 0;
	else
	 counter <= counter + 1;
		if(counter == 3'b001) begin //Diaxwrismos pediwn twn arithmwn
			a_m <= a[22:0];
			b_m <= b[22:0];
			a_e <= a[30:23] - 127;
			b_e <= b[30:23] - 127;
			a_s <= a[31];
			b_s <= b[31];
       		 end
		else if(counter == 3'b010) begin
			if ((a_e == 128 && a_m != 0) || (b_e == 128 && b_m != 0)) begin //a h b einai NAN
		  		z[31] <= 1;
		  		z[30:23] <= 255;
		  		z[22] <= 1;
		  		z[21:0] <= 0;
		  	end
          	else if (a_e == 128) begin //INF A
          		z[31] <= a_s ^ b_s;
          		z[30:23] <= 255;
          		z[22:0] <= 0;
          		if (($signed(b_e) == -127) && (b_m == 0)) begin // AN TO B = 0,TOTE Z NAN
            			z[31] <= 1;
            			z[30:23] <= 255;
	        	    	z[22] <= 1;
        		    	z[21:0] <= 0;
          		end
          	end
          	else if (b_e == 128) begin //INF B
          		z[31] <= a_s ^ b_s;
          		z[30:23] <= 255;
          		z[22:0] <= 0;
          		if (($signed(a_e) == -127) && (a_m == 0)) begin //AN TO A = 0,TOTE Z NAN
            			z[31] <= 1;
            			z[30:23] <= 255;
	        	    	z[22] <= 1;
        		    	z[21:0] <= 0;
          		end
          	end
	          else if (($signed(a_e) == -127) && (a_m == 0)) begin //0 AN A = 0
	       		 z[31] <= a_s ^ b_s;
	       		 z[30:23] <= 0;
        	 	 z[22:0] <= 0;
        	  end
        	  else if (($signed(b_e) == -127) && (b_m == 0)) begin //0 AN B = 0
        	 	 z[31] <= a_s ^ b_s;
        	  	 z[30:23] <= 0;
        	  	 z[22:0] <= 0;
        	  end
        	  else begin
        	  	if ($signed(a_e) == -127) //DENORMALIZING A
        	    		a_e <= -126;
        	  	else
        	    		a_m[23] <= 1;
            		
        	    	if ($signed(b_e) == -127) //DENORMALIZING B
        	    		b_e <= -126;
        	  	else
        	    		b_m[23] <= 1;
        	  end
		end
	
		
		else if(counter == 3'b011) begin
			if (~a_m[23]) begin //KANONIKOPOIHSH A
	        	a_m <= a_m << 1;
	       		a_e <= a_e - 1;
	        	end
	       		else if (~b_m[23]) begin //KANONIKOPOIHSH B
	        	b_m <= b_m << 1;
	       		b_e <= b_e - 1;
	       		end
		end

		else if(counter == 3'b100) begin //SIGNS XORED, EXPONENTS ADDED, ENDIAMESO MANTISSA MULTIPLICATION
			z_s <= a_s ^ b_s;
			z_e <= a_e + b_e + 1;
			product <= a_m * b_m * 4;
		end

		else if(counter == 3'b101) begin //APOSPASH TOU ENDIAMESOU APOTELESMATOS
			z_m <= product[49:26];
	       		guard_bit <= product[25];
	      		round_bit <= product[24];
	      		sticky <= (product[23:0] != 0);
		end

		else if(counter == 3'b110) begin // KANONIKOSPOIHSH KAI STROGGYLOPOIHSH
			if ($signed(z_e) < -126) begin
		    		z_e <= z_e + (-126 -$signed(z_e));
				z_m <= z_m >> (-126 -$signed(z_e));
		 		guard_bit <= z_m[0];
		   		round_bit <= guard_bit;
		   		sticky <= sticky | round_bit;
		    	end
			else if (z_m[23] == 0) begin
		    		z_e <= z_e - 1;
		    		z_m <= z_m << 1;
		    		z_m[0] <= guard_bit;
		    		guard_bit <= round_bit;
		    		round_bit <= 0;
		    	end
			    else if (guard_bit && (round_bit | sticky | z_m[0])) begin
		    		z_m <= z_m + 1;
		      		if (z_m == 24'hffffff) z_e <=z_e + 1;
		    	    end
       		 end

		else if(counter == 3'b111) begin //APOTELESMA
			z[22:0] <= z_m[22:0];
        		z[30:23] <= z_e[7:0] + 127;
        		z[31] <= z_s;
        		if ($signed(z_e) == -126 && z_m[23] == 0) z[30:23] <= 0;
        		if ($signed(z_e) > 127) begin //AN OVERFLOW EPESTREPSE INF
          		z[22:0] <= 0;
          		z[30:23] <= 255;
          		z[31] <= z_s;
        		end
		end


end

endmodule
