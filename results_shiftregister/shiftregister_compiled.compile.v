/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Mon May 27 22:08:54 2024
/////////////////////////////////////////////////////////////


module shiftregister ( rst, clk, pl, en, si, din, reg_out, so );
  input [3:0] din;
  output [3:0] reg_out;
  input rst, clk, pl, en, si;
  output so;
  wire   n1, n2, n4, n6, n8, n30, n31, n32, n33, n34, n35, n36, n37;

  DFFHQNx1_ASAP7_75t_R so_reg ( .D(n1), .CLK(clk), .QN(so) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_out_reg[0]  ( .D(n2), .CLK(clk), .RESET(n37), 
        .SET(n30), .QN(reg_out[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_out_reg[3]  ( .D(n8), .CLK(clk), .RESET(n37), 
        .SET(n30), .QN(reg_out[3]) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_out_reg[2]  ( .D(n6), .CLK(clk), .RESET(n37), 
        .SET(n30), .QN(reg_out[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R \reg_out_reg[1]  ( .D(n4), .CLK(clk), .RESET(n37), 
        .SET(n30), .QN(reg_out[1]) );
  TIELOx1_ASAP7_75t_R U32 ( .L(n30) );
  NAND2xp5_ASAP7_75t_R U33 ( .A(n33), .B(n32), .Y(n31) );
  INVx1_ASAP7_75t_R U34 ( .A(n36), .Y(n35) );
  NAND2xp5_ASAP7_75t_R U35 ( .A(n34), .B(rst), .Y(n36) );
  INVx1_ASAP7_75t_R U36 ( .A(n33), .Y(n34) );
  NAND2xp5_ASAP7_75t_R U37 ( .A(en), .B(n32), .Y(n33) );
  INVx1_ASAP7_75t_R U38 ( .A(pl), .Y(n32) );
  INVx1_ASAP7_75t_R U39 ( .A(rst), .Y(n37) );
  OAI22xp5_ASAP7_75t_R U40 ( .A1(reg_out[0]), .A2(n36), .B1(so), .B2(n35), .Y(
        n1) );
  OAI222xp33_ASAP7_75t_R U41 ( .A1(si), .A2(n33), .B1(din[3]), .B2(n32), .C1(
        reg_out[3]), .C2(n31), .Y(n8) );
  OAI222xp33_ASAP7_75t_R U42 ( .A1(reg_out[3]), .A2(n33), .B1(din[2]), .B2(n32), .C1(reg_out[2]), .C2(n31), .Y(n6) );
  OAI222xp33_ASAP7_75t_R U43 ( .A1(reg_out[2]), .A2(n33), .B1(din[1]), .B2(n32), .C1(reg_out[1]), .C2(n31), .Y(n4) );
  OAI222xp33_ASAP7_75t_R U44 ( .A1(reg_out[1]), .A2(n33), .B1(din[0]), .B2(n32), .C1(reg_out[0]), .C2(n31), .Y(n2) );
endmodule

