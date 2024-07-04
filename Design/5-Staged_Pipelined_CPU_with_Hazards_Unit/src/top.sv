module top (
    input logic clk,
    input logic rst
);
    
    typedef logic [31:0] data32_t;
    typedef logic [1:0]  data2_t;
    typedef logic [2:0]  data3_t;
    typedef logic [3:0]  data4_t;
    typedef logic [4:0]  data5_t;
    typedef logic [6:0]  data7_t;

    localparam [31:0] ZERO = '0;

    data32_t next_pc;
    data32_t pc_if;
    data32_t pc_id;
    data32_t pc_plus_4_if;
    data32_t pc_plus_4_id;
    data7_t  opcode_id;
    data5_t  rd_id;
    data3_t  func_3_id;
    data5_t  rs1_id;
    data5_t  rs2_id;
    logic    func_7_bit_6_id;
    data32_t im_data_if;
    data32_t im_data_id;
    logic    im_to_rf_id;
    logic    store_id;
    logic    load_id;
    logic    branch_id;
    data2_t  alu_operand_a_selector_id;
    logic    alu_operand_b_selector_id;
    data2_t  immediate_selector;
    data2_t  next_pc_selector_id;
    data3_t  alu_operations_selector_id;
    data32_t rs1_data_id;
    data32_t rs2_data_id;
    data32_t i_type_id;
    data32_t s_type;
    data32_t sb_type_id;
    data32_t u_type;
    data32_t uj_type_id;
    data32_t immediate_id;
    data32_t pc_ex;
    data32_t pc_plus_4_ex;
    data5_t  rd_ex;
    data3_t  func_3_ex;
    logic    func_7_bit_6_ex;
    logic    im_to_rf_ex;
    logic    store_ex;
    logic    load_ex;
    logic    branch_ex;
    data2_t  alu_operand_a_selector_ex;
    logic    alu_operand_b_selector_ex;
    data2_t  next_pc_selector_ex;
    data3_t  alu_operations_selector_ex;
    data32_t rs1_data_ex;
    data32_t rs2_data_ex;
    data32_t i_type_ex;
    data32_t sb_type_ex;
    data32_t uj_type_ex;
    data32_t immediate_ex;
    data4_t  alu_controller;
    data32_t operand_a;
    data32_t operand_b;
    data32_t alu_data_ex;
    logic    branch_selector;
    data32_t jump_i_type_ex;
    data32_t jump_sb_type_ex;
    data32_t pc_mem;
    data32_t pc_plus_4_mem;
    data5_t  rd_mem;
    logic    im_to_rf_mem;
    logic    store_mem;
    logic    load_mem;
    data2_t  next_pc_selector_mem;
    data32_t rs2_data_mem;
    data32_t uj_type_mem;
    data32_t alu_data_mem;
    data32_t jump_i_type_mem;
    data32_t jump_sb_type_mem;
    data32_t dm_data_mem;
    data5_t  rd_wb;
    logic    im_to_rf_wb;
    logic    load_wb;
    data32_t alu_data_wb;
    data32_t dm_data_wb;
    data32_t register_file_data;
    
    // Program Counter
    program_counter dut_program_counter (
        .clk,
        .rst,
        .next_pc,
        .pc      ( pc_if )
    );

    assign pc_plus_4_if = pc_if + 4;

    // Instruction Memory
    rom dut_instruction_memory (
        .instruction_memory_address ( pc_if[13:2] ),
        .instruction_memory_data    ( im_data_if  )
    );

    // Pipeline between Instruction Fetch and Instruction Decode
    if_id dut_if_id (
        .clk,
        .pc_if,
        .pc_id,
        .pc_plus_4_if,
        .pc_plus_4_id,
        .opcode_if        ( im_data_if[6:0]   ),
        .opcode_id,
        .rd_if            ( im_data_id[11:7]  ),
        .rd_id,
        .func_3_if        ( im_data_id[14:12] ),
        .func_3_id,
        .rs1_if           ( im_data_id[19:15] ),
        .rs1_id,
        .rs2_if           ( im_data_id[24:20] ),
        .rs2_id,
        .func_7_bit_6_if  ( im_data_id[30]    ),
        .func_7_bit_6_id,
        .im_data_if,
        .im_data_id
    );

    // Control Unit
    control_unit dut_control_unit (
        .opcode                  ( opcode_id                  ),
        .write                   ( im_to_rf_id                ),
        .store                   ( store_id                   ),
        .load                    ( load_id                    ),
        .branch                  ( branch_id                  ),
        .alu_operand_a_selector  ( alu_operand_a_selector_id  ),
        .alu_operand_b_selector  ( alu_operand_b_selector_id  ),
        .immediate_selector,
        .next_pc_selector        ( next_pc_selector_id        ),
        .alu_operations_selector ( alu_operations_selector_id )
    );

    // Register File
    register_file dut_register_file (
        .clk,
        .en                  ( im_to_rf_wb ),
        .register_file_data,
        .rd                  ( rd_wb       ),
        .rs1_address         ( rs1_id      ),
        .rs2_address         ( rs2_id      ),
        .rs1_data            ( rs1_data_id ),
        .rs2_data            ( rs2_data_id )
    );

    // Immediate Generator
    immediate_generator dut_immediate_generator (
        .instruction_memory_data ( im_data_id ),
        .program_counter         ( pc_id      ),
        .i_type                  ( i_type_id  ),
        .s_type,
        .sb_type                 ( sb_type_id ),
        .u_type,
        .uj_type                 ( uj_type_id )
    );

    always_comb begin : Immediate_Selector
        case (immediate_selector)
            0: immediate_id = i_type_id;
            1: immediate_id = u_type;
            2: immediate_id = s_type;
            default: immediate_id = ZERO;
        endcase
    end

    // Pipeline between Instruction Decode and Execute
    id_ex dut_id_ex (
        .clk,
        .pc_id,
        .pc_ex,
        .pc_plus_4_id,
        .pc_plus_4_ex,
        .rd_id,
        .rd_ex,
        .func_3_id,
        .func_3_ex,
        .func_7_bit_6_id,
        .func_7_bit_6_ex,
        .im_to_rf_id,
        .im_to_rf_ex,
        .store_id,
        .store_ex,
        .load_id,
        .load_ex,
        .branch_id,
        .branch_ex,
        .alu_operand_a_selector_id,
        .alu_operand_a_selector_ex,
        .alu_operand_b_selector_id,
        .alu_operand_b_selector_ex,
        .next_pc_selector_id,
        .next_pc_selector_ex,
        .alu_operations_selector_id,
        .alu_operations_selector_ex,
        .rs1_data_id,
        .rs1_data_ex,
        .rs2_data_id,
        .rs2_data_ex,
        .i_type_id,
        .i_type_ex,
        .sb_type_id,
        .sb_type_ex,
        .uj_type_id,
        .uj_type_ex,
        .immediate_id,
        .immediate_ex
    );

    // ALU Controller
    alu_controller dut_alu_controller (
        .func_7_bit_6            ( func_7_bit_6_ex            ),
        .func_3                  ( func_3_ex                  ),
        .alu_operations_selector ( alu_operations_selector_ex ),
        .alu_controller
    );

    always_comb begin : Operand_A
        case (alu_operand_a_selector_ex)
            0: operand_a = rs1_data_ex;
            1: operand_a = pc_plus_4_ex;
            2: operand_a = pc_ex;
            3: operand_a = ZERO;
            default: operand_a = rs1_data_ex;
        endcase
    end
    
    always_comb begin : Operand_B
        case (alu_operand_b_selector_ex)
            0: operand_b = rs2_data_ex;
            1: operand_b = immediate_ex;
            default: operand_b = rs2_data_ex;
        endcase
    end

    // ALU
    alu dut_alu (
        .operand_a,
        .operand_b,
        .alu_controller,
        .alu_data        ( alu_data_ex )
    );

    // Branch Selector
    branch_selector dut_branch_selector (
        .rs1             ( rs1_data_ex ),
        .rs2             ( rs2_data_ex ),
        .en              ( branch_ex   ),
        .func_3          ( func_3_ex   ),
        .branch_selector
    );

    always_comb begin : Jump_I_Type
        jump_i_type_ex = i_type_ex + rs1_data_ex;
    end

    always_comb begin : Jump_SB_Type
        case (branch_selector)
            0: jump_sb_type_ex = pc_plus_4_ex;
            1: jump_sb_type_ex = sb_type_ex;
            default: jump_sb_type_ex = pc_plus_4_ex;
        endcase
    end

    // Pipeline between Execute and Memory
    ex_mem dut_ex_mem (
        .clk,
        .pc_ex,
        .pc_mem,
        .pc_plus_4_ex,
        .pc_plus_4_mem,
        .rd_ex,
        .rd_mem,
        .im_to_rf_ex,
        .im_to_rf_mem,
        .store_ex,
        .store_mem,
        .load_ex,
        .load_mem,
        .next_pc_selector_ex,
        .next_pc_selector_mem,
        .rs2_data_ex,
        .rs2_data_mem,
        .uj_type_ex,
        .uj_type_mem,
        .alu_data_ex,
        .alu_data_mem,
        .jump_i_type_ex,
        .jump_i_type_mem,
        .jump_sb_type_ex,
        .jump_sb_type_mem
    );

    always_comb begin : Next_PC_Selector
        case (next_pc_selector_mem)
            0: next_pc = pc_plus_4_mem;
            1: next_pc = jump_i_type_mem;
            2: next_pc = jump_sb_type_mem;
            3: next_pc = uj_type_mem;
            default: next_pc = pc_plus_4_mem;
        endcase
    end

    // Data Memory
    ram dut_data_memory (
        .clk,
        .data_memory_address  ( alu_data_mem[13:2] ),
        .data_memory_data_in  ( rs2_data_mem       ),
        .store                ( store_mem          ),
        .load                 ( load_mem           ),
        .data_memory_data_out ( dm_data_mem        )
    );

    // Pipeline between Execute and Memory
    mem_wb dut_mem_wb (
        .clk,
        .rd_mem,
        .rd_wb,
        .im_to_rf_mem,
        .im_to_rf_wb,
        .load_mem,
        .load_wb,
        .alu_data_mem,
        .alu_data_wb,
        .dm_data_mem,
        .dm_data_wb
    );
    
    always_comb begin : Data_Memory_Selector
        case (load_wb)
            0: register_file_data = alu_data_wb;
            1: register_file_data = dm_data_wb;
            default: register_file_data = alu_data_wb;
        endcase
    end

endmodule : top