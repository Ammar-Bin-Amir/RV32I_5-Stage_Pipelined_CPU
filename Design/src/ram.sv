module ram (
    input logic clk,
    input logic [11:0] data_memory_address,
    input logic [31:0] data_memory_data_in,
    input logic store,
    input logic load,
    output logic [31:0] data_memory_data_out
);
    
    reg [31:0] data_memory [0:4095];

    always_ff @(posedge clk) begin
        if (store) begin
            data_memory[data_memory_address] <= data_memory_data_in;
        end
        else begin
            data_memory <= data_memory;
        end
    end

    always_comb begin
        if (load) begin
            if (data_memory[data_memory_address] === 32'hxxxx_xxxx) begin
                data_memory_data_out = 0;
            end
            else begin
                data_memory_data_out = data_memory[data_memory_address];
            end
        end
        else begin
            if (data_memory_address === 32'hxxxx_xxxx || data_memory_data_in === 32'hxxxx_xxxx) begin
                data_memory_data_out = 0;
            end
            else begin
                data_memory_data_out = data_memory_data_out;
            end
        end
    end

endmodule