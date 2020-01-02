/**************************************************
* @file    : hcq1.v                              
* @author  : ct@hcfa.cn                            
* @version : V0.00                                                                
* @data    : 2017.11.29 
* @brief   :      
            It is the top file,that descriptions the pin configuration                  				 
* @note    :      
                                                                              				 
***************************************************/ 

module prj_q5
 (		
 
 /******************************/ 
 /*      FPGA DEVICE reset     */           
 /******************************/          		  
  input  wire          FPGA_nRST,  
  
 /**********************************/  		
 /* external physcial source-clock */ 
 /**********************************/ 		  
 input  wire          C10_CLK50M,
		  
 /**********************************/ 
 /*            TQ GPCM             */           
 /**********************************/ 
// inout  wire [15:0]   IFC_AD, 
// input  wire          IFC_CLK0,                              
// input  wire          IFC_CLK1,                		  
// input  wire          IFC_AVD,             
// input  wire          IFC_OE,
// input  wire          IFC_WE0,
// input  wire          IFC_CS0,
// input  wire          IFC_CS1,	
// 
 
  input wire IFC_CLK,
  inout wire [15:0]IFC_DATA,
  inout wire [1:0] IFC_BE,
  input wire IFC_RXF_N,    // ACK_N
  input wire IFC_TXE_N,
  output wire IFC_WR_N,    // REQ_N
  output wire IFC_RD_N,
  output wire IFC_OE_N,
  
 
 
 
		  
 /**************************/                               		  
 /* TQ IO Signal Connector */
 /**************************/ 
 
 /*core board power enable control */ 
 input wire           RESET_OUT,
 input wire           HRESET,
 input  wire          RESET_REQ_OUT,   //core-module reset required 	  
 input  wire          PMC_PWR_STATUS,  //core-module power ready    
 output wire          RESIN,           //reset core-module 
 output wire          POWER_STBY,      //wake-up core-module		  
 output wire          TQ_POWER_EN,     //   	
         
 /*****************************/ 
 /*     Power Failed Check    */           
 /*****************************/		  
 input  wire          V5_DEC_INT,  
 input  wire          V24_DEC_INT,   
         
 
        
 /** Interrupt IO **/		  
 output wire          GPIO2_15,
 input  wire          GPIO2_14,		  
 output wire          FPGA_IQR4,
                      		          
 /* Physical peripherals power contr  */ 
 output wire          VCC1V8_EN,		  
 output wire          VCC3V3_OTHER_EN,          
 output wire          VCC_PHY_EN,                                  
 output wire          VCC3V3_FPGA_EN,
 output wire          CPU_3V3_TRST, 
        		  
                 
 /* core-module phy reset */                          
 output wire          EC3_PHY_RST,  
 output wire          EC2_PHY_RST, 
 output wire          EC1_PHY_RST,                                             
 output wire          STKT_RST,    //usb 
 output wire          FPGA_RST_USBHUB, 

 /**********************************/  		
 /*     EtherCAT Master Control    */ 
 /**********************************/
 input  wire          ECAT_TXC_MII,
 
 output wire          ECAT_TXEN_MII,
 output wire          ECAT_TXD3_MII,
 output wire          ECAT_TXD2_MII,
 output wire          ECAT_TXD1_MII,
 output wire          ECAT_TXD0_MII,
 input  wire          ECAT_RXC_MII,
 input  wire          ECAT_RXDV_MII,
 input  wire          ECAT_RXD3_MII,
 input  wire          ECAT_RXD2_MII,
 input  wire          ECAT_RXD1_MII,
 input  wire          ECAT_RXD0_MII,

 //output wire          FPGA_CLK25M_OUT,
 input wire          FPGA_CLK25M_OUT,
 input  wire          ECAT_RXER_MII,
 output wire          FPGA_RST_EC4,
 
 output  wire          ECAT_COL_MII,
 output  wire          ECAT_CRS_MII,
 
 
 //input  wire          ECAT_COL_MII,
 //input  wire          ECAT_CRS_MII,
 //input  wire          FPGA_ENET_INTRP,
 
 /**********************************/  		
 /*         rotation switch        */ 
 /**********************************/             	
 input  wire          FPGA_BCD_1,       
 input  wire          FPGA_BCD_2,       
 input  wire          FPGA_BCD_4,          
 input  wire          FPGA_BCD_8,
 
 /**********************************/
 /*      LED display Control       */
 /**********************************/
 
  // temperature Check  	  
 input  wire          TEMP_ALERT,
 input  wire          TEMP_CRIT_OUT,
 // I2C read PHY Led state               
 input  wire          FPGA_I2C1_LED_INT,  
 inout  wire          FPGA_I2C1_SDA,		  
 output wire          FPGA_I2C1_SCL,  
 // led control
 output wire          FPGA_PART1_CLK_3V3,         
 output wire          FPGA_PART1_DIN_3V3,                              
 output wire          FPGA_PART2_CLK_3V3,
 output wire          FPGA_PART2_DIN_3V3,

         
 /**********************************/   
 /*           16 Y output          */  
 /**********************************/
 output wire          FPGA_OUTPUT_EN, 
 output wire [15:0]   FPGA_YOUT,   
                    
 /**********************************/
 /*          16 X  input           */  
 /**********************************/
 input  wire [15:0]   FPGA_XIN, 
          
 /**********************************/
 /*      EtherCAT Redundancy       */ 
 /**********************************
  *****************************/ 

 inout               FPGA_MDIO,
 output wire          FPGA_MDC,    
                                 
// output wire          EC4_TXD0, 
// output wire          EC4_TXD1, 
// output wire          EC4_TXD2,
// output wire          EC4_TXD3,
// output wire          EC4_TX_EN,
// output wire          EC4_GTX_CLK, //for RGMII
 
// input  wire          EC4_RXD0, 
// input  wire          EC4_RXD1,
// input  wire          EC4_RXD2,
// input  wire          EC4_RXD3,
// input  wire          EC4_RX_DV,
// input  wire          EC4_RX_CLK,
 
// output wire          EC4_PHY_PWDN, 
 
// output wire          EC4_PHY_RST,   
 
// input  wire          EC4_PHY_CLKOUT,

 /**********************************/
 /*      Cooling fan control       */ 
 /**********************************/ 
 output wire          FAN_PWM,
 input  wire          FAN_Feedback

); 
 
 
 
	localparam ECAT_TEST = 8'd0, FAN_TEST = 8'd1,PYH_POW_TEST = 8'd2, HGPIO_TEST = 8'd3,X86_USB_TEST = 8'd4,X86_CTRL_GPIO = 8'd5,ALL_LED_TEST = 8'd9,ALL_LED_TEST2 = 8'd10;
	localparam FLICK_0_5S = 32'd2500000;
	localparam FLICK_1TMIS = FLICK_0_5S *10 *2;
	localparam NUMS = 256,NUMS2 = 100;	
	localparam LOOP_DATA = 4'b0101;
	wire c0_clk_5M;                                
	wire c1_clk_25M;  
	wire c2_clk_100M; 
	wire c3_clk_200M; 
	reg[31:0] BCD_counts 	= 32'd0;
	reg[31:0] counts			=32'd0;
	reg[31:0] start_counts 	=32'd0;
	reg[12:0] xy_count 		= 13'd0;
	reg[15:0] xin_dly 		= 16'd0;
	reg[15:0] xin_flg 		= 16'd0;
	reg[7:0]  BCD_switch	= 8'd0,BCD_switch_1 = 8'd0,BCD_switch_2= 8'd0;
	reg[7:0]  tdata 	 = 8'd1;
	reg[7:0]  sedBytes = 8'd1;
	reg[7:0]  cmd3 	 = 8'h80;
	reg[11:0] fan_pwm_count = 12'd0;
	reg 		 fan_pwm_reg   = 1'b0;
	reg 		 fan_fb_state  = 1'b0;
	reg       hz_200k       = 1'b0;
	reg       sys_resetn    = 1'b0;
	reg       tvaild        = 1'b0;


	reg[31:0] phy_counts =32'd0;
	reg       phy_gpio   = 1'b0;
	reg[3 :0] ecat_rxd   = 4'd0;
	reg[3 :0] loop_data  = 4'b0101;
	reg[2 :0] clk5m_div  = 3'd0;
	(* keep *) wire[15 :0] mdio_revData;
	wire mdio_done;
	wire eth_frame_txen;
	wire[3:0] eth_frame_txd;
	reg x0_enable = 1'b0;
	reg[8:0] x_count[15:0];
	reg usb_read_flg = 1'b0;
	reg usb_write_flg = 1'b0;
	wire[15:0] usb_OUT;
	wire[15:0] FPGA_YOUT_reg;
	
	
	

   //q1
	assign VCC3V3_OTHER_EN = 1'b1;
	assign FAN_PWM         	= fan_pwm_reg;    
	assign VCC_PHY_EN 		= (BCD_switch == PYH_POW_TEST )?phy_gpio:1'b1;
	assign FPGA_YOUT_reg 	= {hz_200k,hz_200k,hz_200k,hz_200k,hz_200k,hz_200k,hz_200k,hz_200k,hz_200k,hz_200k,hz_200k,hz_200k,hz_200k,hz_200k,hz_200k,hz_200k}; 
	assign FPGA_YOUT     	= (BCD_switch == X86_CTRL_GPIO )?usb_OUT: FPGA_YOUT_reg;
	assign FPGA_OUTPUT_EN = 1'b0;
	
	assign ECAT_TXEN_MII = 1'b1;
	assign ECAT_TXD3_MII = loop_data[3];
   assign ECAT_TXD2_MII = loop_data[2];
   assign ECAT_TXD1_MII = loop_data[1];
   assign ECAT_TXD0_MII = loop_data[0];
	
	
	assign FPGA_RST_EC4  = sys_resetn;
	//assign FPGA_CLK25M_OUT 	= c1_clk_25M;  
	
	//q1 config0 - 1
	assign ECAT_COL_MII = 1'b0;
	assign ECAT_CRS_MII = 1'b0;
	
	
	//test
	assign FPGA_I2C1_SCL = ((mdio_revData == 8'd0) && (ecat_rxd == loop_data))? 1'b0:ECAT_TXC_MII;
	
	
	
	
 
	sysclk_source	sysclk_source_inst 
	(
		 .inclk0 ( C10_CLK50M ),
		 .c0 ( c0_clk_5M ),
		 .c1 ( c1_clk_25M ),
		 .c2 ( c2_clk_100M ),
		 .c3 ( c3_clk_200M ),
		 .locked()
	  
	 );

	

 
 
	always@(posedge C10_CLK50M)
	begin
		if(start_counts < FLICK_1TMIS * 6)
		begin
			start_counts <= start_counts + 1'b1;
			sys_resetn <=1'b0;
		end
		else
		begin
			sys_resetn <=1'b1;
		end
		
	end
	
 /****************************************/	


/******************ECAT*****************/
always@(posedge C10_CLK50M)
begin
	if(!sys_resetn)
	begin
		loop_data <= 4'b0000;
	end
	else
	begin
		loop_data <= LOOP_DATA;
	end
	
end

	

always@(posedge ECAT_RXC_MII)
begin
	if(ECAT_RXDV_MII == 1'b1)
	begin
		ecat_rxd <= {ECAT_RXD3_MII,ECAT_RXD2_MII,ECAT_RXD1_MII,ECAT_RXD0_MII};
	end

end
	



 
 /****************************************/	


/******************拨码开关**************/
	always@(posedge C10_CLK50M)
	begin

		
		BCD_switch_1 <= {4'b0000,~FPGA_BCD_8,~FPGA_BCD_4,~FPGA_BCD_2,~FPGA_BCD_1};
		BCD_switch_2 <= BCD_switch_1;
		

	end
	
	
	always@(posedge C10_CLK50M)
	begin
		if(sys_resetn == 1'b0)
		begin
			if(start_counts < FLICK_1TMIS*3)
			begin
				BCD_switch <= 8'd9;
			end
			else
			begin
				BCD_switch <= 8'd10;
			end
			
		end
		else
		begin
	
			if(BCD_switch_1 != BCD_switch_2)
			begin
					BCD_counts <= 32'd0;
			end
			else
			begin
				if(BCD_counts < 200000)
				begin
						BCD_counts <= BCD_counts + 1'b1;
				end
				else
				begin
						BCD_switch <= BCD_switch_2;
				end
					
			end
		
		end
		
	end

 
 
 
 
/****************************************/	

/***************风扇测试******************/
	
	
	//风扇控制
	always@(posedge C10_CLK50M)
	begin
		if(fan_pwm_count < 12'd1000)
		begin
			fan_pwm_count <= fan_pwm_count + 1'b1;
		end
		else
		begin
			fan_pwm_count <= 12'd0;
			fan_pwm_reg <= ~fan_pwm_reg;
		end
		
	end
	
	//风扇反馈
	always@(posedge C10_CLK50M)
	begin
		if(FAN_Feedback == 1'b0)
		begin
			fan_fb_state <= 1'b1;
		end
		else
		begin
			fan_fb_state <= 1'b0;
		end
		
	end
	
/****************************************/	


/***************phy电源测试***************/
	
	//2s 使能一次
	always@(posedge c0_clk_5M)
	begin
		if(phy_counts < 32'd10000000)
		begin
			phy_counts <= phy_counts + 1'b1;
		end
		else
		begin
			phy_counts <= 32'd0;
			phy_gpio <= ~phy_gpio;
			
		end
					
	end
	
	
	
/****************************************/	


/***************高速输入输出**************/
		
		//输出
		always@(posedge c3_clk_200M)
		begin
			if(xy_count < 13'd500)
			begin
				xy_count <= xy_count + 1'b1;
			end
			else
			begin
				xy_count <= 8'd0;
				hz_200k <= ~hz_200k;
			end
		end
                 
		
		// 输入测试			  
		always@(posedge c0_clk_5M)
		begin
			xin_dly <= FPGA_XIN;
		end
		
		
generate
	genvar i;
	for(i=0;i<16;i=i+1)
	begin: XI_LED
		always@(posedge c0_clk_5M)
		begin
		
				if((~xin_dly[i])&  FPGA_XIN[i])
				begin
						x_count[i] <= 1'b0;	
				end
				else
				begin
					if(x_count[i] < NUMS)
					begin
						x_count[i] <= x_count[i] + 1'b1;
					end	
				end
				
				
				if(x_count[i] == NUMS)
				begin
					xin_flg[i] <=1'b0;
				end
				else
				begin
					xin_flg[i] <=1'b1;
				end
			
		end
	
	end


endgenerate
					  			  
		
 
	
	
 /****************************************/	


/******************LED闪烁控制**************/
	
	
	always@(posedge c0_clk_5M)
	begin
		case(BCD_switch)
			ECAT_TEST:
			begin	
				if(tvaild == 1'b1)
				begin
					 tdata <= 8'd0;
				end
				else
				begin
					if(ecat_rxd == LOOP_DATA)
					begin
						tdata <= 8'd1;
					end
					else
					begin
						tdata <= 8'd0;
					end
					
				end
			
				
			end
			
			FAN_TEST:
			begin
				if(tvaild == 1'b1)
				begin
					 tdata <= 8'd0;
				end
				else
				begin
					tdata <= {7'd0,fan_fb_state};
					//tdata <= 8'd2;
				end
			
			end
			
			PYH_POW_TEST:
			begin
			   tdata <= 8'd0;

			end

			HGPIO_TEST:
			begin
			
				case(counts)
					32'd0:
					begin
						tdata <= xin_flg[7:0];
					end
					32'd1:
					begin
						tdata <= xin_flg[15:8];
					end
					default:
					begin
						tdata <= 8'd0;
					end
					
				endcase
				
				
			end
			
			X86_USB_TEST:
			begin
				if(tvaild == 1'b1)
				begin
					 tdata <= 8'd0;
				end
				else			
				begin
					tdata <= {6'd0,usb_write_flg,usb_read_flg};
				end
				
			end
			
			
//			X86_CTRL_GPIO:
//			begin
//				if(tvaild == 1'b1)
//				begin
//					 tdata <= 8'd0;
//				end
//				else			
//				begin
//					tdata <= {6'd0,usb_write_flg,usb_read_flg};
//				end
//				
//			end
			
			
			
			ALL_LED_TEST:
			begin
				tdata <= 8'hff;	

			end
			
			ALL_LED_TEST2:
			begin
				tdata <= 8'hff;	
			end
			
			default:
			begin
			   tdata <= 8'd0;

			end
				
		endcase
	end
	
	
	
	// 0.5s 闪烁
	always@(posedge c0_clk_5M)
	begin
		if(counts < 32'd2500000)
		begin
			counts <= counts + 1'b1;

		end
		else
		begin
			counts <= 32'd0;

			
			if(cmd3 == 8'h80)
			begin
				cmd3 <= 8'h8a;
			end
			else
			begin
				cmd3 <= 8'h80;
			end
			
			
		end
	end
	
	
	//最多传输16个字节
	always@(posedge c0_clk_5M)
	begin
		if(counts < 32'd15)
		begin
			tvaild <= 1'b1;
		end
		else
		begin
			tvaild <= 1'b0;
		end
		
	end
	
	
  
	  
	TM1640_driver TM1640_PART1_i
	(
		.clk(c0_clk_5M),
		.tvalid(tvaild),
		.sendBytes(8'd7),
		.cmd1(8'h40),
		.cmd2(8'hc0),
		.tdata(tdata),
		.cmd3(cmd3),
		.done(),
//		.SCL(FPGA_PART1_CLK_3V3),
//		.SDA(FPGA_PART1_DIN_3V3)
		.SCL(FPGA_PART2_CLK_3V3),
		.SDA(FPGA_PART2_DIN_3V3)

	);  
	  
  
	 	     

	TM1640_cfg TM1640_1_cfg
	(
		.clk(c0_clk_5M),
		.dispData(BCD_switch),
//		.SCL(FPGA_PART2_CLK_3V3),
//		.SDA(FPGA_PART2_DIN_3V3)
		.SCL(FPGA_PART1_CLK_3V3),
		.SDA(FPGA_PART1_DIN_3V3)


	);

	
	
wire[15:0] mst_fifo_wire; 
wire[1:0] mst_fifo_BE; 
reg [15:0] read_count =16'd0; 
reg [15:0] write_count =16'd0; 
reg [7:0 ] usb_count = 8'd0;  

// mst_fifo_top mst_fifo_top_i
// ( 
//  //GPIO Control Signals
//  .HRST_N(sys_resetn),
//  .SRST_N(sys_resetn),
//  .MLTCN(1'b0), // 1: Multi Channel Mode, 0: 245 Mode 
//  .STREN(1'b0), // 1: Streaming Test,     0: Loopback Test
//  .ERDIS(1'b1), // 1: Disable received data sequence check  
//  .R_OOB(1'b0),
//  .W_OOB(1'b0),  
//  .WAKEUP_N(1'b0), 
//  // FIFO Slave interface 
//  .CLK	(IFC_CLK	   ),
//  .DATA	({mst_fifo_wire,IFC_DATA}	),
//  .BE		({mst_fifo_BE,IFC_BE}		),
//  .RXF_N	(IFC_RXF_N	),    // ACK_N
//  .TXE_N	(IFC_TXE_N	),
//  .WR_N	(IFC_WR_N	),    // REQ_N
//  .SIWU_N( ),
//  .RD_N	(IFC_RD_N	),
//  .OE_N	(IFC_OE_N	),
//  // Miscellaneous Interface 
//  .debug_sig(),
//  .STRER()
//);



usb_master 
#(

	.X86_CTRL_GPIO(X86_CTRL_GPIO)

) 
usb_master_i
(

  .CLK (IFC_CLK),
  .resetn(sys_resetn),
  .BCD_switch(BCD_switch),
  .DATA(IFC_DATA),
  .BE  (IFC_BE),
  .RXF_N(IFC_RXF_N	),    // ACK_N
  .TXE_N(IFC_TXE_N	),
  .WR_N(IFC_WR_N	),     // REQ_N
  .RD_N(IFC_RD_N	),
  .OE_N(IFC_OE_N	),
  .X_IN(FPGA_XIN),
  .Y_OUT(usb_OUT)

  

);




	
always@(posedge IFC_CLK)
begin
	
	if(!FPGA_nRST)
	begin
		read_count <= 16'd0;
		write_count <= 16'd0;
	end
	else
	begin

		if((!IFC_RD_N) && (!IFC_OE_N) && (!IFC_RXF_N))
		begin
			
			if(read_count < 16'd65535)
			begin
				read_count <= read_count + 1'b1;
			end
			
		end
		
		
		
		if((!IFC_TXE_N) && (!IFC_WR_N) )
		begin
		
			if(write_count < 16'd65535)
			begin
				write_count <= write_count + 1'b1;
			end

		end
	
	end
	
	
	if(read_count >= 16'd2048)
	begin
		usb_read_flg <= 1'b1;
	end
	else
	begin
		usb_read_flg <= 1'b0;
	end
	
	
	if(write_count >= 16'd2048)
	begin
		usb_write_flg <= 1'b1;
	end
	else
	begin
		usb_write_flg <= 1'b0;
	end
	
	
end

	
	  
always@(posedge c0_clk_5M)
begin
	clk5m_div <= clk5m_div + 1'b1;
end

mdio_cfg mdio_cfg_I
(
    .clk(clk5m_div[2]),
    .resetn(sys_resetn),//mdio_tvaild sys_resetn
    .mdc(FPGA_MDC),
    .mdio(FPGA_MDIO),
	 .revdata(),
	 .mdio_done()

);                

     
                                                              
endmodule 		  