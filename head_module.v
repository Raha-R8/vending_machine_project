

module head_module (
  input clk,costumer_mode,owner_money_mode,owner_supply_mode,
  input wire [2:0]product,
  input wire [3:0]costumer_money,quantitiy,
  output wire [6:0]seg1,[6:0]seg2,[6:0]seg3
);

  reg [10:0] product_info [7:0];
  reg [10:0]machine_money;
  reg redlight;
  
  wire [3:0]remaining_money,new_supply_c,new_supply_o;
  wire[10:0]new_machine_money_o,new_machine_money_c,owner_money;
  wire redlight1,redlight2,redlight3;

 

 initial begin
    $readmemb("stuff.txt", product_info);	
		machine_money  = 11'b00000000000;
		redlight = 0;
  end

	

/*always@(costumer_mode==1)begin
$display(" machine supply array :%b",product_info[product][7:4]);
end*/


costumer mode1 (
    .clk(clk), 
    .mode(costumer_mode), 
    .costumer_money(costumer_money), 
    .machine_supply(product_info[product][7:4]), 
    .product_price(product_info[product][3:0]), 
    .quantitiy(quantitiy), 
    .machine_money(machine_money), 
    .remaining_money(remaining_money), 
    .new_supply(new_supply_c), 
    .new_machine_money(new_machine_money_c), 
    .redlight(redlight1)
    );
	 
owner_money mode2 (
    .clk(clk), 
    .mode(owner_money_mode), 
    .machine_money(machine_money), 
    .owner_money(owner_money), 
    .new_machine_money(new_machine_money_o), 
    .redlight(redlight2)
    );

owner_supply mode3 (
    .clk(clk), 
    .mode(owner_supply_mode), 
    .machine_supply(product_info[product][7:4]), 
    .quantitiy(quantitiy), 
    .new_supply(new_supply_o), 
    .redlight(redlight3)
    );
	 
display sub_module (
    .clk(clk), 
    .redlight(redlight), 
    .number(machine_money), 
    .seg1(seg1), 
    .seg2(seg2), 
    .seg3(seg3)
    );

always@(negedge clk)begin
  if(costumer_mode ==1)begin
	 redlight <= redlight1;
    machine_money <= new_machine_money_c;
    product_info[product][7:4] <= new_supply_c;
  end
  if(owner_money_mode==1)begin
    redlight <= redlight2;
    machine_money <= new_machine_money_o;
  end
  if(owner_supply_mode==1)begin
    redlight <= redlight3;
    product_info[product][7:4] <= new_supply_o;
  end
  
end  
always @(costumer_mode,owner_supply_mode,owner_money_mode) begin
	$timeformat(-9, 2, " ns", 20);
	$display(" ***MODE CHANGE :: time is %0t",$time);
   $display("new machine money :%b",machine_money);
   $display("new product supply :%b",product_info[product][7:4]);
	$display("costumer remaining money:%b",remaining_money);
	$display("owner money :%b",owner_money);
end
endmodule

