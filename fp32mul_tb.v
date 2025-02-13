`timescale 1ns/10ps 
module fp32mul_tb;

reg [31:0] a, b;
wire [31:0] z;
reg clk, rst;

fp32mul DUT (.clk(clk) , .rst(rst), .a(a), .b(b), .z(z));



initial begin
	clk <= 1;
	rst <= 1;
	repeat(17000)
		#5 clk <= ~clk;
end

initial #13 rst <= 0;

initial begin
	#3
	repeat(500) begin
		#80
		a = $random;
		b = $random;
	end
	#80 $finish;
end


endmodule
