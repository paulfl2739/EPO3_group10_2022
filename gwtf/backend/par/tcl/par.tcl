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

source ../in/pins.tcl

set_analysis_view -setup {setup_wc} -hold {hold_bc}
setNanoRouteMode -routeTopRoutingLayer 4
setNanoRouteMode -routeBottomRoutingLayer 1

encMessage info 1
encMessage warning 1
#
sroute
placeDesign -prePlaceOpt
refinePlace -checkRoute 0 -preserveRouting 0 -rmAffectedRouting 0 -swapEEQ 0 -checkPinLayerForAccess 1
timeDesign -preCTS
timeDesign -preCTS -hold
optDesign -preCTS -incr
#

set_ccopt_property buffer_cells { CKBD0BWP7T CKBD10BWP7T CKBD12BWP7T CKBD1BWP7T CKBD2BWP7T CKBD3BWP7T CKBD4BWP7T CKBD6BWP7T CKBD8BWP7T }
set_ccopt_property inverter_cells { CKND0BWP7T CKND10BWP7T CKND12BWP7T CKND1BWP7T CKND2BWP7T CKND3BWP7T CKND4BWP7T CKND6BWP7T CKND8BWP7T }
create_ccopt_clock_tree_spec
ccopt_design

timeDesign -postCTS
timeDesign -postCTS -hold
optDesign -postCTS -incr
optDesign -postCTS -hold
#
routeDesign -globalDetail
setNanoRouteMode -drouteUseMultiCutViaEffort high
setNanoRouteMode -droutePostRouteSwapVia multiCut
routeDesign -viaOpt
#
setAnalysisMode -analysisType onChipVariation
timeDesign -postRoute
timeDesign -postRoute -hold
optDesign -postRoute
optDesign -postRoute -hold
#
addFiller -cell FILL8BWP7T FILL64BWP7T FILL4BWP7T FILL32BWP7T FILL2BWP7T FILL1BWP7T FILL16BWP7T -prefix FILLER
#
verifyGeometry
verifyConnectivity
#
encMessage info 0
write_sdf ../out/$init_top_cell.sdf
saveDesign ../out/$init_top_cell.enc
streamOut ../out/$init_top_cell.gds -mapFile ./streamOut.map -libName TOP_DIG -units 2000 -mode ALL
saveNetlist ../out/$init_top_cell.v -excludeLeafCell
encMessage info 1
#
reportGateCount
win
