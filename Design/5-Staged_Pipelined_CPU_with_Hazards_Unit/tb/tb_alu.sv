module tb_alu;
    
    logic [31:0] operand_a;
    logic [31:0] operand_b;
    logic [3:0]  alu_controller;
    logic [31:0] alu_data;

    alu dut ( .* );

    initial begin
        #10ns operand_a = 32'hECA8_6420; operand_b = 32'hFDB9_7531;
        for (int i = 0; i < 10; i++) begin
            #10ns alu_controller = i;
        end
        #10ns alu_controller = 4'hF;
        #50ns operand_a = $random; operand_b = $random;
        for (int i = 0; i < 16; i++) begin
            #10ns alu_controller = i;
        end
        #100ns $finish;
    end

    initial begin
        $dumpfile("./temp/dump_alu.vcd");
        $dumpvars();
    end

endmodule : tb_alu