module tb_program_counter;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic clk;
    logic rst;
    logic [31:0] next_pc;
    logic [31:0] pc;

    program_counter dut (
        .clk,
        .rst,
        .next_pc,
        .pc
    );

    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        for (int i = 1; i <= 25; i++) begin
            #25 rst = $random; next_pc = $random;
        end
        #10 $finish;
    end

    initial begin
        $dumpfile("./temp/dump_program_counter.vcd");
        $dumpvars();
    end

endmodule