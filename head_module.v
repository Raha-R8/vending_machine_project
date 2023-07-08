

module head_module (
  input clk,costumer_mode,owner_money_mode,owner_supply_mode,
  input wire [2:0]product,
  input wire [3:0]costumer_money,quantitiy,
  output wire [6:0]seg1,[6:0]seg2
);

  reg [10:0] product_info [7:0];
  reg [10:0]machine_money;
  reg [1:0]redlight;

  wire [3:0]remaining_money,new_supply_c,new_supply_o;
  wire[10:0]new_machine_money_o,new_machine_money_c,owner_money;
  wire redlight1,redlight2,redlight3;


//result is stored in product_info memory

 initial begin
    $readmemb("stuff.txt", product_info);
		machine_money  = 11'b00000000000;
		redlight = 0;
  end



/*always@(costumer_mode==1)begin
$display(" machine supply array :%b",product_info[product][7:4]);
end*/

//module 1 is for costumer mode

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

//module 2 is for owner money mode

owner_money mode2 (
    .clk(clk),
    .mode(owner_money_mode),
    .machine_money(machine_money),
    .owner_money(owner_money),
    .new_machine_money(new_machine_money_o),
    .redlight(redlight2)
    );

//module 3 is for owner supply mode

owner_supply mode3 (
    .clk(clk),
    .mode(owner_supply_mode),
    .machine_supply(product_info[product][7:4]),
    .quantitiy(quantitiy),
    .new_supply(new_supply_o),
    .redlight(redlight3)
    );

//module 4 is to display the account money (costumer remaining money or machine account money ) and error code
display sub_module (
    .clk(clk),
    .redlight(redlight),
    .number(machine_money),
    .seg1(seg1),
    .seg2(seg2)
    );

/*the always block works in negedge because the info should will arrive with delay
thus the modules work in posedge and data is stored in negedge
There are different error codes in each mode and for each module
redlight 01 : there has been an error when costumer is trying to buy a product
redlight 10 : there has been an error when owner is trying to collect money
redlight 11 : there has been an error when owner is trying to fill supply
and if redlight is zero then there has not been an error*/

always@(negedge clk)begin
  if(costumer_mode ==1)begin
	 if(redlight1 ==1)
		redlight = 2'b01;
	else
		redlight = 2'b00;
    machine_money <= new_machine_money_c;
    product_info[product][7:4] <= new_supply_c;
  end
  if(owner_money_mode==1)begin
	if(redlight2 ==1)
		redlight = 2'b10;
	else
		redlight = 2'b00;
    machine_money <= new_machine_money_o;
  end
  if(owner_supply_mode==1)begin
	if(redlight3 ==1)
		redlight = 2'b11;
	else
		redlight = 2'b00;
    product_info[product][7:4] <= new_supply_o;
  end

end
/*this display block is sensitive to mode change which means that it will show the desired information whenever
a mode change has occurred and since we change the mode in negative levels in our test bench we expect to see the
result exactly then (in negative levels the modules have already applied change and the data is already saved into registers.)*/

always @(costumer_mode,owner_supply_mode,owner_money_mode) begin
	$timeformat(-9, 2, " ns", 20);
	$display(" ***MODE CHANGE :: time is %0t",$time);
   $display("new machine money :%b",machine_money);
   $display("new product supply :%b",product_info[product][7:4]);
	$display("costumer remaining money:%b",remaining_money);
	$display("owner money :%b",owner_money);
end
endmodule
