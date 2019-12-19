transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {d:/intelfpga/17.1/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {d:/intelfpga/17.1/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {d:/intelfpga/17.1/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {d:/intelfpga/17.1/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {d:/intelfpga/17.1/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cyclone10lp_ver
vmap cyclone10lp_ver ./verilog_libs/cyclone10lp_ver
vlog -vlog01compat -work cyclone10lp_ver {d:/intelfpga/17.1/quartus/eda/sim_lib/cyclone10lp_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/WorkSpace/project/FPGA/prj_q5/prj_q5/src/USB {E:/WorkSpace/project/FPGA/prj_q5/prj_q5/src/USB/usb_master.v}
vlog -vlog01compat -work work +incdir+E:/WorkSpace/project/FPGA/prj_q5/prj_q5/src/MDIO {E:/WorkSpace/project/FPGA/prj_q5/prj_q5/src/MDIO/mdio_opr.v}
vlog -vlog01compat -work work +incdir+E:/WorkSpace/project/FPGA/prj_q5/prj_q5/src/MDIO {E:/WorkSpace/project/FPGA/prj_q5/prj_q5/src/MDIO/mdio_cfg.v}
vlog -vlog01compat -work work +incdir+E:/WorkSpace/project/FPGA/prj_q5/prj_q5/src/TM1640 {E:/WorkSpace/project/FPGA/prj_q5/prj_q5/src/TM1640/TM1640_driver.v}
vlog -vlog01compat -work work +incdir+E:/WorkSpace/project/FPGA/prj_q5/prj_q5/src/TM1640 {E:/WorkSpace/project/FPGA/prj_q5/prj_q5/src/TM1640/TM1640_cfg.v}
vlog -vlog01compat -work work +incdir+E:/WorkSpace/project/FPGA/prj_q5/prj_q5/src/IIC {E:/WorkSpace/project/FPGA/prj_q5/prj_q5/src/IIC/iic_opr.v}
vlog -vlog01compat -work work +incdir+E:/WorkSpace/project/FPGA/prj_q5/prj_q5/src {E:/WorkSpace/project/FPGA/prj_q5/prj_q5/src/prj_q5.v}
vlog -vlog01compat -work work +incdir+E:/WorkSpace/project/FPGA/prj_q5/prj_q5/src/QIP {E:/WorkSpace/project/FPGA/prj_q5/prj_q5/src/QIP/sysclk_source.v}
vlog -vlog01compat -work work +incdir+E:/WorkSpace/project/FPGA/prj_q5/prj_q5 {E:/WorkSpace/project/FPGA/prj_q5/prj_q5/USB_RAM.v}
vlog -vlog01compat -work work +incdir+E:/WorkSpace/project/FPGA/prj_q5/prj_q5/db {E:/WorkSpace/project/FPGA/prj_q5/prj_q5/db/sysclk_source_altpll.v}

vlog -vlog01compat -work work +incdir+E:/WorkSpace/project/FPGA/prj_q5/prj_q5/simulation/modelsim {E:/WorkSpace/project/FPGA/prj_q5/prj_q5/simulation/modelsim/prj_q5.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclone10lp_ver -L rtl_work -L work -voptargs="+acc"  top_tb

add wave *
view structure
view signals
run -all
