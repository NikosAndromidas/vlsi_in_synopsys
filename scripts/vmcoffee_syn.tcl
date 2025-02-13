set DESIGN_NAME vmcoffee


set target_library {/usr/local/eda/synLibs/asap7/7nm/db/asap7.db}
set link_library {* /usr/local/eda/synLibs/asap7/7nm/db/asap7.db}


analyze -format verilog {./src/vmcoffee.v}
elaborate $DESIGN_NAME

link
check_design

create_clock -period 150 [get_ports clk]
set_input_delay -max 1.0 -clock [get_clocks clk] [all inputs]
set_output_delay -max 1.0 -clock [get_clocks clk] [all output]

set_max_area 0

compile
set resultdir "./results_vmcoffee"
set postfix "compile"
exec mkdir -p -- $resultdir
report_timing > $resultdir/timing_report.${postfix}.rpt
report_qor > $resultdir/qor_report.${postfix}.rpt
report_area -hierarchy > $resultdir/area_report.${postfix}.rpt
report_power -hierarchy > $resultdir/power_report.${postfix}.rpt

write -hierarchy -format verilog -output $resultdir/vmcoffee_compiled.${postfix}.v

gui_start
