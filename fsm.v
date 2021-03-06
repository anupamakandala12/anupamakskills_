module seq(
    input clk,
    input in,
    input rst,
    output reg [3:0]counter,
    output reg out);
    
parameter S0=3'b000,
          S1=3'b001,
          S2=3'b010,
          S3=3'b011,
          S4=3'b100;
                    
reg[2:0] c_state, n_state;
always@(posedge clk, posedge rst)
begin
if(rst==1)
c_state<=S0;
else
c_state<=n_state;
end

always@(c_state, in)
begin
    case(c_state)
    S0: begin
        if(in==1)
            n_state<=S1;
        else
            n_state<=S0;
        end
        
    S1:begin
        if(in==0)
            n_state<=S2;
        else
            n_state<=S1;
        end
        
    S2:begin
               if(in==1)
                   n_state<=S3;
               else
                   n_state<=S2;
               end 
                 
    S3: begin
                if(in==1)
                    n_state<=S4;
                else
                    n_state<=S3;
                end
    S4:begin
                if(in==0)
                n_state<=S2;
                else
                n_state<=S1;
                end
   default: n_state<=S0;
   endcase
   end
   
   always@(c_state)
   begin
   case(c_state)
    S0: out<=0;
    S1: out<=0;
    S2: out<=0;
    S3: out<=0;
    S4: out<=1;
    default: out<=0;
    endcase
    end
    
  always@(c_state)
    begin
    if(rst==1)
    counter<=0;
    else
    if(out==1)
    counter<=counter+1;
    else 
    counter<=counter;
    end 
endmodule