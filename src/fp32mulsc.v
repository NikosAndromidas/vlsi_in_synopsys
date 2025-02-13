module fp32mulsc (
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] z
);
    reg sign_a, sign_b, sign_z;
    reg [7:0] exp_a, exp_b, exp_z;
    reg [23:0] mant_a, mant_b;
    reg [47:0] mant_product;
    reg guard, round, sticky;
    reg [8:0] exp_sum;
    reg [24:0] mant_z_norm;

    always @(*) begin

        sign_a = a[31];
        sign_b = b[31];
        exp_a = a[30:23];
        exp_b = b[30:23];
        mant_a = (exp_a == 0) ? {1'b0, a[22:0]} : {1'b1, a[22:0]};
        mant_b = (exp_b == 0) ? {1'b0, b[22:0]} : {1'b1, b[22:0]};
        

        sign_z = sign_a ^ sign_b;
        

        exp_sum = exp_a + exp_b - 127;


        mant_product = mant_a * mant_b;

        // Kanonikopoihsh tou mantissa product
        if (mant_product[47]) begin
            mant_z_norm = mant_product[47:24];
            exp_z = exp_sum + 1;
        end else begin
            mant_z_norm = mant_product[46:23];
            exp_z = exp_sum;
        end

        // Rounding
        guard = mant_product[23];
        round = mant_product[22];
        sticky = |mant_product[21:0];

        // Stroggylopoihsh sto pio kontino
        if (guard & (round | sticky | mant_z_norm[0])) begin
            mant_z_norm = mant_z_norm + 1;
            if (mant_z_norm[24]) begin
                mant_z_norm = mant_z_norm >> 1;
                exp_z = exp_z + 1;
            end
        end



        // Eidikes periptwseis
        if (exp_a == 255 || exp_b == 255) begin

	    if (b == 0 || a == 0) begin
                // One is infinity and the other 0, z  NaN
                z = 32'h7fc00000;
	    end
           else if (exp_a == 255 && mant_a[22:0] != 0) begin
                // a  NaN
                z = 32'h7fc00000; 
            end else if (exp_b == 255 && mant_b[22:0] != 0) begin
                // b  NaN
                z = 32'h7fc00000; 
            end else begin
                // One of a or b  infinity
                z = {sign_z, 8'hff, 23'h0};
            end
        end


	 else if (exp_a == 0 || exp_b == 0) begin
            // One of a or b  zero
            z = {sign_z, 8'h00, 23'h0};
     	   end 
	else begin

            if (exp_z >= 255) begin
                // Overflow to infinity
                z = {sign_z, 8'hff, 23'h0};
            end else if (exp_z <= 0) begin
                // Underflow to zero
                z = {sign_z, 8'h00, 23'h0};
            end else begin
                // Apotelesma
                z = {sign_z, exp_z[7:0], mant_z_norm[22:0]};
            end
        end
    end
endmodule
