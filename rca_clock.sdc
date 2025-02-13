## timing contstraints

set clk_port clk
set reset_port rstn
set clk_period 100

create_clock -name clk -period $clk_period
set_false_path -from $reset_port

set_input_delay 0.00 -clock  clk [all_inputs]
set_output_delay 0.00 -clock  clk [all_outputs]

set_clock_uncertainty 0.00  [get_clocks clk]
