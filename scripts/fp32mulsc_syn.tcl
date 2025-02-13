set DESIGN_NAME fp32mulsc


set target_library {/usr/local/eda/synLibs/asap7/7nm/db/asap7.db}
set link_library {* /usr/local/eda/synLibs/asap7/7nm/db/asap7.db}


analyze -format verilog {./src/fp32mulsc.v}
elaborate $DESIGN_NAME

link
check_design

set delay 250 
set_max_delay $delay -from [all_inputs] -to [all_outputs]
set_max_area 0

compile_ultra 
set resultdir "./results_fp32mulsc"
set postfix "compile_ultra"
exec mkdir -p -- $resultdir
report_timing > $resultdir/timing_report.${postfix}.rpt
report_qor > $resultdir/qor_report.${postfix}.rpt
report_area -hierarchy > $resultdir/area_report.${postfix}.rpt
report_power -hierarchy > $resultdir/power_report.${postfix}.rpt

write -hierarchy -format verilog -output $resultdir/fp32mulsc_compiled.${postfix}.v

gui_start
