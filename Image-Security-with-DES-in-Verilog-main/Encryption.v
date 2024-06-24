module encryption (input [64:1] plaintext, input [64:1]key, output reg [64:1] ciphertext);

reg [64:1] text_IP;
reg [32:1] r [16:0];
reg [32:1] l [16:0];
reg [32:1] out_fun [16:1];
reg [32:1] r_fun; wire [32:1] temp_out_fun; reg [48:1] key_fun;
integer i;
wire [48:1] key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16; 
reg [48:1] k [16:1]; 

key_sch ks (key,key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16);

blockFunction b(r_fun, key_fun, temp_out_fun);//invoking the module will create a unique object

always@(plaintext)
begin
    text_IP = IP_perm(plaintext);

{l[0],r[0]} = text_IP;

k[1] = key1; k[2]=key2; k[3] = key3; k[4]=key4; k[5] = key5; k[6]=key6; k[7] = key7; k[8]=key8; 
k[9] = key9; k[10]=key10; k[11] = key11; k[12]=key12; k[13] = key13; k[14]=key14; k[15] = key15; k[16] = key16 ; 


for(i=1; i<=16; i=i+1)
begin
	r_fun=r[i-1]; key_fun=k[i]; 
	#1 out_fun[i]=temp_out_fun;
	//$display("\nrfun=%b", r_fun);
	l[i] = r[i-1];
    r[i] = l[i-1]^out_fun[i];
end

ciphertext = IVP_perm({r[16],l[16]});

end


    //initial permutation block
    function [64:1]IP_perm ( input [64:1] plaintext);
    begin
        IP_perm[1] = plaintext[58];
        IP_perm[2] = plaintext[50];
        IP_perm[3] = plaintext[42];
        IP_perm[4] = plaintext[34];
        IP_perm[5] = plaintext[26];
        IP_perm[6] = plaintext[18];
        IP_perm[7] = plaintext[10];
        IP_perm[8] = plaintext[2];

        IP_perm[9] = plaintext[60];
        IP_perm[10] = plaintext[52];
        IP_perm[11] = plaintext[44];
        IP_perm[12] = plaintext[36];
        IP_perm[13] = plaintext[28];
        IP_perm[14] = plaintext[20];
        IP_perm[15] = plaintext[12];
        IP_perm[16] = plaintext[4];

        IP_perm[17] = plaintext[62];
        IP_perm[18] = plaintext[54];
        IP_perm[19] = plaintext[46];
        IP_perm[20] = plaintext[38];
        IP_perm[21] = plaintext[30];
        IP_perm[22] = plaintext[22];
        IP_perm[23] = plaintext[14];
        IP_perm[24] = plaintext[6];

        IP_perm[25] = plaintext[64];
        IP_perm[26] = plaintext[56];
        IP_perm[27] = plaintext[48];
        IP_perm[28] = plaintext[40];
        IP_perm[29] = plaintext[32];
        IP_perm[30] = plaintext[24];
        IP_perm[31] = plaintext[16];
        IP_perm[32] = plaintext[8];

        IP_perm[33] = plaintext[57];
        IP_perm[34] = plaintext[49];
        IP_perm[35] = plaintext[41];
        IP_perm[36] = plaintext[33];
        IP_perm[37] = plaintext[25];
        IP_perm[38] = plaintext[17];
        IP_perm[39] = plaintext[9];
        IP_perm[40] = plaintext[1];

        IP_perm[41] = plaintext[59];
        IP_perm[42] = plaintext[51];
        IP_perm[43] = plaintext[43];
        IP_perm[44] = plaintext[35];
        IP_perm[45] = plaintext[27];
        IP_perm[46] = plaintext[19];
        IP_perm[47] = plaintext[11];
        IP_perm[48] = plaintext[3];

        IP_perm[49] = plaintext[61];
        IP_perm[50] = plaintext[33];
        IP_perm[51] = plaintext[45];
        IP_perm[52] = plaintext[37];
        IP_perm[53] = plaintext[29];
        IP_perm[54] = plaintext[21];
        IP_perm[55] = plaintext[13];
        IP_perm[56] = plaintext[5];

        IP_perm[57] = plaintext[63];
        IP_perm[58] = plaintext[55];
        IP_perm[59] = plaintext[47];
        IP_perm[60] = plaintext[39];
        IP_perm[61] = plaintext[31];
        IP_perm[62] = plaintext[23];
        IP_perm[63] = plaintext[15];
        IP_perm[64] = plaintext[7];
        
    end
    endfunction

//inverse permutation block
    function [64:1]IVP_perm ( input [64:1] finaltext);
    begin
        IVP_perm[1] = plaintext[40];
        IVP_perm[2] = plaintext[8];
        IVP_perm[3] = plaintext[48];
        IVP_perm[4] = plaintext[16];
        IVP_perm[5] = plaintext[56];
        IVP_perm[6] = plaintext[24];
        IVP_perm[7] = plaintext[64];
        IVP_perm[8] = plaintext[32];

        IVP_perm[9] = plaintext[39];
        IVP_perm[10] = plaintext[7];
        IVP_perm[11] = plaintext[47];
        IVP_perm[12] = plaintext[15];
        IVP_perm[13] = plaintext[55];
        IVP_perm[14] = plaintext[23];
        IVP_perm[15] = plaintext[63];
        IVP_perm[16] = plaintext[31];

        IVP_perm[17] = plaintext[38];
        IVP_perm[18] = plaintext[6];
        IVP_perm[19] = plaintext[46];
        IVP_perm[20] = plaintext[14];
        IVP_perm[21] = plaintext[54];
        IVP_perm[22] = plaintext[22];
        IVP_perm[23] = plaintext[62];
        IVP_perm[24] = plaintext[30];

        IVP_perm[25] = plaintext[37];
        IVP_perm[26] = plaintext[5];
        IVP_perm[27] = plaintext[45];
        IVP_perm[28] = plaintext[13];
        IVP_perm[29] = plaintext[53];
        IVP_perm[30] = plaintext[21];
        IVP_perm[31] = plaintext[61];
        IVP_perm[32] = plaintext[29];

        IVP_perm[33] = plaintext[36];
        IVP_perm[34] = plaintext[4];
        IVP_perm[35] = plaintext[44];
        IVP_perm[36] = plaintext[12];
        IVP_perm[37] = plaintext[52];
        IVP_perm[38] = plaintext[20];
        IVP_perm[39] = plaintext[60];
        IVP_perm[40] = plaintext[28];

        IVP_perm[41] = plaintext[35];
        IVP_perm[42] = plaintext[3];
        IVP_perm[43] = plaintext[43];
        IVP_perm[44] = plaintext[11];
        IVP_perm[45] = plaintext[51];
        IVP_perm[46] = plaintext[19];
        IVP_perm[47] = plaintext[59];
        IVP_perm[48] = plaintext[27];

        IVP_perm[49] = plaintext[34];
        IVP_perm[50] = plaintext[2];
        IVP_perm[51] = plaintext[42];
        IVP_perm[52] = plaintext[10];
        IVP_perm[53] = plaintext[50];
        IVP_perm[54] = plaintext[18];
        IVP_perm[55] = plaintext[58];
        IVP_perm[56] = plaintext[26];

        IVP_perm[57] = plaintext[33];
        IVP_perm[58] = plaintext[1];
        IVP_perm[59] = plaintext[41];
        IVP_perm[60] = plaintext[9];
        IVP_perm[61] = plaintext[49];
        IVP_perm[62] = plaintext[17];
        IVP_perm[63] = plaintext[57];
        IVP_perm[64] = plaintext[25];
        
    end
    endfunction

endmodule

module blockFunction(
    input [32:1]right_bit,
    input [48:1]Inkey,
    output reg [32:1]out
    );
    
    reg [48:1]y;
    reg [48:1]Xor;
    reg [32:1]sub1;
     
    always@(right_bit) 
    begin
    y = expansion(right_bit);
    Xor=y^Inkey;
    sub1=substitution_box(Xor);
    out=permutation_final(sub1);
    end
    
    //expansion
    function [48:1]expansion(input [32:1]right_bit_32 );
    reg [48:1]exb;//exb=expansion box
    
    begin
     exb[47:44]=right_bit_32[32:29];
     exb[41:38]=right_bit_32[28:25];
     exb[35:32]=right_bit_32[24:21];
     exb[29:26]=right_bit_32[20:17];
     exb[23:20]=right_bit_32[16:13];
     exb[17:14]=right_bit_32[12:9];
     exb[11:8] =right_bit_32[8:5];
     exb[5:2]  =right_bit_32[4:1];
     {exb[24],exb[19],exb[18],exb[13],exb[12],exb[7],exb[6],exb[1]}
               ={right_bit_32[17],right_bit_32[12],right_bit_32[13],right_bit_32[8],
                right_bit_32[9],right_bit_32[4],right_bit_32[5],right_bit_32[32]};
     {exb[48],exb[43],exb[42],exb[37],exb[36],exb[31],exb[30],exb[25]}
               ={right_bit_32[1],right_bit_32[28],right_bit_32[29],right_bit_32[24],
                right_bit_32[25],right_bit_32[20],right_bit_32[21],right_bit_32[16]};
     expansion =exb;
   
     end   
     endfunction
     
   //Substitution box  
   
    function [32:1]substitution_box( input reg [47:0]x); 
    integer i;
    integer j;
    reg [3:0]col;
    reg [1:0]row;
    reg [31:0]sub;
    reg [3:0] S1[3:0][15:0];
    reg [3:0] S2[3:0][15:0];
    reg [3:0] S3[3:0][15:0];
    reg [3:0] S4[3:0][15:0];
    reg [3:0] S5[3:0][15:0];
    reg [3:0] S6[3:0][15:0];
    reg [3:0] S7[3:0][15:0];
    reg [3:0] S8[3:0][15:0];
    begin
            S1[0][0] = 4'd14;
			S1[0][1] = 4'd4;
			S1[0][2] = 4'd13;
			S1[0][3] = 4'd1;
			S1[0][4] = 4'd2;
			S1[0][5] = 4'd15;
			S1[0][6] = 4'd11;
			S1[0][7] = 4'd8;
			S1[0][8] = 4'd3;
			S1[0][9] =4'd10;
			S1[0][10] =4'd6;
			S1[0][11] = 4'd12;
			S1[0][12] = 4'd5;
			S1[0][13] = 4'd9;
			S1[0][14] = 4'd0;
			S1[0][15] = 4'd7;
			S1[1][0] = 4'd0;
			S1[1][1] = 4'd15;
			S1[1][2] = 4'd7;
			S1[1][3] = 4'd4;
			S1[1][4] = 4'd14;
			S1[1][5] = 4'd2;
			S1[1][6] = 4'd13;
			S1[1][7] = 4'd1;
			S1[1][8] = 4'd10;
			S1[1][9] = 4'd6;
			S1[1][10] =4'd 12;
			S1[1][11] = 4'd11;
			S1[1][12] = 4'd9;
			S1[1][13] = 4'd5;
			S1[1][14] = 4'd3;
			S1[1][15] = 4'd8;
			S1[2][0] = 4'd4;
			S1[2][1] = 4'd1;
			S1[2][2] = 4'd14;
			S1[2][3] = 4'd8;
			S1[2][4] = 4'd13;
			S1[2][5] = 4'd6;
			S1[2][6] = 4'd2;
			S1[2][7] = 4'd11;
			S1[2][8] = 4'd15;
			S1[2][9] = 4'd12;
			S1[2][10] =4'd 9;
			S1[2][11] = 4'd7;
			S1[2][12] = 4'd3;
			S1[2][13] = 4'd10;
			S1[2][14] = 4'd5;
			S1[2][15] = 4'd0;
			S1[3][0] = 4'd15;
			S1[3][1] = 4'd12;
			S1[3][2] = 4'd8;
			S1[3][3] = 4'd2;
			S1[3][4] = 4'd4;
			S1[3][5] = 4'd9;
			S1[3][6] = 4'd1;
			S1[3][7] = 4'd7;
			S1[3][8] = 4'd5;
			S1[3][9] = 4'd11;
			S1[3][10] =4'd 3;
			S1[3][11] = 4'd14;
			S1[3][12] = 4'd10;
			S1[3][13] = 4'd0;
			S1[3][14] = 4'd6;
			S1[3][15] = 4'd13;
			S2[0][0] = 4'd15;
			S2[0][1] = 4'd1;
			S2[0][2] = 4'd8;
			S2[0][3] = 4'd14;
			S2[0][4] = 4'd6;
			S2[0][5] = 4'd11;
			S2[0][6] = 4'd3;
			S2[0][7] = 4'd4;
			S2[0][8] = 4'd9;
			S2[0][9] = 4'd7;
			S2[0][10] =4'd2;
			S2[0][11] = 4'd13;
			S2[0][12] = 4'd12;
			S2[0][13] = 4'd0;
			S2[0][14] = 4'd5;
			S2[0][15] = 4'd10;
			S2[1][0] = 4'd3;
			S2[1][1] = 4'd13;
			S2[1][2] = 4'd4;
			S2[1][3] = 4'd7;
			S2[1][4] = 4'd15;
			S2[1][5] = 4'd2;
			S2[1][6] = 4'd8;
			S2[1][7] = 4'd14;
			S2[1][8] = 4'd12;
			S2[1][9] = 4'd0;
			S2[1][10] = 4'd1;
			S2[1][11] = 4'd10;
			S2[1][12] = 4'd6;
			S2[1][13] = 4'd9;
			S2[1][14] = 4'd11;
			S2[1][15] = 4'd5;
			S2[2][0] = 4'd0;
			S2[2][1] = 4'd14;
			S2[2][2] = 4'd7;
			S2[2][3] = 4'd11;
			S2[2][4] = 4'd10;
			S2[2][5] = 4'd4;
			S2[2][6] = 4'd13;
			S2[2][7] = 4'd1;
			S2[2][8] = 4'd5;
			S2[2][9] = 4'd8;
			S2[2][10] = 4'd12;
			S2[2][11] = 4'd6;
			S2[2][12] = 4'd9;
			S2[2][13] = 4'd3;
			S2[2][14] = 4'd2;
			S2[2][15] = 4'd15;
			S2[3][0] = 4'd13;
			S2[3][1] = 4'd8;
			S2[3][2] = 4'd10;
			S2[3][3] = 4'd1;
			S2[3][4] = 4'd3;
			S2[3][5] = 4'd15;
			S2[3][6] = 4'd4;
			S2[3][7] = 4'd2;
			S2[3][8] = 4'd11;
			S2[3][9] = 4'd6;
			S2[3][10] = 4'd7;
			S2[3][11] = 4'd12;
			S2[3][12] = 4'd0;
			S2[3][13] = 4'd5;
			S2[3][14] = 4'd14;
			S2[3][15] = 4'd9;
			S3[0][0] = 4'd10;
			S3[0][1] = 4'd0;
			S3[0][2] = 4'd9;
			S3[0][3] = 4'd14;
			S3[0][4] = 4'd6;
			S3[0][5] = 4'd3;
			S3[0][6] = 4'd15;
			S3[0][7] = 4'd5;
			S3[0][8] = 4'd1;
			S3[0][9] = 4'd13;
			S3[0][10] = 4'd12;
			S3[0][11] = 4'd7;
			S3[0][12] = 4'd11;
			S3[0][13] = 4'd4;
			S3[0][14] = 4'd2;
			S3[0][15] = 4'd8;
			S3[1][0] = 4'd13;
			S3[1][1] = 4'd7;
			S3[1][2] = 4'd0;
			S3[1][3] = 4'd9;
			S3[1][4] = 4'd3;
			S3[1][5] = 4'd4;
			S3[1][6] = 4'd6;
			S3[1][7] = 4'd10;
			S3[1][8] = 4'd2;
			S3[1][9] = 4'd8;
			S3[1][10] = 4'd5;
			S3[1][11] = 4'd14;
			S3[1][12] = 4'd12;
			S3[1][13] = 4'd11;
			S3[1][14] = 4'd15;
			S3[1][15] = 4'd1;
			S3[2][0] = 4'd13;
			S3[2][1] = 4'd6;
			S3[2][2] = 4'd4;
			S3[2][3] = 4'd9;
			S3[2][4] = 4'd8;
			S3[2][5] = 4'd15;
			S3[2][6] = 4'd3;
			S3[2][7] = 4'd0;
			S3[2][8] = 4'd11;
			S3[2][9] = 4'd1;
			S3[2][10] = 4'd2;
			S3[2][11] = 4'd12;
			S3[2][12] = 4'd5;
			S3[2][13] = 4'd10;
			S3[2][14] = 4'd14;
			S3[2][15] = 4'd7;
			S3[3][0] = 4'd1;
			S3[3][1] = 4'd10;
			S3[3][2] = 4'd13;
			S3[3][3] = 4'd0;
			S3[3][4] = 4'd6;
			S3[3][5] = 4'd9;
			S3[3][6] = 4'd8;
			S3[3][7] = 4'd7;
			S3[3][8] = 4'd4;
			S3[3][9] = 4'd15;
			S3[3][10] = 4'd14;
			S3[3][11] = 4'd3;
			S3[3][12] = 4'd11;
			S3[3][13] = 4'd5;
			S3[3][14] = 4'd2;
			S3[3][15] = 4'd12;
			S4[0][0] = 4'd7;
			S4[0][1] = 4'd13;
			S4[0][2] = 4'd14;
			S4[0][3] = 4'd3;
			S4[0][4] = 4'd0;
			S4[0][5] = 4'd6;
			S4[0][6] = 4'd9;
			S4[0][7] = 4'd10;
			S4[0][8] = 4'd1;
			S4[0][9] = 4'd2;
			S4[0][10] = 4'd8;
			S4[0][11] = 4'd5;
			S4[0][12] = 4'd11;
			S4[0][13] = 4'd12;
			S4[0][14] = 4'd4;
			S4[0][15] = 4'd15;
			S4[1][0] = 4'd13;
			S4[1][1] = 4'd8;
			S4[1][2] = 4'd11;
			S4[1][3] = 4'd5;
			S4[1][4] = 4'd6;
			S4[1][5] = 4'd15;
			S4[1][6] = 4'd0;
			S4[1][7] = 4'd3;
			S4[1][8] = 4'd4;
			S4[1][9] = 4'd7;
			S4[1][10] = 4'd2;
			S4[1][11] = 4'd12;
			S4[1][12] = 4'd1;
			S4[1][13] = 4'd10;
			S4[1][14] = 4'd14;
			S4[1][15] = 4'd9;
			S4[2][0] = 4'd10;
			S4[2][1] = 4'd6;
			S4[2][2] = 4'd9;
			S4[2][3] = 4'd0;
			S4[2][4] = 4'd12;
			S4[2][5] = 4'd11;
			S4[2][6] = 4'd7;
			S4[2][7] = 4'd13;
			S4[2][8] = 4'd15;
			S4[2][9] = 4'd1;
			S4[2][10] = 4'd3;
			S4[2][11] = 4'd14;
			S4[2][12] = 4'd5;
			S4[2][13] = 4'd2;
			S4[2][14] = 4'd8;
			S4[2][15] = 4'd4;
			S4[3][0] = 4'd3;
			S4[3][1] = 4'd15;
			S4[3][2] = 4'd0;
			S4[3][3] = 4'd6;
			S4[3][4] = 4'd10;
			S4[3][5] = 4'd1;
			S4[3][6] = 4'd13;
			S4[3][7] = 4'd8;
			S4[3][8] = 4'd9;
			S4[3][9] = 4'd4;
			S4[3][10] = 4'd5;
			S4[3][11] = 4'd11;
			S4[3][12] = 4'd12;
			S4[3][13] = 4'd7;
			S4[3][14] = 4'd2;
			S4[3][15] = 4'd14;
			S5[0][0] = 4'd2;
			S5[0][1] = 4'd12;
			S5[0][2] = 4'd4;
			S5[0][3] = 4'd1;
			S5[0][4] = 4'd7;
			S5[0][5] = 4'd10;
			S5[0][6] = 4'd11;
			S5[0][7] = 4'd6;
			S5[0][8] = 4'd8;
			S5[0][9] = 4'd5;
			S5[0][10] = 4'd3;
			S5[0][11] =4'd15;
			S5[0][12] = 4'd13;
			S5[0][13] = 4'd0;
			S5[0][14] = 4'd14;
			S5[0][15] = 4'd9;
			S5[1][0] = 4'd14;
			S5[1][1] = 4'd11;
			S5[1][2] = 4'd2;
			S5[1][3] = 4'd12;
			S5[1][4] = 4'd4;
			S5[1][5] = 4'd7;
			S5[1][6] =4'd13;
			S5[1][7] = 4'd1;
			S5[1][8] = 4'd5;
			S5[1][9] = 4'd0;
			S5[1][10] = 4'd15;
			S5[1][11] = 4'd10;
			S5[1][12] = 4'd3;
			S5[1][13] = 4'd9;
			S5[1][14] = 4'd8;
			S5[1][15] = 4'd6;
			S5[2][0] = 4'd4;
			S5[2][1] = 4'd2;
			S5[2][2] = 4'd1;
			S5[2][3] = 4'd11;
			S5[2][4] = 4'd10;
			S5[2][5] = 4'd13;
			S5[2][6] = 4'd7;
			S5[2][7] = 4'd8;
			S5[2][8] = 4'd15;
			S5[2][9] = 4'd9;
			S5[2][10] = 4'd12;
			S5[2][11] = 4'd5;
			S5[2][12] = 4'd6;
			S5[2][13] = 4'd3;
			S5[2][14] = 4'd0;
			S5[2][15] = 4'd14;
			S5[3][0] = 4'd11;
			S5[3][1] = 4'd8;
			S5[3][2] = 4'd12;
			S5[3][3] = 4'd7;
			S5[3][4] = 4'd1;
			S5[3][5] = 4'd14;
			S5[3][6] = 4'd2;
			S5[3][7] = 4'd13;
			S5[3][8] = 4'd6;
			S5[3][9] = 4'd15;
			S5[3][10] = 4'd0;
			S5[3][11] = 4'd9;
			S5[3][12] = 4'd10;
			S5[3][13] = 4'd4;
			S5[3][14] = 4'd5;
			S5[3][15] = 4'd3;
			S6[0][0] = 4'd12;
			S6[0][1] = 4'd1;
			S6[0][2] = 4'd10;
			S6[0][3] = 4'd15;
			S6[0][4] = 4'd9;
			S6[0][5] = 4'd2;
			S6[0][6] = 4'd6;
			S6[0][7] = 4'd8;
			S6[0][8] = 4'd0;
			S6[0][9] = 4'd13;
			S6[0][10] = 4'd3;
			S6[0][11] = 4'd4;
			S6[0][12] = 4'd14;
			S6[0][13] = 4'd7;
			S6[0][14] = 4'd5;
			S6[0][15] = 4'd11;
			S6[1][0] = 4'd10;
			S6[1][1] = 4'd15;
			S6[1][2] = 4'd4;
			S6[1][3] = 4'd2;
			S6[1][4] = 4'd7;
			S6[1][5] = 4'd12;
			S6[1][6] = 4'd9;
			S6[1][7] = 4'd5;
			S6[1][8] = 4'd6;
			S6[1][9] = 4'd1;
			S6[1][10] = 4'd13;
			S6[1][11] = 4'd14;
			S6[1][12] = 4'd0;
			S6[1][13] = 4'd11;
			S6[1][14] = 4'd3;
			S6[1][15] = 4'd8;
			S6[2][0] = 4'd9;
			S6[2][1] = 4'd14;
			S6[2][2] = 4'd15;
			S6[2][3] = 4'd5;
			S6[2][4] = 4'd2;
			S6[2][5] = 4'd8;
			S6[2][6] = 4'd12;
			S6[2][7] = 4'd3;
			S6[2][8] = 4'd7;
			S6[2][9] = 4'd0;
			S6[2][10] = 4'd4;
			S6[2][11] = 4'd10;
			S6[2][12] = 4'd1;
			S6[2][13] = 4'd13;
			S6[2][14] = 4'd11;
			S6[2][15] = 4'd6;
			S6[3][0] = 4'd4;
			S6[3][1] = 4'd3;
			S6[3][2] =4'd2;
			S6[3][3] = 4'd12;
			S6[3][4] = 4'd9;
			S6[3][5] = 4'd5;
			S6[3][6] = 4'd15;
			S6[3][7] = 4'd10;
			S6[3][8] = 4'd11;
			S6[3][9] = 4'd14;
			S6[3][10] = 4'd1;
			S6[3][11] = 4'd7;
			S6[3][12] = 4'd6;
			S6[3][13] = 4'd0;
			S6[3][14] = 4'd8;
			S6[3][15] = 4'd13;
			S7[0][0] = 4'd4;
			S7[0][1] = 4'd11;
			S7[0][2] = 4'd2;
			S7[0][3] = 4'd14;
			S7[0][4] = 4'd15;
			S7[0][5] = 4'd0;
			S7[0][6] = 4'd8;
			S7[0][7] = 4'd13;
			S7[0][8] = 4'd3;
			S7[0][9] = 4'd12;
			S7[0][10] = 4'd9;
			S7[0][11] = 4'd7;
			S7[0][12] = 4'd5;
			S7[0][13] = 4'd10;
			S7[0][14] = 4'd6;
			S7[0][15] = 4'd1;
			S7[1][0] = 4'd13;
			S7[1][1] = 4'd0;
			S7[1][2] = 4'd11;
			S7[1][3] = 4'd7;
			S7[1][4] = 4'd4;
			S7[1][5] = 4'd9;
			S7[1][6] = 4'd1;
			S7[1][7] = 4'd10;
			S7[1][8] = 4'd14;
			S7[1][9] = 4'd3;
			S7[1][10] = 4'd5;
			S7[1][11] = 4'd12;
			S7[1][12] = 4'd2;
			S7[1][13] = 4'd15;
			S7[1][14] = 4'd8;
			S7[1][15] = 4'd6;
			S7[2][0] = 4'd1;
			S7[2][1] = 4'd4;
			S7[2][2] =4'd11;
			S7[2][3] = 4'd13;
			S7[2][4] = 4'd12;
			S7[2][5] = 4'd3;
			S7[2][6] = 4'd7;
			S7[2][7] = 4'd14;
			S7[2][8] = 4'd10;
			S7[2][9] = 4'd15;
			S7[2][10] = 4'd6;
			S7[2][11] = 4'd8;
			S7[2][12] = 4'd0;
			S7[2][13] = 4'd5;
			S7[2][14] = 4'd9;
			S7[2][15] = 4'd2;
			S7[3][0] = 4'd6;
			S7[3][1] = 4'd11;
			S7[3][2] = 4'd13;
			S7[3][3] = 4'd8;
			S7[3][4] = 4'd1;
			S7[3][5] = 4'd4;
			S7[3][6] = 4'd10;
			S7[3][7] = 4'd7;
			S7[3][8] = 4'd9;
			S7[3][9] = 4'd5;
			S7[3][10] = 4'd0;
			S7[3][11] = 4'd15;
			S7[3][12] = 4'd14;
			S7[3][13] = 4'd2;
			S7[3][14] = 4'd3;
			S7[3][15] = 4'd12;
			S8[0][0] = 4'd13;
			S8[0][1] = 4'd2;
			S8[0][2] = 4'd8;
			S8[0][3] = 4'd4;
			S8[0][4] = 4'd6;
			S8[0][5] =4'd15;
			S8[0][6] = 4'd11;
			S8[0][7] = 4'd1;
			S8[0][8] = 4'd10;
			S8[0][9] = 4'd9;
			S8[0][10] = 4'd3;
			S8[0][11] = 4'd14;
			S8[0][12] = 4'd5;
			S8[0][13] = 4'd0;
			S8[0][14] = 4'd12;
			S8[0][15] = 4'd7;
			S8[1][0] = 4'd1;
			S8[1][1] = 4'd15;
			S8[1][2] = 4'd13;
			S8[1][3] = 4'd8;
			S8[1][4] = 4'd10;
			S8[1][5] = 4'd3;
			S8[1][6] = 4'd7;
			S8[1][7] = 4'd4;
			S8[1][8] = 4'd12;
			S8[1][9] = 4'd5;
			S8[1][10] = 4'd6;
			S8[1][11] = 4'd11;
			S8[1][12] = 4'd0;
			S8[1][13] = 4'd14;
			S8[1][14] = 4'd9;
			S8[1][15] = 4'd2;
			S8[2][0] = 4'd7;
			S8[2][1] = 4'd11;
			S8[2][2] = 4'd4;
			S8[2][3] = 4'd1;
			S8[2][4] = 4'd9;
			S8[2][5] = 4'd12;
			S8[2][6] = 4'd14;
			S8[2][7] = 4'd2;
			S8[2][8] = 4'd0;
			S8[2][9] = 4'd6;
			S8[2][10] = 4'd10;
			S8[2][11] = 4'd13;
			S8[2][12] = 4'd15;
			S8[2][13] = 4'd3;
			S8[2][14] = 4'd5;
			S8[2][15] = 4'd8;
			S8[3][0] = 4'd2;
			S8[3][1] = 4'd1;
			S8[3][2] = 4'd14;
			S8[3][3] = 4'd7;
			S8[3][4] = 4'd4;
			S8[3][5] = 4'd10;
			S8[3][6] = 4'd8;
			S8[3][7] = 4'd13;
			S8[3][8] = 4'd15;
			S8[3][9] = 4'd12;
			S8[3][10] = 4'd9;
			S8[3][11] = 4'd0;
			S8[3][12] = 4'd3;
			S8[3][13] = 4'd5;
			S8[3][14] = 4'd6;
			S8[3][15] =4'd11;
			
	    j=0;
		for(i=1;i<9;i=i+1)
		begin
		{row[1],col[3:0],row[0]}={x[j+5],x[j+4],x[j+3],x[j+2],x[j+1],x[j]};
		case(i)
		32'd1: sub[3:0]=S1[row][col];
		32'd2:sub[7:4]=S2[row][col];
		32'd3:sub[11:8]=S3[row][col];
		32'd4:sub[15:12]=S4[row][col];
	    32'd5:sub[19:16]=S5[row][col];
		32'd6:sub[23:20]=S6[row][col];
		32'd7:sub[27:24]=S7[row][col];
		32'd8:sub[31:28]=S8[row][col];
		endcase
		j=j+6;
		end
		substitution_box= sub;
    end
    endfunction
    
    //Last permutation 
  function [32:1]permutation_final(input [32:1]p);
  reg [32:1]final;
  begin
  final[32:1]={p[25],p[4],p[11],p[22],p[6],p[30],p[13],p[19],
               p[9],p[3],p[27],p[32],p[14],p[24],p[8],p[2],
               p[10],p[31],p[18],p[5],p[26],p[23],p[15],p[1],
               p[17],p[28],p[12],p[29],p[21],p[20],p[7],p[16]};
              
  permutation_final=final;
  end
  endfunction     
    
endmodule


module key_sch (input [64:1] in_key, output reg [48:1] key1, key2, key3, key4, key5, key6, key7, key8, key9, key10, key11, key12, key13, key14, key15, key16);
   //initial key permutation PC-1 which converts 64 bit key to 56 bit key
   function [56:1] pc1(input [64:1] in_key);
    begin
        pc1[56:1]={in_key[4], in_key[12], in_key[20], in_key[28], in_key[5], in_key[13], in_key[21],in_key[29],
        in_key[37], in_key[45], in_key[53], in_key[61], in_key[6], in_key[14], in_key[22],in_key[30],
        in_key[38], in_key[46], in_key[54], in_key[62], in_key[7], in_key[15], in_key[23],in_key[31],
        in_key[39], in_key[47], in_key[55], in_key[63], in_key[36], in_key[44], in_key[52],in_key[60],
        in_key[3], in_key[11], in_key[19], in_key[27], in_key[35], in_key[43], in_key[51],in_key[59],
        in_key[2], in_key[10], in_key[18], in_key[26], in_key[34], in_key[42], in_key[50],in_key[58],
        in_key[1], in_key[9], in_key[17], in_key[25], in_key[33], in_key[41], in_key[49],in_key[57]};
    end
   endfunction

   //round key permutation which converts 56 bit shifted input to 48 bit round key
   function [48:1] pc2(input [56:1] CiDi);
    begin
        pc2[1]=CiDi[14];
        pc2[2]=CiDi[17];
        pc2[3]=CiDi[11];
        pc2[4]=CiDi[24];
        pc2[5]=CiDi[1];
        pc2[6]=CiDi[5];
        pc2[7]=CiDi[3];
        pc2[8]=CiDi[28];

        pc2[9]=CiDi[15];
        pc2[10]=CiDi[6];
        pc2[11]=CiDi[21];
        pc2[12]=CiDi[10];
        pc2[13]=CiDi[23];
        pc2[14]=CiDi[19];
        pc2[15]=CiDi[12];
        pc2[16]=CiDi[4];

        pc2[17]=CiDi[26];
        pc2[18]=CiDi[8];
        pc2[19]=CiDi[16];
        pc2[20]=CiDi[7];
        pc2[21]=CiDi[27];
        pc2[22]=CiDi[20];
        pc2[23]=CiDi[13];
        pc2[24]=CiDi[2];

        pc2[25]=CiDi[41];
        pc2[26]=CiDi[52];
        pc2[27]=CiDi[31];
        pc2[28]=CiDi[37];
        pc2[29]=CiDi[47];
        pc2[30]=CiDi[55];
        pc2[31]=CiDi[30];
        pc2[32]=CiDi[40];

        pc2[33]=CiDi[51];
        pc2[34]=CiDi[45];
        pc2[35]=CiDi[33];
        pc2[36]=CiDi[48];
        pc2[37]=CiDi[44];
        pc2[38]=CiDi[49];
        pc2[39]=CiDi[39];
        pc2[40]=CiDi[56];

        pc2[41]=CiDi[34];
        pc2[42]=CiDi[53];
        pc2[43]=CiDi[46];
        pc2[44]=CiDi[42];
        pc2[45]=CiDi[50];
        pc2[46]=CiDi[36];
        pc2[47]=CiDi[29];
        pc2[48]=CiDi[32]; 

    end
   endfunction

   //left shifts
   function [56:1] cidi(input [28:1] c_prev, d_prev, input integer i);
   integer lshift [1:16];
   begin
    lshift[1]=1;
    lshift[2]=1;
    lshift[3]=2;
    lshift[4]=2;
    lshift[5]=2;
    lshift[6]=2;
    lshift[7]=2;
    lshift[8]=2;
    lshift[9]=1;
    lshift[10]=2;
    lshift[11]=2;
    lshift[12]=2;
    lshift[13]=2;
    lshift[14]=2;
    lshift[15]=2;
    lshift[16]=1;

    if(lshift[i]=='d1)
    cidi={c_prev[27:1], c_prev[28], d_prev[27:1], d_prev[28]};
    else if(lshift[i]=='d2)
    cidi={c_prev[26:1], c_prev[28:27], d_prev[26:1], d_prev[28:27]};
   end
   endfunction

   //behavioral block 
   reg [56:1] temp; //to store the value of the PC1 function
   reg [28:1] c[16:0], d[16:0];
   reg [48:1] rk[1:16]; //16 round keys
   integer i;
   always @(in_key)
   begin
    temp=pc1(in_key);
    c[0]=temp[56:29];
    d[0]=temp[28:1];
    for(i=1; i<=16; i=i+1)
    begin
        {c[i], d[i]}=cidi(c[i-1], d[i-1], i);
        rk[i]=pc2({c[i],d[i]});
    end
    key1=rk[1];
    key2=rk[2];
    key3=rk[3];
    key4=rk[4];
    key5=rk[5];
    key6=rk[6];
    key7=rk[7];
    key8=rk[8];
    key9=rk[9];
    key10=rk[10];
    key11=rk[11];
    key12=rk[12];
    key13=rk[13];
    key14=rk[14];
    key15=rk[15];
    key16=rk[16];
   end
  
endmodule
