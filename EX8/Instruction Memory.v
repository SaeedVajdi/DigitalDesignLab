module Instruction_Memory(
    input [63:0] pc,
    output [63:0] instruction
);

    reg [63:0] memory [63:0];
    wire [3:0] rom_addr = pc[4:1];
    initial
        begin
            $readmemb("C:\Users\ASUS\Desktop\EX8/Test.prog", memory, 0, 14);
        end
    assign instruction = memory[rom_addr];

endmodule