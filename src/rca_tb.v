`timescale 1ns/10ps
  module rca_tb;
  parameter n = 9;
  parameter delay = 5;

  reg [n:0] a,b;
  reg [n:0] sum;
  wire [n:0] sum1;
  reg check;
  wire [n:0] out;

  rca #(.width(n)) DUT (
                      .a_i(a[n-1:0]),
                      .b_i(b[n-1:0]),
                      .sum_o(out)
                      );

  initial begin
      $monitor("%0t, %d %d %d %d %d", $time, a, b, out, sum, sum1);
      check=1'b1;
      for (a=0;a<(1<<n);a=a+1)
      begin
          for (b=0;b<(1<<n);b=b+1)
          begin
              sum=a+b;
              #(delay) 
              if (out == sum) check=1'b1;
              else check=1'bX;
          end
      end
      $finish;
  end
 
endmodule
