set target_library {/usr/local/eda/synLibs/asap7/7nm/db/asap7.db}
set link_library {* /usr/local/eda/synLibs/asap7/7nm/db/asap7.db}
read_verilog netlist.v
link_design

set resultdir "./results_rca"

set power_enable_analysis true

read_fsdb -strip_path rca_tb/DUT rca.fsdb > $resultdir/power_report1.rpt

update_power
report_power > $resultdir/power_report.rpt

quit
