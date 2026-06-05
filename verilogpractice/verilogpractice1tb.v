`timescale 1ns / 1ps

module bit4adder_tb;

    // 1. Inputs are declared as registers (reg)
    reg [3:0] x;
    reg [3:0] y;
    reg cin;

    // 2. Outputs are declared as wires
    wire [3:0] z;
    wire cout;

    // 3. Instantiate the Unit Under Test (UUT)
    bit4adder uut (
        .x(x), 
        .y(y), 
        .cin(cin), 
        .z(z), 
        .cout(cout)
    );

    // 4. Stimulus Generation
    initial begin
        // Setup waveform dumping for GTKWave
        $dumpfile("dump.vcd");
        $dumpvars(0, bit4adder_tb);
        
        // Setup console monitoring
        $monitor("Time=%0dt | cin=%b | x=%d (%b) + y=%d (%b) | Result: cout=%b, z=%d (%b)", 
                 $time, cin, x, x, y, y, cout, z, z);
        
        // --- Test Cases ---
        
        // Case 1: Simple addition without any carries
        x = 4'd2;  y = 4'd3;  cin = 1'b0; #10; // 2 + 3 = 5
        
        // Case 2: Addition that creates internal carries, but no final cout
        x = 4'd7;  y = 4'd1;  cin = 1'b0; #10; // 7 + 1 = 8
        
        // Case 3: Using the initial carry-in (cin)
        x = 4'd5;  y = 4'd5;  cin = 1'b1; #10; // 5 + 5 + 1 = 11
        
        // Case 4: Testing the maximum limits (Generates a final cout)
        x = 4'd15; y = 4'd1;  cin = 1'b0; #10; // 15 + 1 = 16 (z=0, cout=1)
        
        // Case 5: Absolute maximum possible inputs
        x = 4'd15; y = 4'd15; cin = 1'b1; #10; // 15 + 15 + 1 = 31 (z=15, cout=1)
        
        // Case 6: Zero check
        x = 4'd0;  y = 4'd0;  cin = 1'b0; #10; // 0 + 0 = 0
        
        $finish; // End simulation
    end
      
endmodule