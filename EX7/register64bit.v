module Register64Bit(input [63:0] data, input reset, load, clock, output wire [63:0] out);

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            out <= 0;
        end else if (load) begin
            out <= data;
        end else begin
            out <= out;
        end
    end

endmodule
module testbench;

    reg [63:0] data;
    reg reset, load, clock;
    wire [63:0] out;

    Register64Bit r(.data(data), .reset(reset), .load(load), .clock(clock), .out(out));

    always #20 clock = ~clock;
    initial begin
        data <= 'h1;
        reset <= 0;
        load <= 0;
        clock <= 0;
        out <= 0;
    end
    initial begin

        reset <= 0;
        #10 reset <= 1;
        repeat (7) @(posedge clock)
            data <= ~data;
        #10 load <= 1;
        repeat (7) @(posedge clock)
            data <= ~data;

        $finish;
    end
    initial
    $monitor("reset=%b data=%b load=%b out=%b",reset,data,load,out);

endmodule