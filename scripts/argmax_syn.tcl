set DESIGN_NAME argmax


set target_library {/usr/local/eda/synLibs/asap7/7nm/db/asap7.db}
set link_library {* /usr/local/eda/synLibs/asap7/7nm/db/asap7.db}


analyze -format verilog {./src/argmax.v}
elaborate $DESIGN_NAME

link
check_design

set delay 180
set_max_delay $delay -from [all_inputs] -to [all_outputs]

set_max_area 0

compile
set resultdir "./results_argmax"
set postfix "compile"
exec mkdir -p -- $resultdir
report_timing > $resultdir/timing_report.${postfix}.${delay}.rpt
report_qor > $resultdir/qor_report.${postfix}.${delay}.rpt
report_area -hierarchy > $resultdir/area_report.${postfix}.${delay}.rpt
report_power -hierarchy > $resultdir/power_report.${postfix}.${delay}.rpt

write -hierarchy -format verilog -output $resultdir/argmax_compiled.${postfix}.${delay}.v

gui_start
