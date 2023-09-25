// writing this line comment to check if new changes are highlighted
/*Write an RTL code for a 4-bit SIPO(serial-in-parallel-out)shift register
 which shifts first 2-bits (shift for 2 times) to left/right and should shift for 2 more times which should have the previous value.*/

module sipo(clk,rst,si,mode,po);
input clk,rst;
input si,mode;
 
output reg[3:0]po;

reg [3:0]register;
reg count;


always@(posedge clk)
begin
	if(rst)
	begin
		po<=4'b0;
		register<=4'b0;
		count<=1'b0;
	end
	
	else
		begin
			
			if(count < 2'b10)
			begin
				case(mode)
					0 : begin
					register   <= {si,register[3:1]};
					count <= count+1'b1;
					end
					1 : begin
					register   <= {register[2:0],si};
					count <= count+1'b1;
					end
				endcase
				po <= register;
				
				//count <= count+1'b1;
				end
		end
		
end

endmodule
