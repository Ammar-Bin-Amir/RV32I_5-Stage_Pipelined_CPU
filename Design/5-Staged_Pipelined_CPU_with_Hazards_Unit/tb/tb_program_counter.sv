module tb_program_counter;

    logic        clk;
    logic        rst;
    logic [31:0] next_pc;
    logic [31:0] pc;

    program_counter dut ( .* );

    initial clk = 0;
    always #10ns clk = ~clk;

    initial begin
        for (int i = 1; i <= 25; i++) begin
            #25ns rst = $random; next_pc = $random;
        end
        #10ns $finish;
    end

    initial begin
        $dumpfile("./temp/dump_program_counter.vcd");
        $dumpvars();
    end

endmodule : tb_program_counter