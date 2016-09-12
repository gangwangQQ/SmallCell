// ***************************************************************************
// ***************************************************************************
// Copyright 2011(c) Analog Devices, Inc.
//
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     - Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     - Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in
//       the documentation and/or other materials provided with the
//       distribution.
//     - Neither the name of Analog Devices, Inc. nor the names of its
//       contributors may be used to endorse or promote products derived
//       from this software without specific prior written permission.
//     - The use of this software may or may not infringe the patent rights
//       of one or more patent holders.  This license does not release you
//       from the requirement that you obtain separate licenses from these
//       patent holders to use this software.
//     - Use of the software either in source or binary form, must be run
//       on or directly connected to an Analog Devices Inc. component.
//
// THIS SOFTWARE IS PROVIDED BY ANALOG DEVICES "AS IS" AND ANY EXPRESS OR
// IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, NON-INFRINGEMENT,
// MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
//
// IN NO EVENT SHALL ANALOG DEVICES BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, INTELLECTUAL PROPERTY RIGHTS, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
// USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ***************************************************************************
// ***************************************************************************
// ***************************************************************************
// ***************************************************************************
`timescale 1ps/1ps

module ad_serdes_in (

  // reset and clocks

  rst,
  clk,
  div_clk,
  loaden,
  clk_phase,

  // data interface

  data_s0,
  data_s1,
  data_s2,
  data_s3,
  data_s4,
  data_s5,
  data_s6,
  data_s7,
  data_in_p,
  data_in_n,

  // delay-data interface

  up_clk,
  up_dld,
  up_dwdata,
  up_drdata,

  // delay-control interface

  delay_clk,
  delay_rst,
  delay_locked);

  // parameters

  parameter       DEVICE_TYPE  = 0;

  // reset and clocks

  input           rst;
  input           clk;
  input           div_clk;
  input           loaden;
  input           clk_phase;

  // data interface

  output          data_s0;
  output          data_s1;
  output          data_s2;
  output          data_s3;
  output          data_s4;
  output          data_s5;
  output          data_s6;
  output          data_s7;
  input           data_in_p;
  input           data_in_n;

  // delay-data interface

  input           up_clk;
  input           up_dld;
  input    [ 4:0] up_dwdata;
  output   [ 4:0] up_drdata;

  // delay-control interface

  input           delay_clk;
  input           delay_rst;
  output          delay_locked;

  // internal signals

  wire     [ 7:0] data_out_s;

  assign data_s0 = data_out_s[0];
  assign data_s1 = data_out_s[1];
  assign data_s2 = data_out_s[2];
  assign data_s2 = data_out_s[2];
  assign data_s3 = data_out_s[3];
  assign data_s4 = data_out_s[4];
  assign data_s5 = data_out_s[5];
  assign data_s6 = data_out_s[6];
  assign data_s7 = data_out_s[7];

  altera_lvds_in i_altera_lvds_in (
    .ext_coreclock (div_clk),       //  ext_coreclock.export
    .ext_fclk (clk),                //  ext_fclk.export
    .ext_loaden (loaden),           //  ext_loaden.export
    .ext_pll_locked (),             //  ext_pll_locked.export
    .ext_vcoph (clk_phase),         //  ext_vcoph.export
    .rx_dpa_locked (delay_locked),  //  rx_dpa_locked.export
    .rx_in (data_in_p),             //  rx_in.export
    .rx_out (data_out_s)            //  rx_out.export
  );

endmodule
