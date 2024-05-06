module tb_ex_mem;

    logic clk;
    logic [31:0] pc_ex;
    logic [31:0] pc_mem;
    logic [31:0] pc_plus_4_ex;
    logic [31:0] pc_plus_4_mem;
    logic [4:0] rd_ex;
    logic [4:0] rd_mem;
    logic im_to_rf_ex;
    logic im_to_rf_mem;
    logic store_ex;
    logic store_mem;
    logic load_ex;
    logic load_mem;
    logic [1:0] next_pc_selector_ex;
    logic [1:0] next_pc_selector_mem;
    logic [31:0] rs2_data_ex;
    logic [31:0] rs2_data_mem;
    logic [31:0] uj_type_ex;
    logic [31:0] uj_type_mem;
    logic [31:0] alu_data_ex;
    logic [31:0] alu_data_mem;
    logic [31:0] jump_i_type_ex;
    logic [31:0] jump_i_type_mem;
    logic [31:0] jump_sb_type_ex;
    logic [31:0] jump_sb_type_mem;

    ex_mem dut (
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

    always #10ns clk = ~clk;

    initial begin
        clk = 0;
        for (int i = 1; i <= 5; i++) begin
            #25ns
            pc_ex = $random;
            pc_plus_4_ex = $random;
            rd_ex = $random;
            im_to_rf_ex = $random;
            store_ex = $random;
            load_ex = $random;
            next_pc_selector_ex = $random;
            rs2_data_ex = $random;
            uj_type_ex = $random;
            alu_data_ex = $random;
            jump_i_type_ex = $random;
            jump_sb_type_ex = $random;
        end
        #25ns $finish;
    end

    initial begin
        $dumpfile("./temp/dump_ex_mem.vcd");
        $dumpvars();
    end

endmodule