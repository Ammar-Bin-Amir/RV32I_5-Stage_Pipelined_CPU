module tb_top;

    logic clk;
    logic rst;

    top dut ( .* );

    initial clk = 0;
    always #10ns clk = ~clk;

    initial begin
        #10ns rst = 1;
        #50ns rst = 0;
        #1000ns $finish;
    end

    initial begin
        $dumpfile("./temp/dump.vcd");
        $dumpvars();
    end

endmodule : tb_top