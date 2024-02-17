module id_ex (
    input logic clk,
    input logic [31:0] pc_id,
    output logic [31:0] pc_ex,
    input logic [31:0] pc_plus_4_id,
    output logic [31:0] pc_plus_4_ex,
    input logic [4:0] rd_id,
    output logic [4:0] rd_ex,
    input logic [2:0] func_3_id,
    output logic [2:0] func_3_ex,
    input logic func_7_bit_6_id,
    output logic func_7_bit_6_ex,
    input logic im_to_rf_id,
    output logic im_to_rf_ex,
    input logic store_id,
    output logic store_ex,
    input logic load_id,
    output logic load_ex,
    input logic branch_id,
    output logic branch_ex,
    input logic [1:0] alu_operand_a_selector_id,
    output logic [1:0] alu_operand_a_selector_ex,
    input logic alu_operand_b_selector_id,
    output logic alu_operand_b_selector_ex,
    input logic [1:0] next_pc_selector_id,
    output logic [1:0] next_pc_selector_ex,
    input logic [1:0] alu_operations_selector_id,
    output logic [1:0] alu_operations_selector_ex,
    input logic [31:0] rs1_data_id,
    output logic [31:0] rs1_data_ex,
    input logic [31:0] rs2_data_id,
    output logic [31:0] rs2_data_ex,
    input logic [31:0] i_type_id,
    output logic [31:0] i_type_ex,
    input logic [31:0] sb_type_id,
    output logic [31:0] sb_type_ex,
    input logic [31:0] uj_type_id,
    output logic [31:0] uj_type_ex,
    input logic [31:0] immediate_id,
    output logic [31:0] immediate_ex
);

    always_ff @(posedge clk) begin
        pc_ex <= pc_id;
        pc_plus_4_ex <= pc_plus_4_id;
        rd_ex <= rd_id;
        func_3_ex <= func_3_id;
        func_7_bit_6_ex <= func_7_bit_6_id;
        im_to_rf_ex <= im_to_rf_id;
        store_ex <= store_id;
        load_ex <= load_id;
        branch_ex <= branch_id;
        alu_operand_a_selector_ex <= alu_operand_a_selector_id;
        alu_operand_b_selector_ex <= alu_operand_b_selector_id;
        next_pc_selector_ex <= next_pc_selector_id;
        alu_operations_selector_ex <= alu_operations_selector_id;
        rs1_data_ex <= rs1_data_id;
        rs2_data_ex <= rs2_data_id;
        i_type_ex <= i_type_id;
        sb_type_ex <= sb_type_id;
        uj_type_ex <= uj_type_id;
        immediate_ex <= immediate_id;
    end

endmodule