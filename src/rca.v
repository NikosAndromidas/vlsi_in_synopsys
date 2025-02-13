module rca
#(
  parameter width = 9
)(
  input  [width-1:0] a_i,
  input  [width-1:0] b_i,
  output [width:0] sum_o
);

  wire [width-1:0] temp_sum;
  wire [width:0] temp_c;
  
  assign temp_c[0] = 1'b0;
  
  genvar gi;
  generate
    for (gi=0; gi<width; gi=gi+1) begin: fas
	   fulladder fa (
                    .a(a_i[gi]),
                    .b(b_i[gi]),
                    .cin(temp_c[gi]),
                    .s(temp_sum[gi]),
                    .cout(temp_c[gi+1])
                  );
	end
  endgenerate
  
  assign sum_o= {temp_c[width],temp_sum};
endmodule
