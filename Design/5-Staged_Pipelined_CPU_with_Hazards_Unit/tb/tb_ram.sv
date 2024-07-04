module tb_ram;

    logic        clk;
    logic [11:0] data_memory_address;
    logic [31:0] data_memory_data_in;
    logic        store;
    logic        load;
    logic [31:0] data_memory_data_out;

    ram dut ( .* );

    initial clk = 0;
    always #10ns clk = ~clk;
    
    initial begin
        #20ns data_memory_address = 0; data_memory_data_in = 0; store = 0; load = 0;
        #25ns data_memory_address = 123; data_memory_data_in = 32'h1234_cdef;
        #50ns store = 1;
        #50ns load = 1;
        #10ns data_memory_address = 12'hfff; data_memory_data_in = 32'hffff_ffff; store = 1; load = 1;
        #100ns $finish;
    end

    initial begin
        $dumpfile("./temp/dump_ram.vcd");
        $dumpvars();
    end

endmodule : tb_ram