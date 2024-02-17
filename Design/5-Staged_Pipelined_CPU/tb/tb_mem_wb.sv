module tb_mem_wb;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic clk;
    logic [4:0] rd_mem;
    logic [4:0] rd_wb;
    logic im_to_rf_mem;
    logic im_to_rf_wb;
    logic load_mem;
    logic load_wb;
    logic [31:0] alu_data_mem;
    logic [31:0] alu_data_wb;
    logic [31:0] dm_data_mem;
    logic [31:0] dm_data_wb;

    mem_wb dut (
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

    always #10ns clk = ~clk;

    initial begin
        clk = 0;
        for (int i = 1; i <= 5; i++) begin
            #25ns
            rd_mem = $random;
            im_to_rf_mem = $random;
            load_mem = $random;
            alu_data_mem = $random;
            dm_data_mem = $random;
        end
        #25ns $finish;
    end

endmodule