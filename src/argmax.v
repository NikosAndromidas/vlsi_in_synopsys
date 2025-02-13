module argmax #(
  parameter n = 4,
  parameter k = 10
)(
  input [k*n-1:0] array_i,
  output [$clog2(k)-1:0] index_o
);
  reg [$clog2(k)-1:0] max_index, i;
  reg signed [n-1:0] max_val;
  

  always @(*)
  begin
    max_index=0;
    max_val=$signed(array_i[n-1:0]);
    for (i=1;i<k;i=i+1)
        if ($signed(array_i[i*n +: n]) > max_val)
        begin
            max_val=$signed(array_i[i*n +: n]);
            max_index=i;
        end
  end
  assign index_o=max_index;

endmodule
