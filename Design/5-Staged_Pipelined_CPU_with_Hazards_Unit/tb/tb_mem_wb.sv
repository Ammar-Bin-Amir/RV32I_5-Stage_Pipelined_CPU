module tb_mem_wb;

    logic        clk;
    logic [4:0]  rd_mem;
    logic [4:0]  rd_wb;
    logic        im_to_rf_mem;
    logic        im_to_rf_wb;
    logic        load_mem;
    logic        load_wb;
    logic [31:0] alu_data_mem;
    logic [31:0] alu_data_wb;
    logic [31:0] dm_data_mem;
    logic [31:0] dm_data_wb;

    mem_wb dut ( .* );

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

    initial begin
        $dumpfile("./temp/dump_mem_wb.vcd");
        $dumpvars();
    end

endmodule : tb_mem_wb