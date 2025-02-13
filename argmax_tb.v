`timescale 1ns/10ps
module argmax_tb();
  parameter n = 8;
  parameter k = 100;
  parameter tests = 100;
  localparam idx_width = $clog2(k);
  localparam delay = 2;

  reg [k*n-1:0] array_in;
  reg [idx_width-1:0] j;
  wire [idx_width-1:0] idx;
  integer i, ii;
  integer errors=0, err;

  argmax #(.k(k), .n(n)) DUT (.array_i(array_in), .index_o(idx));

  initial begin
    for (i=0;i<tests; i=i+1) begin
        for (ii=0; ii<k; ii=ii+1) array_in[ii*n+:n] = $random;
        err=0;
        #(delay)
        for (j=0;j<k;j=j+1)
            if ($signed(array_in[j*n+:n])>$signed(array_in[idx*n+:n])) begin
                err=1;
            end
        if (err==1) errors=errors+1;
    end
    $display("Finished with %0d errors", errors);
    $finish;
  end

endmodule
