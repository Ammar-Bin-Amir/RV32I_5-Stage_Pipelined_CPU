module tb_control_unit;

    logic [6:0] opcode;
    logic write;
    logic store;
    logic load;
    logic branch;
    logic [1:0] alu_operand_a_selector;
    logic alu_operand_b_selector;
    logic [1:0] immediate_selector;
    logic [1:0] next_pc_selector;
    logic [2:0] alu_operations_selector;

    control_unit dut (
        .opcode (opcode),
        .write (write),
        .store (store),
        .load (load),
        .branch (branch),
        .alu_operand_a_selector (alu_operand_a_selector),
        .alu_operand_b_selector (alu_operand_b_selector),
        .immediate_selector (immediate_selector),
        .next_pc_selector (next_pc_selector),
        .alu_operations_selector (alu_operations_selector)
    );

    initial begin
        #10 opcode = 7'h00;
        #10 opcode = 7'h33;
        #10 opcode = 7'h03;
        #10 opcode = 7'h13;
        #10 opcode = 7'h67;
        #10 opcode = 7'h23;
        #10 opcode = 7'h63;
        #10 opcode = 7'h17;
        #10 opcode = 7'h37;
        #10 opcode = 7'h6f;
        #10 opcode = 7'hff;
        #10 $finish;
    end

    initial begin
        $dumpfile("./temp/dump_control_unit.vcd");
        $dumpvars();
    end

endmodule