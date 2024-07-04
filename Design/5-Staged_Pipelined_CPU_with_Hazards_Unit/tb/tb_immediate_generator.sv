module tb_immediate_generator;

    logic [31:0] instruction_memory_data;
    logic [31:0] program_counter;
    logic [31:0] i_type;
    logic [31:0] s_type;
    logic [31:0] sb_type;
    logic [31:0] u_type;
    logic [31:0] uj_type;

    immediate_generator dut ( .* );

    initial begin
        #10ns instruction_memory_data = 32'hFDB9_7531; program_counter = 32'hECA8_6420;
        #50ns instruction_memory_data = $random; program_counter = $random;
        #100ns $finish;
    end

    initial begin
        $dumpfile("./temp/dump_immediate_generator.vcd");
        $dumpvars();
    end

endmodule : tb_immediate_generator