module tb_alu_controller;
    
    logic       func_7_bit_6;
    logic [2:0] func_3;
    logic [2:0] alu_operations_selector;
    logic [3:0] alu_controller;

    alu_controller dut ( .* );

    initial begin
        for (int i = 0; i <= 7; i++) begin
            for (int j = 0; j <= 7; j++) begin
                for (int k = 0; k <= 1; k++) begin
                    #10ns alu_operations_selector = i; func_3 = j; func_7_bit_6 = k;
                end
            end
        end
        #10ns $finish;
    end

    initial begin
        $dumpfile("./temp/dump_alu_controller.vcd");
        $dumpvars();
    end

endmodule : tb_alu_controller