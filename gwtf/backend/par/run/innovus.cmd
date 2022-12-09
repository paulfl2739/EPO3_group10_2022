#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Thu Dec  8 16:08:50 2022                
#                                                     
#######################################################

#@(#)CDS: Innovus v17.11-s080_1 (64bit) 08/04/2017 11:13 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 17.11-s080_1 NR170721-2155/17_11-UB (database version 2.30, 390.7.1) {superthreading v1.44}
#@(#)CDS: AAE 17.11-s034 (64bit) 08/04/2017 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 17.11-s053_1 () Aug  1 2017 23:31:41 ( )
#@(#)CDS: SYNTECH 17.11-s012_1 () Jul 21 2017 02:29:12 ( )
#@(#)CDS: CPE v17.11-s095
#@(#)CDS: IQRC/TQRC 16.1.1-s215 (64bit) Thu Jul  6 20:18:10 PDT 2017 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
setPreference CmdLogMode 2
set init_lef_file /data/designkit/tsmc-180nm/lib/TSMCHOME/digital/Back_End/lef/tcb018gbwp7t_270a/lef/tcb018gbwp7t_6lm.lef
set init_mmmc_file ../in/mmmc.view
set init_verilog ../in/top.v
set init_top_cell spc_clockgen
set init_gnd_net dgnd
set init_pwr_net dvdd
suppressMessage TECHLIB IMPLF IMPVL IMPFP IMPCTE IMPRM IMPSP IMPCTE NRDB IMPEXT
encMessage info 0
encMessage warning 0
init_design
generateVias
floorPlan -site core7T -s 325 325 0 0 0 0
addStripe -nets {dgnd dvdd} -layer METAL4 -width 2 -number_of_sets 5 -spacing 0.5
addWellTap -cell TAPCELLBWP7T -cellInterval 30 -prefix WELLTAP
editPin -pin clk -layer 2 -fixedPin -assign {20.86 0} -side TOP
editPin -pin reset -layer 2 -fixedPin -assign {21.42 0} -side TOP
editPin -pin spc_clk -layer 2 -fixedPin -assign {29.82 0} -side TOP
set_analysis_view -setup {setup_wc} -hold {hold_bc}
setNanoRouteMode -routeTopRoutingLayer 4
setNanoRouteMode -routeBottomRoutingLayer 1
encMessage info 1
encMessage warning 1
sroute
placeDesign -prePlaceOpt
refinePlace -checkRoute 0 -preserveRouting 0 -rmAffectedRouting 0 -swapEEQ 0 -checkPinLayerForAccess 1
timeDesign -preCTS
timeDesign -preCTS -hold
optDesign -preCTS -incr
set_ccopt_property buffer_cells { CKBD0BWP7T CKBD10BWP7T CKBD12BWP7T CKBD1BWP7T CKBD2BWP7T CKBD3BWP7T CKBD4BWP7T CKBD6BWP7T CKBD8BWP7T }
set_ccopt_property inverter_cells { CKND0BWP7T CKND10BWP7T CKND12BWP7T CKND1BWP7T CKND2BWP7T CKND3BWP7T CKND4BWP7T CKND6BWP7T CKND8BWP7T }
create_ccopt_clock_tree_spec
ccopt_design
timeDesign -postCTS
timeDesign -postCTS -hold
optDesign -postCTS -incr
optDesign -postCTS -hold
routeDesign -globalDetail
setNanoRouteMode -drouteUseMultiCutViaEffort high
setNanoRouteMode -droutePostRouteSwapVia multiCut
routeDesign -viaOpt
setAnalysisMode -analysisType onChipVariation
timeDesign -postRoute
timeDesign -postRoute -hold
optDesign -postRoute
optDesign -postRoute -hold
addFiller -cell FILL8BWP7T FILL64BWP7T FILL4BWP7T FILL32BWP7T FILL2BWP7T FILL1BWP7T FILL16BWP7T -prefix FILLER
verifyGeometry
verifyConnectivity
encMessage info 0
write_sdf ../out/$init_top_cell.sdf
saveDesign ../out/spc_clockgen.enc
streamOut ../out/spc_clockgen.gds -mapFile ./streamOut.map -libName TOP_DIG -units 2000 -mode ALL
saveNetlist ../out/spc_clockgen.v -excludeLeafCell
encMessage info 1
reportGateCount
win
panPage 0 1
panPage 0 1
gui_select -rect {4.258 328.507 53.211 282.947}
