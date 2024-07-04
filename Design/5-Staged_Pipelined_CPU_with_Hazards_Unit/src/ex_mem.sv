module ex_mem (
    input  logic        clk,
    input  logic [31:0] pc_ex,
    output logic [31:0] pc_mem,
    input  logic [31:0] pc_plus_4_ex,
    output logic [31:0] pc_plus_4_mem,
    input  logic [4:0]  rd_ex,
    output logic [4:0]  rd_mem,
    input  logic        im_to_rf_ex,
    output logic        im_to_rf_mem,
    input  logic        store_ex,
    output logic        store_mem,
    input  logic        load_ex,
    output logic        load_mem,
    input  logic [1:0]  next_pc_selector_ex,
    output logic [1:0]  next_pc_selector_mem,
    input  logic [31:0] rs2_data_ex,
    output logic [31:0] rs2_data_mem,
    input  logic [31:0] uj_type_ex,
    output logic [31:0] uj_type_mem,
    input  logic [31:0] alu_data_ex,
    output logic [31:0] alu_data_mem,
    input  logic [31:0] jump_i_type_ex,
    output logic [31:0] jump_i_type_mem,
    input  logic [31:0] jump_sb_type_ex,
    output logic [31:0] jump_sb_type_mem
);

    always_ff @(posedge clk) begin
        pc_mem               <= pc_ex;
        pc_plus_4_mem        <= pc_plus_4_ex;
        rd_mem               <= rd_ex;
        im_to_rf_mem         <= im_to_rf_ex;
        store_mem            <= store_ex;
        load_mem             <= load_ex;
        next_pc_selector_mem <= next_pc_selector_ex;
        rs2_data_mem         <= rs2_data_ex;
        uj_type_mem          <= uj_type_ex;
        alu_data_mem         <= alu_data_ex;
        jump_i_type_mem      <= jump_i_type_ex;
        jump_sb_type_mem     <= jump_sb_type_ex;
    end

endmodule : ex_mem