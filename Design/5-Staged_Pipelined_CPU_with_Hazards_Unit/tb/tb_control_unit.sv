module tb_control_unit;

    logic [6:0] opcode;
    logic       write;
    logic       store;
    logic       load;
    logic       branch;
    logic [1:0] alu_operand_a_selector;
    logic       alu_operand_b_selector;
    logic [1:0] immediate_selector;
    logic [1:0] next_pc_selector;
    logic [2:0] alu_operations_selector;

    control_unit dut ( .* );

    initial begin
        #10ns opcode = 7'h00;
        #10ns opcode = 7'h33;
        #10ns opcode = 7'h03;
        #10ns opcode = 7'h13;
        #10ns opcode = 7'h67;
        #10ns opcode = 7'h23;
        #10ns opcode = 7'h63;
        #10ns opcode = 7'h17;
        #10ns opcode = 7'h37;
        #10ns opcode = 7'h6f;
        #10ns opcode = 7'hff;
        #10ns $finish;
    end

    initial begin
        $dumpfile("./temp/dump_control_unit.vcd");
        $dumpvars();
    end

endmodule : tb_control_unit