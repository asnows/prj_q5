
module iic_opr
(
	input clk,
	input[7:0] sendBytes,
	input tvalid,
	input[7:0] tdata,
	output tready,
	output SCL,
	output SDA
);

	localparam  START =2'b00,SEND = 2'b01, STOP = 2'b10,IDEL = 2'b11;

	 
	reg[1:0] state = IDEL;

	wire clk_n;

	reg tready_reg = 1'b1;
	reg scl_reg = 1'b1;
	reg sda_reg = 1'b1;
	reg[7:0] tdata_dly;

	reg tvalid_dly;
	reg[15:0] sendBits = 16'd0;
	reg[15:0] Bit_Counts= 16'd0;


	// 字节数转换成需要发送的位数
	//assign sendBits = (sendBytes << 3);
	assign clk_n = ~clk;

	assign tready = tready_reg;
	assign SCL = scl_reg;
	assign SDA = sda_reg;

	always@(posedge clk)
	begin
		tvalid_dly <= tvalid;
		
		// if(tvalid == 1'b1)
		// begin
			// tdata_dly  <= tdata;	
		// end
		
		tdata_dly  <= tdata;	
		//sendBits = (sendBytes << 3);
	end


	// 产生状态机
	always@(posedge clk)
	begin
		case(state)
			IDEL:
			begin
				if(~tvalid_dly & tvalid) // 上升沿
				begin
					state <= START;
				end
				else
				begin
					state <= IDEL;
				end
				
			end
			START:
			begin
				state <= SEND;	
				Bit_Counts <= 16'd0;
				sendBits = (sendBytes << 3);				
			end
			SEND:
			begin
				if(Bit_Counts < sendBits)
				begin
					if(scl_reg == 1'b0)
					begin
						//在IIC SCL 高电平时计数
						Bit_Counts <= Bit_Counts + 1;
					end
					state <= SEND;	
				end
				else
				begin
					
					state <= STOP;	
				end
			end
			STOP:
			begin
				state <= IDEL;	
			end
			
			default:
			begin
				state <= IDEL;
			end
				
		endcase
	end

	//产生SCL
	always@(posedge clk)
	begin
		case(state)
			IDEL:
			begin
				scl_reg <= 1'b1;
			end
			START:
			begin
				//scl_reg <= 1'b1;
				scl_reg <= ~scl_reg;
			end
			SEND:
			begin
				scl_reg <= ~scl_reg;
			end
			STOP:
			begin
				scl_reg <= 1'b1;
			end	
			default:
			begin
				scl_reg <= 1'b1;
			end
				
		endcase
	end


	// 产生SDA
	always@(posedge clk_n)
	begin
		case(state)
			IDEL:
			begin
				sda_reg <= 1'b1;
			end
			START:
			begin
				sda_reg <= 1'b0;
			end
			SEND:
			begin
				if(scl_reg == 1'b0)
				begin
					//在scl_reg 低电平改变数据
					sda_reg <= tdata_dly[Bit_Counts%8];
				end
				else
				begin
					sda_reg <= sda_reg;
				end
				
				
			end
			STOP:
			begin
				// 拉低，以便在下一个状态下好产生停止位
				sda_reg <= 1'b0;
				
			end	
			default:
			begin
				sda_reg <= 1'b1;
			end
				
		endcase
	end

	// 产生ready 信号
	always@(posedge clk_n)
	begin
		case(state)
			IDEL:
			begin
				if(~tvalid_dly & tvalid == 1'b1)
				begin
					tready_reg <= 1'b0;
				end
				else
				begin
					tready_reg <= 1'b1;
				end	
			end

			SEND:
			begin
				
				//当只传送一个字节及最后一个字节时，不需要产生tready
				if((sendBytes > 8'd1) && (Bit_Counts < (sendBits - 8'd4)))
				begin

				
					if((Bit_Counts > 15'd0) && ((Bit_Counts%8) == 15'd7) && (scl_reg == 1'b0))
					begin
						tready_reg <= 1'b1;
					end
					else
					begin
						tready_reg <= 1'b0;
					end	
				end
				
			end
					
		endcase
	end





endmodule