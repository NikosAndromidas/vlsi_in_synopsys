`timescale 1ns/10ps
module shiftregister_tb;

    parameter N = 4;
    parameter delay = 10;
    reg clk,rst,pl,en,si;
    reg [N-1:0] din;
    wire [N-1:0] reg_out;
    wire so;

    shiftregister #(.N(N)) DUT  (
        .rst(rst),
        .clk(clk),
        .pl(pl),
        .en(en),
        .si(si),
        .din(din),
        .reg_out(reg_out),
        .so(so)
    );

	
	always #(0.5*delay) clk = ~clk;

     initial begin
        rst = 0;
	#(delay);
        rst = 1;
	#(delay);
repeat(100)begin
       pl = 1;
       din = $random; 
	#(delay);
        pl = 0;
	#(delay);
       en = 1;
         si =$random;
	#(delay);
         en = 0; 
	#(delay);
end
	$display("reg_out = %d", reg_out);
	$display("so = %d", so);
  
        $finish;
    end

endmodule

