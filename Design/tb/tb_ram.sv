module tb_ram;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic clk;
    logic [11:0] data_memory_address;
    logic [31:0] data_memory_data_in;
    logic store;
    logic load;
    wire [31:0] data_memory_data_out;

    ram dut (
        .clk,
        .data_memory_address,
        .data_memory_data_in,
        .store,
        .load,
        .data_memory_data_out
    );

    initial clk = 0;
    always #10 clk = ~clk;
    
    initial begin
        #20 data_memory_address = 0; data_memory_data_in = 0; store = 0; load = 0;
        #25 data_memory_address = 123; data_memory_data_in = 32'h1234_cdef;
        #50 store = 1;
        #50 load = 1;
        #10 data_memory_address = 12'hfff; data_memory_data_in = 32'hffff_ffff; store = 1; load = 1;
        #100 $finish;
    end

endmodule