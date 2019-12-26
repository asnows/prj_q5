module usb_master
#(

parameter X86_CTRL_GPIO = 8'd5

) 
(

  // FIFO Slave interface 
  input wire  CLK,
  input resetn,
  input wire [7:0] BCD_switch,
  inout wire [15:0] DATA,
  inout wire [1:0]  BE,
  input wire  RXF_N,    // ACK_N
  input wire  TXE_N,
  output wire  WR_N,    // REQ_N
  output wire  RD_N,
  output wire  OE_N,
  input  wire [15:0] X_IN,
  output wire [15:0] Y_OUT
  
  

);

	


wire	[15:0]  data;
reg	[10:0]  rdaddress = 11'd0;
reg	[10:0]  rdaddress_r = 11'd0;

reg	[10:0]  wraddress = 11'd0;
reg	[10:0]  wraddress_r = 11'd0;


reg   txe_n_dly;
reg	rden;
wire	wren;
wire	[15:0]  q;
reg	[15:0]  data_out;

reg WR_N_reg = 1'b1;    // REQ_N
reg WR_N_dly = 1'b1;    // REQ_N

reg  RD_N_reg = 1'b1;
reg  OE_N_reg = 1'b1;
reg[1:0]  RD_N_dly ;
wire rdclock;
wire wrclock;
wire [15:0] data_reg;


assign wrclock = CLK;
assign rdclock = CLK;




assign data = DATA;
assign DATA = (TXE_N == 1'b0) ?data_reg  : 16'hzzzz;

assign Y_OUT = DATA;
assign data_reg = (BCD_switch == X86_CTRL_GPIO)? X_IN : q;



assign BE = (TXE_N == 1'b0) ?2'b11 : 2'bzz;
assign WR_N = WR_N_reg;

assign RD_N = RD_N_reg;
assign OE_N = OE_N_reg;

assign wren = (~RD_N_dly[1]) & (~RXF_N);


	USB_RAM	USB_RAM_i 
	(
		.data 		( data 		),
		.rdaddress 	( rdaddress ),
		.rdclock 	( rdclock 	),
		.rden 		( rden 		),
		.wraddress 	( wraddress ),
		.wrclock 	( wrclock 	),
		.wren 		( wren 		),
		.q 			( q 			)
	);

	

	always@(posedge CLK)
	begin
		if(resetn == 1'b0)
		begin
			OE_N_reg <= 1'b1;
			RD_N_reg <= 1'b1;	
			
		end
		else
		begin
			if(RXF_N == 1'b0)
			begin
				OE_N_reg <= 1'b0;
				RD_N_reg <= 1'b0;	
							
			end
			else
			begin
				OE_N_reg <= 1'b1;
				RD_N_reg <= 1'b1;	
								
			end
		end
		
		
	end
	
		
	always@(negedge CLK)
	begin
		RD_N_dly <= {RD_N_dly[0],RD_N_reg};
	end

	
	always@(negedge CLK)
	begin
		if(resetn == 1'b0)
		begin
			wraddress <= 13'd0;
		end
		else
		begin
			if( wren == 1'b1)
			begin
				wraddress <= wraddress_r;
			end	
		end
		
	end
	
	
	
	
	always@(*)
	begin
		wraddress_r <= wraddress + 1'b1;	
	end
	
	
	
	
	
	
	always@(negedge CLK)
	begin
		txe_n_dly <= TXE_N;
	end
	
	
	always@(negedge CLK)
	begin
		rden <= ~TXE_N;
	end
	
	
	always@(negedge CLK)
	begin
		WR_N_reg <= ~rden;
	end
	
	
	
	always@(negedge CLK)
	begin
		if(resetn == 1'b0)
		begin

			rdaddress <= 13'd0;
		end
		else
		begin
		
			if(txe_n_dly & (~TXE_N))
			begin
				if(rdaddress > 13'd0)
				begin
					rdaddress <= rdaddress - 1'b1;
				end
			end
			else if(rden & (~TXE_N))
			begin
				rdaddress <= rdaddress_r;
			end
			
			
			
		end
	end

	
	always@(*)
	begin
		rdaddress_r <= rdaddress + 1'b1;
	end
	
	
	
	

	
	
endmodule 	