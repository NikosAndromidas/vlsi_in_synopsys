/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Mon May 27 22:16:49 2024
/////////////////////////////////////////////////////////////


module vmcoffee ( clk, rst, c10, c5, nfc, water, beans, coffee, error );
  input [4:0] water;
  input clk, rst, c10, c5, nfc, beans;
  output coffee, error;
  wire   n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n46, n47, n48;
  wire   [1:0] state;

  ASYNC_DFFHx1_ASAP7_75t_R \state_reg[0]  ( .D(n47), .CLK(clk), .RESET(n46), 
        .SET(n22), .QN(state[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R \state_reg[1]  ( .D(n48), .CLK(clk), .RESET(n46), 
        .SET(n22), .QN(state[1]) );
  TIELOx1_ASAP7_75t_R U26 ( .L(n22) );
  AND2x2_ASAP7_75t_R U27 ( .A(nfc), .B(n27), .Y(n21) );
  OR2x2_ASAP7_75t_R U28 ( .A(n31), .B(n32), .Y(n40) );
  INVx1_ASAP7_75t_R U29 ( .A(n33), .Y(n34) );
  INVx1_ASAP7_75t_R U30 ( .A(beans), .Y(n35) );
  OAI21xp5_ASAP7_75t_R U31 ( .A1(n43), .A2(n42), .B(n21), .Y(n48) );
  NOR2xp33_ASAP7_75t_R U32 ( .A(c5), .B(n44), .Y(n43) );
  NOR2xp33_ASAP7_75t_R U33 ( .A(n41), .B(n40), .Y(n42) );
  NAND2xp5_ASAP7_75t_R U34 ( .A(n29), .B(n28), .Y(n33) );
  NOR2xp33_ASAP7_75t_R U35 ( .A(water[2]), .B(water[1]), .Y(n29) );
  NOR2xp33_ASAP7_75t_R U36 ( .A(water[4]), .B(water[3]), .Y(n28) );
  O2A1O1Ixp33_ASAP7_75t_R U37 ( .A1(n44), .A2(n41), .B(n21), .C(n26), .Y(
        coffee) );
  INVx1_ASAP7_75t_R U38 ( .A(c10), .Y(n27) );
  INVx1_ASAP7_75t_R U39 ( .A(c5), .Y(n41) );
  INVx1_ASAP7_75t_R U40 ( .A(rst), .Y(n46) );
  INVx1_ASAP7_75t_R U41 ( .A(state[0]), .Y(n23) );
  OAI21xp33_ASAP7_75t_R U42 ( .A1(n24), .A2(n41), .B(n21), .Y(n39) );
  INVxp67_ASAP7_75t_R U43 ( .A(state[1]), .Y(n30) );
  OAI22xp5_ASAP7_75t_R U44 ( .A1(c5), .A2(n40), .B1(n37), .B2(n36), .Y(n38) );
  INVx1_ASAP7_75t_R U45 ( .A(n25), .Y(n26) );
  AOI21xp5_ASAP7_75t_R U46 ( .A1(n39), .A2(n25), .B(n38), .Y(n47) );
  OAI21xp5_ASAP7_75t_R U47 ( .A1(n32), .A2(n31), .B(n44), .Y(n25) );
  INVx1_ASAP7_75t_R U48 ( .A(n23), .Y(n24) );
  OR2x2_ASAP7_75t_R U49 ( .A(n24), .B(n30), .Y(n44) );
  OR2x2_ASAP7_75t_R U50 ( .A(n24), .B(n35), .Y(n36) );
  OAI21xp5_ASAP7_75t_R U51 ( .A1(water[0]), .A2(n33), .B(beans), .Y(n32) );
  OR2x2_ASAP7_75t_R U52 ( .A(state[1]), .B(n23), .Y(n31) );
  OR2x2_ASAP7_75t_R U53 ( .A(state[1]), .B(n34), .Y(n37) );
  OAI21xp33_ASAP7_75t_R U54 ( .A1(state[1]), .A2(n23), .B(n44), .Y(error) );
endmodule

