module control_decoder (
    input  logic       r_type,
    input  logic       i_type_lw,
    input  logic       i_type_addi,
    input  logic       i_type_jalr,
    input  logic       s_type,
    input  logic       sb_type,
    input  logic       u_type_auipc,
    input  logic       u_type_lui,
    input  logic       uj_type,
    output logic       write,
    output logic       store,
    output logic       load,
    output logic       branch,
    output logic [1:0] alu_operand_a_selector,
    output logic       alu_operand_b_selector,
    output logic [1:0] immediate_selector,
    output logic [1:0] next_pc_selector,
    output logic [2:0] alu_operations_selector
);
    
    localparam ZERO = 1'b0;
    
    // Write
    assign write = r_type | i_type_lw | i_type_addi | i_type_jalr | u_type_auipc | u_type_lui | uj_type;

    // Store
    assign store = s_type;

    // Load
    assign load = i_type_lw;

    // Branch
    assign branch = sb_type;
    
    // ALU Operand A Selector
    assign alu_operand_a_selector[0] = i_type_jalr | uj_type |ZERO;
    assign alu_operand_a_selector[1] = u_type_auipc | ZERO;

    // ALU Operand B Selector
    assign alu_operand_b_selector = i_type_lw | i_type_addi | i_type_jalr | s_type | u_type_auipc | u_type_lui;

    // Immediate Selector
    assign immediate_selector[0] = (~i_type_lw) & (~i_type_addi) & (~i_type_jalr) & (~s_type);
    assign immediate_selector[1] = (~i_type_lw) & (~i_type_addi) & (~i_type_jalr) & (~u_type_auipc) & (~u_type_lui);

    // Next PC Selector
    assign next_pc_selector[0] = i_type_jalr | uj_type;
    assign next_pc_selector[1] = sb_type | uj_type;

    // ALU Operations Selector
    assign alu_operations_selector[0] = s_type | u_type_auipc | u_type_lui | uj_type;
    assign alu_operations_selector[1] = i_type_addi | i_type_jalr | u_type_lui | uj_type;
    assign alu_operations_selector[2] = i_type_lw | i_type_jalr | u_type_auipc | uj_type;

endmodule : control_decoder