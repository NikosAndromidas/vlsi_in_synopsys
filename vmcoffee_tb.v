`timescale 1ns/10ps
module vmcoffee_tb();

parameter [1:0]
s0=2'b00, s1=2'b01, s2=2'b10;
parameter delay = 2;
reg [1:0] state,next;
reg [4:0] water;
reg clk,rst,c10,c5,nfc,beans;
wire coffee,error;


    vmcoffee #(.s0(s0), .s1(s1), .s2(s2)) DUT (
        .clk(clk),
        .rst(rst),
	.c10(c10),
	.water(water),
	.c5(c5),
        .nfc(nfc),
        .beans(beans),
        .coffee(coffee),
	.error(error)
    );
    
always #(0.5*delay) clk = ~clk;


    initial begin

	rst=0;
	water=0;
	beans=0;
	c10=0;
	c5=0;
	nfc=1;
	#(delay);
	rst=1;
	#(delay);
	repeat(100)begin
	water = {$random}%31;
	beans = $random;
	#(delay);
	if(beans && water>1) begin
	c10 = $random;
	#(delay);
	c5 = $random;
	#(delay);	 
	nfc = $random;
	#(delay);
	end
	else begin 
	c10 = $random;
	c5 = $random;	 
	nfc = $random;
	#(delay);
	end

      end
	$display("0%t Finished", $time);
		$finish;
    end

endmodule

