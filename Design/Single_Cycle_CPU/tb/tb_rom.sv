module tb_rom;

    timeunit 1ns;
    timeprecision 1ps;

    logic [11:0] instruction_memory_address;
    logic [31:0] instruction_memory_data;

    rom dut (
        .instruction_memory_address,
        .instruction_memory_data
    );

    initial begin
        #10 instruction_memory_address = 123;
        #50 $finish;
    end

    initial begin
        $dumpfile("./temp/dump_rom.vcd");
        $dumpvars();
    end
    
endmodule