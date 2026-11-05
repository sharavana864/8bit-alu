`timescale 1ns/1ps

module alu_tb;

reg [7:0] A, B;
reg [2:0] sel;

wire [7:0] Y;
wire carry;

// DUT Instantiation
alu uut (
    .A(A),
    .B(B),
    .sel(sel),
    .Y(Y),
    .carry(carry)
);

// Test procedure
initial begin

    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);

    $monitor("Time=%0t | A=%d | B=%d | SEL=%b | Y=%d | Carry=%b",
              $time, A, B, sel, Y, carry);

    A = 8'd20;
    B = 8'd10;

    sel = 3'b000;  // Addition
    #10;

    sel = 3'b001;  // Subtraction
    #10;

    sel = 3'b010;  // AND
    #10;

    sel = 3'b011;  // OR
    #10;

    sel = 3'b100;  // XOR
    #10;

    sel = 3'b101;  // NOT
    #10;

    sel = 3'b110;  // Left Shift
    #10;

    sel = 3'b111;  // Right Shift
    #10;

    $finish;

end

endmodule
