module tb_if_id;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic clk;
    logic [31:0] pc_if;
    logic [31:0] pc_id;
    logic [31:0] pc_plus_4_if;
    logic [31:0] pc_plus_4_id;
    logic [6:0] opcode_if;
    logic [6:0] opcode_id;
    logic [4:0] rd_if;
    logic [4:0] rd_id;
    logic [2:0] func_3_if;
    logic [2:0] func_3_id;
    logic [4:0] rs1_if;
    logic [4:0] rs1_id;
    logic [4:0] rs2_if;
    logic [4:0] rs2_id;
    logic func_7_bit_6_if;
    logic func_7_bit_6_id;
    logic [31:0] im_data_if;
    logic [31:0] im_data_id;
    
    if_id dut (
        .clk,
        .pc_if,
        .pc_id,
        .pc_plus_4_if,
        .pc_plus_4_id,
        .opcode_if,
        .opcode_id,
        .rd_if,
        .rd_id,
        .func_3_if,
        .func_3_id,
        .rs1_if,
        .rs1_id,
        .rs2_if,
        .rs2_id,
        .func_7_bit_6_if,
        .func_7_bit_6_id,
        .im_data_if,
        .im_data_id
    );

    always #10ns clk = ~clk;

    initial begin
        clk = 0;
        for (int i = 1; i <= 5; i++) begin
            #25ns 
            pc_if = $random;
            pc_plus_4_if = $random;
            opcode_if = $random;
            rd_if = $random;
            func_3_if = $random;
            rs1_if = $random;
            rs2_if = $random;
            func_7_bit_6_if = $random;
            im_data_if = $random;
        end
        #25ns $finish;
    end

endmodule