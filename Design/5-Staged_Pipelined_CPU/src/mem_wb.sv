module mem_wb (
    input logic clk,
    input logic [4:0] rd_mem,
    output logic [4:0] rd_wb,
    input logic im_to_rf_mem,
    output logic im_to_rf_wb,
    input logic load_mem,
    output logic load_wb,
    input logic [31:0] alu_data_mem,
    output logic [31:0] alu_data_wb,
    input logic [31:0] dm_data_mem,
    output logic [31:0] dm_data_wb
);

    always_ff @(posedge clk) begin
        rd_wb <= rd_mem;
        im_to_rf_wb <= im_to_rf_mem;
        load_wb <= load_mem;
        alu_data_wb <= alu_data_mem;
        dm_data_wb <= dm_data_mem;
    end

endmodule