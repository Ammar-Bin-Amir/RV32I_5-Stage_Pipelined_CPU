module if_id (
    input logic clk,
    input logic [31:0] pc_if,
    output logic [31:0] pc_id,
    input logic [31:0] pc_plus_4_if,
    output logic [31:0] pc_plus_4_id,
    input logic [6:0] opcode_if,
    output logic [6:0] opcode_id,
    input logic [4:0] rd_if,
    output logic [4:0] rd_id,
    input logic [2:0] func_3_if,
    output logic [2:0] func_3_id,
    input logic [4:0] rs1_if,
    output logic [4:0] rs1_id,
    input logic [4:0] rs2_if,
    output logic [4:0] rs2_id,
    input logic func_7_bit_6_if,
    output logic func_7_bit_6_id,
    input logic [31:0] im_data_if,
    output logic [31:0] im_data_id
);
    
    always_ff @(posedge clk) begin
        pc_id <= pc_if;
        pc_plus_4_id <= pc_plus_4_if;
        opcode_id <= opcode_if;
        rd_id <= rd_if;
        func_3_id <= func_3_if;
        rs1_id <= rs1_if;
        rs2_id <= rs2_if;
        func_7_bit_6_id <= func_7_bit_6_if;
        im_data_id <= im_data_if;
    end

endmodule