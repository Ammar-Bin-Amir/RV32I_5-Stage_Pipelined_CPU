module tb_branch_selector;
    
    logic [31:0] rs1;
    logic [31:0] rs2;
    logic        en;
    logic [2:0]  func_3;
    logic        branch_selector;

    branch_selector dut ( .* );

    initial begin
        #10ns en = 1; rs1 = 32'hECA8_6420; rs2 = 32'hFDB9_7531;
        for (int i = 0; i < 8; i++) begin
            #10ns func_3 = i;
        end
        for (int i = 0; i < 16; i++) begin
            #10ns en = $random; rs1 = $random; rs2 = $random; func_3 = i;
        end
        #100ns $finish;
    end

    initial begin
        $dumpfile("./temp/dump_branch_selector.vcd");
        $dumpvars();
    end

endmodule : tb_branch_selector