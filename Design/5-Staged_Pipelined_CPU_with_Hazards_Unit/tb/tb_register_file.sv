module tb_register_file;
    
    logic        clk;
    logic        en;
    logic [31:0] register_file_data;
    logic [4:0]  rd;
    logic [4:0]  rs1_address;
    logic [4:0]  rs2_address;
    logic [31:0] rs1_data;
    logic [31:0] rs2_data;

    register_file dut ( .* );

    initial clk = 0;
    always #10ns clk = ~clk;

    initial begin
        #25ns en = 0; register_file_data = 0; rd = 0; rs1_address = 0; rs2_address = 0;
        for (int i = 1; i <= 25; i++) begin
            #25ns en = $random; register_file_data = $random; rd = $random; rs1_address = $random; rs2_address = $random;
        end
        #100ns $finish;
    end

    initial begin
        $dumpfile("./temp/dump_register_file.vcd");
        $dumpvars();
    end

endmodule : tb_register_file