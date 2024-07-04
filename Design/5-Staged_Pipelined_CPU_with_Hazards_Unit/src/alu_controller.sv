module alu_controller (
    input  logic       func_7_bit_6,
    input  logic [2:0] func_3,
    input  logic [2:0] alu_operations_selector,
    output logic [3:0] alu_controller 
);

    logic alu_controller_bit_0_and_gate_1;
    logic alu_controller_bit_0_and_gate_2;
    logic alu_controller_bit_0_and_gate_3;

    assign alu_controller_bit_0_and_gate_1 = (~alu_operations_selector[2]) & (~func_3[2]) & func_3[1] & func_3[0];
    assign alu_controller_bit_0_and_gate_2 = (~alu_operations_selector[2]) & func_7_bit_6 & (~func_3[1]) & func_3[0];
    assign alu_controller_bit_0_and_gate_3 = alu_operations_selector[1] & alu_operations_selector[0];

    logic alu_controller_bit_1_and_gate_1;
    logic alu_controller_bit_1_and_gate_2;
    logic alu_controller_bit_1_and_gate_3;
    logic alu_controller_bit_1_and_gate_4;

    assign alu_controller_bit_1_and_gate_1 = (~alu_operations_selector[2]) & (~func_7_bit_6) & (~func_3[1]) & func_3[0];
    assign alu_controller_bit_1_and_gate_2 = (~alu_operations_selector[2]) & (~alu_operations_selector[0]) & (~func_3[2]) & func_3[1] & (~func_3[0]);
    assign alu_controller_bit_1_and_gate_3 = (~alu_operations_selector[2]) & func_3[2] & (~func_3[1]) & (~func_3[0]);
    assign alu_controller_bit_1_and_gate_4 = alu_operations_selector[1] & alu_operations_selector[0];

    logic alu_controller_bit_2_and_gate_1;
    logic alu_controller_bit_2_and_gate_2;
    logic alu_controller_bit_2_and_gate_3;
    logic alu_controller_bit_2_and_gate_4;

    assign alu_controller_bit_2_and_gate_1 = (~alu_operations_selector[2]) & (~alu_operations_selector[0]) & func_3[1] & (~func_3[0]);
    assign alu_controller_bit_2_and_gate_2 = (~alu_operations_selector[2]) & (~func_7_bit_6) & func_3[2] & func_3[0];
    assign alu_controller_bit_2_and_gate_3 = (~alu_operations_selector[2]) & func_3[2] & func_3[1];
    assign alu_controller_bit_2_and_gate_4 = alu_operations_selector[1] & alu_operations_selector[0];

    logic alu_controller_bit_3_and_gate_1;
    logic alu_controller_bit_3_and_gate_2;
    logic alu_controller_bit_3_and_gate_3;
    logic alu_controller_bit_3_and_gate_4;
    logic alu_controller_bit_3_and_gate_5;

    assign alu_controller_bit_3_and_gate_1 = (~alu_operations_selector[2]) & (~func_3[2]) & (~func_3[1]) & func_3[0];
    assign alu_controller_bit_3_and_gate_2 = (~alu_operations_selector[2]) & (~alu_operations_selector[0]) & func_3[1] & (~func_3[0]);
    assign alu_controller_bit_3_and_gate_3 = (~alu_operations_selector[1]) & (~alu_operations_selector[0]) & func_7_bit_6 & (~func_3[1]);
    assign alu_controller_bit_3_and_gate_4 = (~alu_operations_selector[2]) & func_7_bit_6 & (~func_3[1]) & func_3[0];
    assign alu_controller_bit_3_and_gate_5 = alu_operations_selector[1] & alu_operations_selector[0];

    assign alu_controller[0] = alu_controller_bit_0_and_gate_1 | alu_controller_bit_0_and_gate_2 | alu_controller_bit_0_and_gate_3;
    assign alu_controller[1] = alu_controller_bit_1_and_gate_1 | alu_controller_bit_1_and_gate_2 | alu_controller_bit_1_and_gate_3 | alu_controller_bit_1_and_gate_4;
    assign alu_controller[2] = alu_controller_bit_2_and_gate_1 | alu_controller_bit_2_and_gate_2 | alu_controller_bit_2_and_gate_3 | alu_controller_bit_2_and_gate_4;
    assign alu_controller[3] = alu_controller_bit_3_and_gate_1 | alu_controller_bit_3_and_gate_2 | alu_controller_bit_3_and_gate_3 | alu_controller_bit_3_and_gate_4 | alu_controller_bit_3_and_gate_5;
    
endmodule : alu_controller