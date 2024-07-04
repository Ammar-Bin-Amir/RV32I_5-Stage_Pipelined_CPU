module tb_rom;

    logic [11:0] instruction_memory_address;
    logic [31:0] instruction_memory_data;

    rom dut ( .* );

    initial begin
        #10ns instruction_memory_address = 123;
        #50ns $finish;
    end

    initial begin
        $dumpfile("./temp/dump_rom.vcd");
        $dumpvars();
    end
    
endmodule : tb_rom