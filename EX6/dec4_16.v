module decoder4x16 (input [3:0] select,
    input enable,
    output wire [16:0] out);

    assign out = {17{enable}} & (1'b1 << select);

endmodule
module testbench;

    reg [3:0] select;
    reg enable;
    wire [16:0] out;

    decoder4x16 decoder(select, enable, out);

    initial
        begin
            select = 4'b0000;
            enable = 1'b0;

            repeat(16) #10 begin
                enable = 1'b1;
                #85 $display("select = %b \t out = %b", select, out);
                select = select + 4'b0001;
            end
        end
endmodule