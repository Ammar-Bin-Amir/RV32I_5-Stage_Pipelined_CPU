module tb_id_ex;

    logic clk;
    logic [31:0] pc_id;
    logic [31:0] pc_ex;
    logic [31:0] pc_plus_4_id;
    logic [31:0] pc_plus_4_ex;
    logic [4:0] rd_id;
    logic [4:0] rd_ex;
    logic [2:0] func_3_id;
    logic [2:0] func_3_ex;
    logic func_7_bit_6_id;
    logic func_7_bit_6_ex;
    logic im_to_rf_id;
    logic im_to_rf_ex;
    logic store_id;
    logic store_ex;
    logic load_id;
    logic load_ex;
    logic branch_id;
    logic branch_ex;
    logic [1:0] alu_operand_a_selector_id;
    logic [1:0] alu_operand_a_selector_ex;
    logic alu_operand_b_selector_id;
    logic alu_operand_b_selector_ex;
    logic [1:0] next_pc_selector_id;
    logic [1:0] next_pc_selector_ex;
    logic [1:0] alu_operations_selector_id;
    logic [1:0] alu_operations_selector_ex;
    logic [31:0] rs1_data_id;
    logic [31:0] rs1_data_ex;
    logic [31:0] rs2_data_id;
    logic [31:0] rs2_data_ex;
    logic [31:0] i_type_id;
    logic [31:0] i_type_ex;
    logic [31:0] sb_type_id;
    logic [31:0] sb_type_ex;
    logic [31:0] uj_type_id;
    logic [31:0] uj_type_ex;
    logic [31:0] immediate_id;
    logic [31:0] immediate_ex;
    
    id_ex dut (
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

    always #10ns clk = ~clk;

    initial begin
        clk = 0;
        for (int i = 1; i <= 5; i++) begin
            #25ns 
            pc_id = $random;
            pc_plus_4_id = $random;
            rd_id = $random;
            func_3_id = $random;
            func_7_bit_6_id = $random;
            im_to_rf_id = $random;
            store_id = $random;
            load_id = $random;
            branch_id = $random;
            alu_operand_a_selector_id = $random;
            alu_operand_b_selector_id = $random;
            next_pc_selector_id = $random;
            alu_operations_selector_id = $random;
            rs1_data_id = $random;
            rs2_data_id = $random;
            i_type_id = $random;
            sb_type_id = $random;
            uj_type_id = $random;
            immediate_id = $random;
        end
        #25ns $finish;
    end

    initial begin
        $dumpfile("./temp/dump_id_ex.vcd");
        $dumpvars();
    end

endmodule