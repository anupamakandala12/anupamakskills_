module conv(A,B,C);
input [71:0]A;
input [71:0] B;
output[71:0] C;

reg [71:0] C;
reg [3:0] A1[0:8];
reg [3:0] B1[0:8];
reg [7:0] C1[0:8];
integer i,j,k;
always@(A or B)
begin
    {A1[0],A1[1],A1[2],A1[3],A1[4], A1[5],A1[6],A1[7],A1[8]}=A;
    {B1[0],B1[1],B1[2],B1[3],B1[4],B1[5],B1[6],B1[7],B1[8]}=B;
    {C1[0],C1[1],C1[2],C1[3],C1[4],C1[5],C1[6],C1[7],C1[8]}=72'd0;
    i=0; 
    j=0;
    for(i=0;i<9;i=i+1)
    begin
        C1[i]=0;
        for (j=0;j<=i;j=j+1)
        begin
                C1[i]=(C1[i]+((A1[j])*B1[i-j]));
        end
        C={C1[0],C1[1],C1[2],C1[3],C1[4],C1[5],C1[6],C1[7],C1[8]};
    end
 end
endmodule