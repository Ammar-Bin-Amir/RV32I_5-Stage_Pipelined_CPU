### =================== ###
### SYSTEMVERILOG FILES ###
### =================== ###

# Program Counter

SRC_PROGRAM_COUNTER = src/program_counter.sv
TB_PROGRAM_COUNTER  = tb/tb_program_counter.sv
TOP_PROGRAM_COUNTER = tb_program_counter
VCD_PROGRAM_COUNTER = vcd_program_counter

# ROM

SRC_ROM = src/rom.sv
TB_ROM  = tb/tb_rom.sv
TOP_ROM = tb_rom
VCD_ROM = vcd_rom

# Pipeline between Instruction Fetch Stage and Instruction Decode Stage

SRC_IF_ID = src/if_id.sv
TB_IF_ID  = tb/tb_if_id.sv
TOP_IF_ID = tb_if_id
VCD_IF_ID = vcd_if_id

# Type Decoder

SRC_TYPE_DECODER = src/type_decoder.sv
TB_TYPE_DECODER  = tb/tb_type_decoder.sv
TOP_TYPE_DECODER = tb_type_decoder
VCD_TYPE_DECODER = vcd_type_decoder

# Control Decoder

SRC_CONTROL_DECODER = src/control_decoder.sv
TB_CONTROL_DECODER  = tb/tb_control_decoder.sv
TOP_CONTROL_DECODER = tb_control_decoder
VCD_CONTROL_DECODER = vcd_control_decoder

# Control Unit

SRC_CONTROL_UNIT = src/control_unit.sv
TB_CONTROL_UNIT  = tb/tb_control_unit.sv
TOP_CONTROL_UNIT = tb_control_unit
VCD_CONTROL_UNIT = vcd_control_unit

# Register File

SRC_REGISTER_FILE = src/register_file.sv
TB_REGISTER_FILE  = tb/tb_register_file.sv
TOP_REGISTER_FILE = tb_register_file
VCD_REGISTER_FILE = vcd_register_file

# Immediate Generator

SRC_IMMEDIATE_GENERATOR = src/immediate_generator.sv
TB_IMMEDIATE_GENERATOR  = tb/tb_immediate_generator.sv
TOP_IMMEDIATE_GENERATOR = tb_immediate_generator
VCD_IMMEDIATE_GENERATOR = vcd_immediate_generator

# Pipeline between Instruction Decode Stage and Execute Stage

SRC_ID_EX = src/id_ex.sv
TB_ID_EX  = tb/tb_id_ex.sv
TOP_ID_EX = tb_id_ex
VCD_ID_EX = vcd_id_ex

# ALU Controller

SRC_ALU_CONTROLLER = src/alu_controller.sv
TB_ALU_CONTROLLER  = tb/tb_alu_controller.sv
TOP_ALU_CONTROLLER = tb_alu_controller
VCD_ALU_CONTROLLER = vcd_alu_controller

# ALU

SRC_ALU = src/alu.sv
TB_ALU  = tb/tb_alu.sv
TOP_ALU = tb_alu
VCD_ALU = vcd_alu

# Branch Selector

SRC_BRANCH_SELECTOR = src/branch_selector.sv
TB_BRANCH_SELECTOR  = tb/tb_branch_selector.sv
TOP_BRANCH_SELECTOR = tb_branch_selector
VCD_BRANCH_SELECTOR = vcd_branch_selector

# Pipeline between Execute Stage and Memory Stage

SRC_EX_MEM = src/ex_mem.sv
TB_EX_MEM  = tb/tb_ex_mem.sv
TOP_EX_MEM = tb_ex_mem
VCD_EX_MEM = vcd_ex_mem

# RAM

SRC_RAM = src/ram.sv
TB_RAM  = tb/tb_ram.sv
TOP_RAM = tb_ram
VCD_RAM = vcd_ram

# Pipeline between Memory Stage and Write Back

SRC_MEM_WB = src/mem_wb.sv
TB_MEM_WB  = tb/tb_mem_wb.sv
TOP_MEM_WB = tb_mem_wb
VCD_MEM_WB = vcd_mem_wb

# TOP

FLIST = flist.txt
SRC   = src/top.sv
TB    = tb/tb_top.sv
TOP   = tb_top
VCD   = vcd

### ======= ###
### TARGETS ###
### ======= ###

all: top

everything: program_counter rom if_id type_decoder control_decoder control_unit register_file immediate_generator id_ex alu_controller alu branch_selector ex_mem ram mem_wb top

# Target: Program Counter

program_counter: compile_program_counter elaborate_program_counter simulate_program_counter

compile_program_counter:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	xvlog -sv $(TB_PROGRAM_COUNTER) $(SRC_PROGRAM_COUNTER)

elaborate_program_counter: compile_program_counter
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	xelab -debug typical -top $(TOP_PROGRAM_COUNTER) -snapshot $(VCD_PROGRAM_COUNTER) -timescale "1ns/1ps"

simulate_program_counter: elaborate_program_counter
	@echo ""
	@echo "Simulating ..."
	@echo ""
	xsim $(VCD_PROGRAM_COUNTER) -tclbatch xsim_cfg.tcl

# Target: ROM

rom: compile_rom elaborate_rom simulate_rom

compile_rom:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	xvlog -sv $(TB_ROM) $(SRC_ROM)

elaborate_rom: compile_rom
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	xelab -debug typical -top $(TOP_ROM) -snapshot $(VCD_ROM) -timescale "1ns/1ps"

simulate_rom: elaborate_rom
	@echo ""
	@echo "Simulating ..."
	@echo ""
	xsim $(VCD_ROM) -tclbatch xsim_cfg.tcl

# Target: Instruction Fetch Stage Pipelined Instruction Decode

if_id: compile_if_id elaborate_if_id simulate_if_id

compile_if_id:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	xvlog -sv $(TB_IF_ID) $(SRC_IF_ID)

elaborate_if_id: compile_if_id
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	xelab -debug typical -top $(TOP_IF_ID) -snapshot $(VCD_IF_ID) -timescale "1ns/1ps"

simulate_if_id: elaborate_if_id
	@echo ""
	@echo "Simulating ..."
	@echo ""
	xsim $(VCD_IF_ID) -tclbatch xsim_cfg.tcl

# Target: Type Decoder

type_decoder: compile_type_decoder elaborate_type_decoder simulate_type_decoder

compile_type_decoder:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	xvlog -sv $(TB_TYPE_DECODER) $(SRC_TYPE_DECODER)

elaborate_type_decoder: compile_type_decoder
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	xelab -debug typical -top $(TOP_TYPE_DECODER) -snapshot $(VCD_TYPE_DECODER) -timescale "1ns/1ps"

simulate_type_decoder: elaborate_type_decoder
	@echo ""
	@echo "Simulating ..."
	@echo ""
	xsim $(VCD_TYPE_DECODER) -tclbatch xsim_cfg.tcl

# Target: Control Decoder

control_decoder: compile_control_decoder elaborate_control_decoder simulate_control_decoder

compile_control_decoder:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	xvlog -sv $(TB_CONTROL_DECODER) $(SRC_CONTROL_DECODER)

elaborate_control_decoder: compile_control_decoder
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	xelab -debug typical -top $(TOP_CONTROL_DECODER) -snapshot $(VCD_CONTROL_DECODER) -timescale "1ns/1ps"

simulate_control_decoder: elaborate_control_decoder
	@echo ""
	@echo "Simulating ..."
	@echo ""
	xsim $(VCD_CONTROL_DECODER) -tclbatch xsim_cfg.tcl

# Target: Control Unit

control_unit: compile_control_unit elaborate_control_unit simulate_control_unit

compile_control_unit:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	xvlog -sv $(TB_CONTROL_UNIT) $(SRC_CONTROL_UNIT) $(SRC_TYPE_DECODER) $(SRC_CONTROL_DECODER)

elaborate_control_unit: compile_control_unit
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	xelab -debug typical -top $(TOP_CONTROL_UNIT) -snapshot $(VCD_CONTROL_UNIT) -timescale "1ns/1ps"

simulate_control_unit: elaborate_control_unit
	@echo ""
	@echo "Simulating ..."
	@echo ""
	xsim $(VCD_CONTROL_UNIT) -tclbatch xsim_cfg.tcl

# Target: Register File

register_file: compile_register_file elaborate_register_file simulate_register_file

compile_register_file:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	xvlog -sv $(TB_REGISTER_FILE) $(SRC_REGISTER_FILE)

elaborate_register_file: compile_register_file
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	xelab -debug typical -top $(TOP_REGISTER_FILE) -snapshot $(VCD_REGISTER_FILE) -timescale "1ns/1ps"

simulate_register_file: elaborate_register_file
	@echo ""
	@echo "Simulating ..."
	@echo ""
	xsim $(VCD_REGISTER_FILE) -tclbatch xsim_cfg.tcl

# Target: Immediate Generator

immediate_generator: compile_immediate_generator elaborate_immediate_generator simulate_immediate_generator

compile_immediate_generator:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	xvlog -sv $(TB_IMMEDIATE_GENERATOR) $(SRC_IMMEDIATE_GENERATOR)

elaborate_immediate_generator: compile_immediate_generator
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	xelab -debug typical -top $(TOP_IMMEDIATE_GENERATOR) -snapshot $(VCD_IMMEDIATE_GENERATOR) -timescale "1ns/1ps"

simulate_immediate_generator: elaborate_immediate_generator
	@echo ""
	@echo "Simulating ..."
	@echo ""
	xsim $(VCD_IMMEDIATE_GENERATOR) -tclbatch xsim_cfg.tcl

# Target: Instruction Decode Pipelined Execute Stage

id_ex: compile_id_ex simulate_id_ex simulate_id_ex

compile_id_ex:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	xvlog -sv $(TB_ID_EX) $(SRC_ID_EX)

elaborate_id_ex: compile_id_ex
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	xelab -debug typical -top $(TOP_ID_EX) -snapshot $(VCD_ID_EX) -timescale "1ns/1ps"

simulate_id_ex: elaborate_id_ex
	@echo ""
	@echo "Simulating ..."
	@echo ""
	xsim $(VCD_ID_EX) -tclbatch xsim_cfg.tcl

# Target: ALU Controller

alu_controller: compile_alu_controller simulate_alu_controller simulate_alu_controller

compile_alu_controller:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	xvlog -sv $(TB_ALU_CONTROLLER) $(SRC_ALU_CONTROLLER)

elaborate_alu_controller: compile_alu_controller
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	xelab -debug typical -top $(TOP_ALU_CONTROLLER) -snapshot $(VCD_ALU_CONTROLLER) -timescale "1ns/1ps"

simulate_alu_controller: elaborate_alu_controller
	@echo ""
	@echo "Simulating ..."
	@echo ""
	xsim $(VCD_ALU_CONTROLLER) -tclbatch xsim_cfg.tcl

# Target: ALU

alu: compile_alu elaborate_alu simulate_alu

compile_alu:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	xvlog -sv $(TB_ALU) $(SRC_ALU)

elaborate_alu: compile_alu
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	xelab -debug typical -top $(TOP_ALU) -snapshot $(VCD_ALU) -timescale "1ns/1ps"

simulate_alu: elaborate_alu
	@echo ""
	@echo "Simulating ..."
	@echo ""
	xsim $(VCD_ALU) -tclbatch xsim_cfg.tcl

# Target: Branch Selector

branch_selector: compile_branch_selector elaborate_branch_selector simulate_branch_selector

compile_branch_selector:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	xvlog -sv $(SRC_BRANCH_SELECTOR) $(TB_BRANCH_SELECTOR)

elaborate_branch_selector: compile_branch_selector
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	xelab -debug typical -top $(TOP_BRANCH_SELECTOR) -snapshot $(VCD_BRANCH_SELECTOR) -timescale "1ns/1ps"

simulate_branch_selector: elaborate_branch_selector
	@echo ""
	@echo "Simulating ..."
	@echo ""
	xsim $(VCD_BRANCH_SELECTOR) -tclbatch xsim_cfg.tcl

# Target: Instruction Fetch Stage Pipelined Instruction Decode

ex_mem: compile_ex_mem elaborate_ex_mem simulate_ex_mem

compile_ex_mem:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	xvlog -sv $(TB_EX_MEM) $(SRC_EX_MEM)

elaborate_ex_mem: compile_ex_mem
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	xelab -debug typical -top $(TOP_EX_MEM) -snapshot $(VCD_EX_MEM) -timescale "1ns/1ps"

simulate_ex_mem: elaborate_ex_mem
	@echo ""
	@echo "Simulating ..."
	@echo ""
	xsim $(VCD_EX_MEM) -tclbatch xsim_cfg.tcl

# Target: RAM

ram: compile_ram simulate_ram simulate_ram

compile_ram:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	xvlog -sv $(TB_RAM) $(SRC_RAM)

elaborate_ram: compile_ram
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	xelab -debug typical -top $(TOP_RAM) -snapshot $(VCD_RAM) -timescale "1ns/1ps"

simulate_ram: elaborate_ram
	@echo ""
	@echo "Simulating ..."
	@echo ""
	xsim $(VCD_RAM) -tclbatch xsim_cfg.tcl

# Target: Instruction Fetch Stage Pipelined Instruction Decode

mem_wb: compile_mem_wb elaborate_mem_wb simulate_mem_wb

compile_mem_wb:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	xvlog -sv $(TB_MEM_WB) $(SRC_MEM_WB)

elaborate_mem_wb: compile_mem_wb
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	xelab -debug typical -top $(TOP_MEM_WB) -snapshot $(VCD_MEM_WB) -timescale "1ns/1ps"

simulate_mem_wb: elaborate_mem_wb
	@echo ""
	@echo "Simulating ..."
	@echo ""
	xsim $(VCD_MEM_WB) -tclbatch xsim_cfg.tcl

# Target: MAIN

top: simulate_top

compile_top:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	xvlog -sv $(TB) $(SRC) -f $(FLIST)

elaborate_top: compile_top
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	xelab -debug typical -top $(TOP) -snapshot $(VCD) -timescale "1ns/1ps"

simulate_top: elaborate_top
	@echo ""
	@echo "Simulating ..."
	@echo ""
	xsim $(VCD) -autoloadwcfg -tclbatch xsim_cfg.tcl

# Target: Clean

clean:
	rm -rf *.jou *.log *.pb
	rm -rf *.wdb *.wcfg *.str
	rm -rf .*.timestamp
	rm -rf xsim.dir
	rm -rf temp
	rm -rf .Xil

