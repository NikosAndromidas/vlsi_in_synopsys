/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Mon May 27 22:50:32 2024
/////////////////////////////////////////////////////////////


module rca ( a_i, b_i, sum_o );
  input [8:0] a_i;
  input [8:0] b_i;
  output [9:0] sum_o;
  wire   \fas[0].fa/N0 , n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56;
  assign sum_o[0] = \fas[0].fa/N0 ;

  AOI21xp33_ASAP7_75t_R U31 ( .A1(a_i[5]), .A2(b_i[5]), .B(n37), .Y(n38) );
  AND2x2_ASAP7_75t_R U32 ( .A(a_i[0]), .B(b_i[0]), .Y(n23) );
  OAI21xp33_ASAP7_75t_R U33 ( .A1(n49), .A2(n48), .B(n47), .Y(n51) );
  OAI21xp33_ASAP7_75t_R U34 ( .A1(n25), .A2(n27), .B(n29), .Y(n26) );
  OAI21xp33_ASAP7_75t_R U35 ( .A1(n33), .A2(n37), .B(n32), .Y(n34) );
  AO21x1_ASAP7_75t_R U36 ( .A1(n47), .A2(n42), .B(n46), .Y(n43) );
  AO21x1_ASAP7_75t_R U37 ( .A1(a_i[1]), .A2(b_i[1]), .B(n23), .Y(n28) );
  INVxp33_ASAP7_75t_R U38 ( .A(n23), .Y(n20) );
  OA21x2_ASAP7_75t_R U39 ( .A1(a_i[0]), .A2(b_i[0]), .B(n20), .Y(
        \fas[0].fa/N0 ) );
  INVxp67_ASAP7_75t_R U40 ( .A(b_i[1]), .Y(n21) );
  FAx1_ASAP7_75t_R U41 ( .A(a_i[1]), .B(n21), .CI(n23), .SN(sum_o[1]) );
  INVxp33_ASAP7_75t_R U42 ( .A(a_i[2]), .Y(n24) );
  INVxp33_ASAP7_75t_R U43 ( .A(a_i[1]), .Y(n22) );
  NAND2xp33_ASAP7_75t_R U44 ( .A(n22), .B(n21), .Y(n30) );
  AND2x2_ASAP7_75t_R U45 ( .A(n30), .B(n28), .Y(n25) );
  FAx1_ASAP7_75t_R U46 ( .A(b_i[2]), .B(n24), .CI(n25), .SN(sum_o[2]) );
  AND2x2_ASAP7_75t_R U47 ( .A(b_i[2]), .B(a_i[2]), .Y(n27) );
  OR2x2_ASAP7_75t_R U48 ( .A(b_i[2]), .B(a_i[2]), .Y(n29) );
  FAx1_ASAP7_75t_R U49 ( .A(a_i[3]), .B(b_i[3]), .CI(n26), .SN(sum_o[3]) );
  INVxp33_ASAP7_75t_R U50 ( .A(a_i[4]), .Y(n31) );
  AOI321xp33_ASAP7_75t_R U51 ( .A1(n30), .A2(n29), .A3(n28), .B1(b_i[3]), .B2(
        a_i[3]), .C(n27), .Y(n41) );
  NOR2xp33_ASAP7_75t_R U52 ( .A(a_i[3]), .B(b_i[3]), .Y(n40) );
  NOR2xp33_ASAP7_75t_R U53 ( .A(n41), .B(n40), .Y(n33) );
  FAx1_ASAP7_75t_R U54 ( .A(b_i[4]), .B(n31), .CI(n33), .SN(sum_o[4]) );
  AND2x2_ASAP7_75t_R U55 ( .A(b_i[4]), .B(a_i[4]), .Y(n37) );
  NOR2xp33_ASAP7_75t_R U56 ( .A(b_i[4]), .B(a_i[4]), .Y(n39) );
  INVxp33_ASAP7_75t_R U57 ( .A(n39), .Y(n32) );
  FAx1_ASAP7_75t_R U58 ( .A(a_i[5]), .B(b_i[5]), .CI(n34), .SN(sum_o[5]) );
  INVxp33_ASAP7_75t_R U59 ( .A(a_i[5]), .Y(n36) );
  INVxp33_ASAP7_75t_R U60 ( .A(b_i[5]), .Y(n35) );
  NAND2xp33_ASAP7_75t_R U61 ( .A(n36), .B(n35), .Y(n44) );
  OAI31xp33_ASAP7_75t_R U62 ( .A1(n41), .A2(n40), .A3(n39), .B(n38), .Y(n53)
         );
  NAND2xp5_ASAP7_75t_R U63 ( .A(n44), .B(n53), .Y(n42) );
  FAx1_ASAP7_75t_R U64 ( .A(b_i[6]), .B(a_i[6]), .CI(n42), .SN(sum_o[6]) );
  NAND2xp33_ASAP7_75t_R U65 ( .A(b_i[6]), .B(a_i[6]), .Y(n47) );
  NOR2xp33_ASAP7_75t_R U66 ( .A(b_i[6]), .B(a_i[6]), .Y(n46) );
  FAx1_ASAP7_75t_R U67 ( .A(a_i[7]), .B(b_i[7]), .CI(n43), .SN(sum_o[7]) );
  INVxp33_ASAP7_75t_R U68 ( .A(n44), .Y(n45) );
  NOR2xp33_ASAP7_75t_R U69 ( .A(n46), .B(n45), .Y(n52) );
  INVxp33_ASAP7_75t_R U70 ( .A(a_i[7]), .Y(n49) );
  INVxp33_ASAP7_75t_R U71 ( .A(b_i[7]), .Y(n48) );
  OR2x2_ASAP7_75t_R U72 ( .A(a_i[7]), .B(b_i[7]), .Y(n50) );
  A2O1A1Ixp33_ASAP7_75t_R U73 ( .A1(n53), .A2(n52), .B(n51), .C(n50), .Y(n56)
         );
  FAx1_ASAP7_75t_R U74 ( .A(a_i[8]), .B(b_i[8]), .CI(n56), .SN(sum_o[8]) );
  INVxp33_ASAP7_75t_R U75 ( .A(a_i[8]), .Y(n55) );
  INVxp33_ASAP7_75t_R U76 ( .A(b_i[8]), .Y(n54) );
  MAJIxp5_ASAP7_75t_R U77 ( .A(n56), .B(n55), .C(n54), .Y(sum_o[9]) );
endmodule

