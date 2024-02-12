module top (
    input logic clk,
    input logic rst
);
    
    typedef logic [31:0] data32_t;
    typedef logic [1:0] data2_t;
    typedef logic [2:0] data3_t;
    typedef logic [3:0] data4_t;

    localparam [31:0] ZERO = '0;

    data32_t next_pc;
    data32_t pc;
    data32_t pc_plus_4;
    data32_t instruction_memory_data;
    logic write;
    logic store;
    logic load;
    logic branch;
    data2_t alu_operand_a_selector;
    logic alu_operand_b_selector;
    data2_t immediate_selector;
    data2_t next_pc_selector;
    data3_t alu_operations_selector;
    data32_t rs1_data;
    data32_t rs2_data;
    data32_t register_file_data;
    data32_t i_type;
    data32_t s_type;
    data32_t sb_type;
    data32_t u_type;
    data32_t uj_type;
    data32_t immediate;
    data4_t alu_controller;
    data32_t operand_a;
    data32_t operand_b;
    data32_t alu_data;
    data32_t data_memory_data;
    logic branch_selector;
    data32_t jump_i_type;
    data32_t jump_sb_type;
    
    // Program Counter
    program_counter dut_program_counter (
        .clk,
        .rst,
        .next_pc,
        .pc
    );

    assign pc_plus_4 = pc + 4;

    // Instruction Memory
    rom dut_instruction_memory (
        .instruction_memory_address (pc[13:2]),
        .instruction_memory_data
    );

    // Control Unit
    control_unit dut_control_unit (
        .opcode (instruction_memory_data[6:0]),
        .write,
        .store,
        .load,
        .branch,
        .alu_operand_a_selector,
        .alu_operand_b_selector,
        .immediate_selector,
        .next_pc_selector,
        .alu_operations_selector
    );

    // Register File
    register_file dut_register_file (
        .clk,
        .en (write),
        .register_file_data,
        .rd (instruction_memory_data[11:7]),
        .rs1_address (instruction_memory_data[19:15]),
        .rs2_address (instruction_memory_data[24:20]),
        .rs1_data,
        .rs2_data
    );

    // Immediate Generator
    immediate_generator dut_immediate_generator (
        .instruction_memory_data,
        .program_counter (pc),
        .i_type,
        .s_type,
        .sb_type,
        .u_type,
        .uj_type
    );

    always_comb begin : Immediate_Selector
        case (immediate_selector)
            0: immediate = i_type;
            1: immediate = u_type;
            2: immediate = s_type;
            default: immediate = ZERO;
        endcase
    end

    // ALU Controller
    alu_controller dut_alu_controller (
        .func_7_bit_6 (instruction_memory_data[30]),
        .func_3 (instruction_memory_data[14:12]),
        .alu_operations_selector,
        .alu_controller
    );

    always_comb begin : Operand_A
        case (alu_operand_a_selector)
            0: operand_a = rs1_data;
            1: operand_a = pc_plus_4;
            2: operand_a = pc;
            3: operand_a = ZERO;
            default: operand_a = rs1_data;
        endcase
    end
    
    always_comb begin : Operand_B
        case (alu_operand_b_selector)
            0: operand_b = rs2_data;
            1: operand_b = immediate;
            default: operand_b = rs2_data;
        endcase
    end

    // ALU
    alu dut_alu (
        .operand_a,
        .operand_b,
        .alu_controller,
        .alu_data
    );

    // Data Memory
    ram dut_data_memory (
        .clk,
        .data_memory_address (alu_data[13:2]),
        .data_memory_data_in (rs2_data),
        .store,
        .load,
        .data_memory_data_out (data_memory_data)
    );

    always_comb begin : Data_Memory_Selector
        case (load)
            0: register_file_data = alu_data;
            1: register_file_data = data_memory_data;
            default: register_file_data = alu_data;
        endcase
    end

    // Branch Selector
    branch_selector dut_branch_selector (
        .rs1 (rs1_data),
        .rs2 (rs2_data),
        .en (branch),
        .func_3 (instruction_memory_data[14:12]),
        .branch_selector
    );

    always_comb begin : Jump_I_Type
        jump_i_type = i_type + rs1_data;
    end

    always_comb begin : Jump_SB_Type
        case (branch_selector)
            0: jump_sb_type = pc_plus_4;
            1: jump_sb_type = sb_type;
            default: jump_sb_type = pc_plus_4;
        endcase
    end

    always_comb begin : Next_PC_Selector
        case (next_pc_selector)
            0: next_pc = pc_plus_4;
            1: next_pc = jump_i_type;
            2: next_pc = jump_sb_type;
            3: next_pc = uj_type;
            default: next_pc = pc_plus_4;
        endcase
    end

endmodule