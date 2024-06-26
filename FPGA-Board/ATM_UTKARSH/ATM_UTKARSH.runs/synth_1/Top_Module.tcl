# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir E:/FPGA/ATM_UTKARSH/ATM_UTKARSH.cache/wt [current_project]
set_property parent.project_path E:/FPGA/ATM_UTKARSH/ATM_UTKARSH.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo e:/FPGA/ATM_UTKARSH/ATM_UTKARSH.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  E:/FPGA/ATM_UTKARSH/ATM_UTKARSH.srcs/sources_1/new/ATM.v
  E:/FPGA/ATM_UTKARSH/ATM_UTKARSH.srcs/sources_1/new/BCD_Seven_Segment.v
  E:/FPGA/ATM_UTKARSH/ATM_UTKARSH.srcs/sources_1/new/Binary_BCD_Converter.v
  E:/FPGA/ATM_UTKARSH/ATM_UTKARSH.srcs/sources_1/new/Decoder.v
  E:/FPGA/ATM_UTKARSH/ATM_UTKARSH.srcs/sources_1/new/Deposit.v
  E:/FPGA/ATM_UTKARSH/ATM_UTKARSH.srcs/sources_1/new/Shift_Add3_algorithm.v
  E:/FPGA/ATM_UTKARSH/ATM_UTKARSH.srcs/sources_1/new/SlowClock_100Hz.v
  E:/FPGA/ATM_UTKARSH/ATM_UTKARSH.srcs/sources_1/new/Withdraw.v
  E:/FPGA/ATM_UTKARSH/ATM_UTKARSH.srcs/sources_1/new/counter.v
  E:/FPGA/ATM_UTKARSH/ATM_UTKARSH.srcs/sources_1/new/debounce.v
  E:/FPGA/ATM_UTKARSH/ATM_UTKARSH.srcs/sources_1/new/eight_bit_counter.v
  E:/FPGA/ATM_UTKARSH/ATM_UTKARSH.srcs/sources_1/new/four_to_one_Mux.v
  E:/FPGA/ATM_UTKARSH/ATM_UTKARSH.srcs/sources_1/new/Top_Module.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc E:/FPGA/ATM_UTKARSH/ATM_UTKARSH.srcs/constrs_1/new/constraints.xdc
set_property used_in_implementation false [get_files E:/FPGA/ATM_UTKARSH/ATM_UTKARSH.srcs/constrs_1/new/constraints.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top Top_Module -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Top_Module.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Top_Module_utilization_synth.rpt -pb Top_Module_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
