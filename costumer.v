module costumer (
    input clk,mode,
    input [3:0]costumer_money,machine_supply,product_price,quantitiy,
	 input[10:0]machine_money,
    output reg [3:0]remaining_money,new_supply,
	 output reg [10:0]new_machine_money,
    output reg redlight
);
always @(posedge clk) begin
	if(mode)begin
		 if(costumer_money >= (product_price * quantitiy) && machine_supply >= quantitiy )begin
			  remaining_money <= costumer_money - (product_price * quantitiy);
			  new_supply <= machine_supply - quantitiy;
			  new_machine_money <= machine_money + (product_price * quantitiy);
			  redlight = 0;
		 end
		 else begin
			  remaining_money <= costumer_money;
			  new_supply <= machine_supply;
			  new_machine_money <= machine_money;
			  redlight = 1;
		 end	  
	end
end    
endmodule
