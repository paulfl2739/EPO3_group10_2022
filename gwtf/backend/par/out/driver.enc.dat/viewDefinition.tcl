if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name wc\
   -timing\
    [list ${::IMEX::libVar}/mmmc/tcb018gbwp7twc.lib]
create_library_set -name bc\
   -timing\
    [list ${::IMEX::libVar}/mmmc/tcb018gbwp7tbc.lib]
create_op_cond -name op_bc -library_file ${::IMEX::libVar}/mmmc/tcb018gbwp7tbc.lib -P 1 -V 1.98 -T 0
create_op_cond -name op_wc -library_file ${::IMEX::libVar}/mmmc/tcb018gbwp7tbc.lib -P 1 -V 1.62 -T 125
create_rc_corner -name rc_bc\
   -cap_table ${::IMEX::libVar}/mmmc/t018lo_1p6m_typical.captable\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 0
create_rc_corner -name rc_wc\
   -cap_table ${::IMEX::libVar}/mmmc/t018lo_1p6m_typical.captable\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 125
create_delay_corner -name wc\
   -library_set wc\
   -rc_corner rc_wc
create_delay_corner -name bc\
   -library_set bc\
   -rc_corner rc_bc
create_constraint_mode -name timing_constrain\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/timing_constrain/timing_constrain.sdc]
create_analysis_view -name hold_bc -constraint_mode timing_constrain -delay_corner bc -latency_file ${::IMEX::dataVar}/mmmc/views/hold_bc/latency.sdc
create_analysis_view -name hold_wc -constraint_mode timing_constrain -delay_corner wc
create_analysis_view -name setup_bc -constraint_mode timing_constrain -delay_corner bc
create_analysis_view -name setup_wc -constraint_mode timing_constrain -delay_corner wc -latency_file ${::IMEX::dataVar}/mmmc/views/setup_wc/latency.sdc
set_analysis_view -setup [list setup_wc] -hold [list hold_bc]
