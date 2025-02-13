set target_library {/usr/local/eda/synLibs/asap7/7nm/db/asap7.db}
set link_library {* /usr/local/eda/synLibs/asap7/7nm/db/asap7.db}
read_verilog netlist_fp32mul.v
link_design

set resultdir "./results_fp32mul"

set power_enable_analysis true

read_fsdb -strip_path fp32mul_tb/DUT fp32mul.fsdb > $resultdir/power_report1.rpt

update_power
report_power > $resultdir/power_report.rpt

quit
