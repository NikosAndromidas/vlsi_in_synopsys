module vmcoffee(clk,rst,c10,c5,nfc,water,beans,coffee,error);

parameter [1:0]
s0=2'b00, s1=2'b01, s2=2'b10;
reg [1:0] state,next;
input [4:0] water;
input clk,rst,c10,c5,nfc,beans;
output reg coffee,error;


always @(posedge clk or negedge rst)
if(!rst) state <= s0;
else state <= next;

always @(state or c10 or c5 or nfc or beans or water) begin
 next=2'bx; coffee=1'b0; error=1'b0;
	case (state)
	 s0 :  begin
	       error = 0;
		coffee=0;		
		if(beans && water>1) next = s1;
	       else next = s0;
	        end 

	 s1 :  begin 
	       error = 1;
	       if(!beans || water<1) next = s0; 
	       else if(!nfc || c10) begin next = s1; coffee=1; end 
		else if(c5) begin next = s2;  end 
	       else begin next = s1;  coffee=0; end
	       end

	 s2 :  begin 
			error = 1;
			coffee=0;
		   if(c5 || !nfc || c10) begin next = s1; coffee=1; end
		   else next = s2;
		   end

	 
	endcase
end


endmodule
