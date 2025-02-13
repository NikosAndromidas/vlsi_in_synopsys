module shiftregister (rst, clk, pl, en, si, din, reg_out, so);
    parameter N = 4;

    input rst, clk, pl, si, en;
    input [N-1:0] din;
    output reg [N-1:0] reg_out;
    output reg so;

    always @(posedge clk or negedge rst) begin
        if (!rst) reg_out <= 0;
        else if (pl) reg_out <= din;
        else if (en) begin
 		so <= reg_out[0];
		reg_out <= {si, reg_out[N-1:1]};
	end
       
    end

    

endmodule
