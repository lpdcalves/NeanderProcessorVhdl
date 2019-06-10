-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "06/10/2019 18:38:25"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ULA IS
    PORT (
	X : IN std_logic_vector(7 DOWNTO 0);
	Y : IN std_logic_vector(7 DOWNTO 0);
	selULA : IN std_logic_vector(2 DOWNTO 0);
	out_ac : OUT std_logic_vector(7 DOWNTO 0);
	out_n : OUT std_logic;
	out_z : OUT std_logic
	);
END ULA;

-- Design Ports Information
-- out_ac[0]	=>  Location: PIN_A21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- out_ac[1]	=>  Location: PIN_B21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- out_ac[2]	=>  Location: PIN_A22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- out_ac[3]	=>  Location: PIN_B22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- out_ac[4]	=>  Location: PIN_J18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- out_ac[5]	=>  Location: PIN_K16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- out_ac[6]	=>  Location: PIN_B20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- out_ac[7]	=>  Location: PIN_E20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- out_n	=>  Location: PIN_AC17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- out_z	=>  Location: PIN_D20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- selULA[0]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- selULA[1]	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- selULA[2]	=>  Location: PIN_K17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Y[0]	=>  Location: PIN_C22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- X[0]	=>  Location: PIN_C21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Y[1]	=>  Location: PIN_C23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- X[1]	=>  Location: PIN_D21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Y[2]	=>  Location: PIN_A23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- X[2]	=>  Location: PIN_F21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Y[3]	=>  Location: PIN_F20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- X[3]	=>  Location: PIN_E22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Y[4]	=>  Location: PIN_B23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- X[4]	=>  Location: PIN_D23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Y[5]	=>  Location: PIN_J16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- X[5]	=>  Location: PIN_A19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Y[6]	=>  Location: PIN_B19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- X[6]	=>  Location: PIN_C19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Y[7]	=>  Location: PIN_D19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- X[7]	=>  Location: PIN_A20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF ULA IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_X : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Y : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_selULA : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_out_ac : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_out_n : std_logic;
SIGNAL ww_out_z : std_logic;
SIGNAL \bufferSaida~20_combout\ : std_logic;
SIGNAL \instanciaSomador|gen:3:uut|s~0_combout\ : std_logic;
SIGNAL \instanciaSomador|gen:3:uut|s~combout\ : std_logic;
SIGNAL \bufferSaida[3]~21_combout\ : std_logic;
SIGNAL \instanciaSomador|gen:3:uut|cout~0_combout\ : std_logic;
SIGNAL \bufferSaida[0]~11_combout\ : std_logic;
SIGNAL \bufferSaida[0]~12_combout\ : std_logic;
SIGNAL \bufferSaida[7]~10_combout\ : std_logic;
SIGNAL \bufferSaida[1]~13_combout\ : std_logic;
SIGNAL \bufferSaida[1]~14_combout\ : std_logic;
SIGNAL \bufferSaida[1]~15_combout\ : std_logic;
SIGNAL \bufferSaida[1]~16_combout\ : std_logic;
SIGNAL \instanciaSomador|gen:1:uut|cout~0_combout\ : std_logic;
SIGNAL \bufferSaida[2]~17_combout\ : std_logic;
SIGNAL \bufferSaida[2]~18_combout\ : std_logic;
SIGNAL \bufferSaida[2]~19_combout\ : std_logic;
SIGNAL \bufferSaida[3]~22_combout\ : std_logic;
SIGNAL \bufferSaida[3]~23_combout\ : std_logic;
SIGNAL \bufferSaida[4]~25_combout\ : std_logic;
SIGNAL \bufferSaida[4]~38_combout\ : std_logic;
SIGNAL \bufferSaida[4]~24_combout\ : std_logic;
SIGNAL \bufferSaida[4]~26_combout\ : std_logic;
SIGNAL \bufferSaida[5]~28_combout\ : std_logic;
SIGNAL \instanciaSomador|gen:3:uut|cout~1_combout\ : std_logic;
SIGNAL \instanciaSomador|gen:4:uut|cout~0_combout\ : std_logic;
SIGNAL \bufferSaida[5]~27_combout\ : std_logic;
SIGNAL \bufferSaida[5]~29_combout\ : std_logic;
SIGNAL \bufferSaida[6]~32_combout\ : std_logic;
SIGNAL \bufferSaida[6]~31_combout\ : std_logic;
SIGNAL \bufferSaida[6]~33_combout\ : std_logic;
SIGNAL \bufferSaida[7]~36_combout\ : std_logic;
SIGNAL \bufferSaida[6]~30_combout\ : std_logic;
SIGNAL \bufferSaida[7]~34_combout\ : std_logic;
SIGNAL \bufferSaida[7]~35_combout\ : std_logic;
SIGNAL \bufferSaida[7]~37_combout\ : std_logic;
SIGNAL \Equal5~0_combout\ : std_logic;
SIGNAL \Equal5~1_combout\ : std_logic;
SIGNAL \Equal5~2_combout\ : std_logic;
SIGNAL \X~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \selULA~combout\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Y~combout\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_X <= X;
ww_Y <= Y;
ww_selULA <= selULA;
out_ac <= ww_out_ac;
out_n <= ww_out_n;
out_z <= ww_out_z;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: LCCOMB_X61_Y35_N6
\bufferSaida~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida~20_combout\ = (\Y~combout\(3)) # (\X~combout\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Y~combout\(3),
	datac => \X~combout\(3),
	combout => \bufferSaida~20_combout\);

-- Location: LCCOMB_X61_Y35_N8
\instanciaSomador|gen:3:uut|s~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \instanciaSomador|gen:3:uut|s~0_combout\ = \X~combout\(3) $ (((\Y~combout\(2) & ((\instanciaSomador|gen:1:uut|cout~0_combout\) # (\X~combout\(2)))) # (!\Y~combout\(2) & (\instanciaSomador|gen:1:uut|cout~0_combout\ & \X~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Y~combout\(2),
	datab => \instanciaSomador|gen:1:uut|cout~0_combout\,
	datac => \X~combout\(3),
	datad => \X~combout\(2),
	combout => \instanciaSomador|gen:3:uut|s~0_combout\);

-- Location: LCCOMB_X61_Y35_N18
\instanciaSomador|gen:3:uut|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \instanciaSomador|gen:3:uut|s~combout\ = \Y~combout\(3) $ (\instanciaSomador|gen:3:uut|s~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Y~combout\(3),
	datac => \instanciaSomador|gen:3:uut|s~0_combout\,
	combout => \instanciaSomador|gen:3:uut|s~combout\);

-- Location: LCCOMB_X61_Y35_N20
\bufferSaida[3]~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[3]~21_combout\ = (\selULA~combout\(1) & (((\selULA~combout\(0)) # (\bufferSaida~20_combout\)))) # (!\selULA~combout\(1) & (\instanciaSomador|gen:3:uut|s~combout\ & (!\selULA~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \selULA~combout\(1),
	datab => \instanciaSomador|gen:3:uut|s~combout\,
	datac => \selULA~combout\(0),
	datad => \bufferSaida~20_combout\,
	combout => \bufferSaida[3]~21_combout\);

-- Location: LCCOMB_X61_Y35_N10
\instanciaSomador|gen:3:uut|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \instanciaSomador|gen:3:uut|cout~0_combout\ = (\Y~combout\(3) & \X~combout\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Y~combout\(3),
	datac => \X~combout\(3),
	combout => \instanciaSomador|gen:3:uut|cout~0_combout\);

-- Location: PIN_A20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\X[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_X(7),
	combout => \X~combout\(7));

-- Location: PIN_C22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Y[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Y(0),
	combout => \Y~combout\(0));

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\selULA[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_selULA(1),
	combout => \selULA~combout\(1));

-- Location: PIN_C21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\X[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_X(0),
	combout => \X~combout\(0));

-- Location: LCCOMB_X60_Y35_N0
\bufferSaida[0]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[0]~11_combout\ = (\X~combout\(0) & (\selULA~combout\(0) $ (((\selULA~combout\(1)) # (!\Y~combout\(0)))))) # (!\X~combout\(0) & ((\selULA~combout\(0) & ((\selULA~combout\(1)))) # (!\selULA~combout\(0) & (\Y~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \selULA~combout\(0),
	datab => \Y~combout\(0),
	datac => \selULA~combout\(1),
	datad => \X~combout\(0),
	combout => \bufferSaida[0]~11_combout\);

-- Location: PIN_K17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\selULA[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_selULA(2),
	combout => \selULA~combout\(2));

-- Location: LCCOMB_X60_Y35_N18
\bufferSaida[0]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[0]~12_combout\ = (\selULA~combout\(2) & ((\Y~combout\(0)))) # (!\selULA~combout\(2) & (\bufferSaida[0]~11_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bufferSaida[0]~11_combout\,
	datac => \selULA~combout\(2),
	datad => \Y~combout\(0),
	combout => \bufferSaida[0]~12_combout\);

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\selULA[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_selULA(0),
	combout => \selULA~combout\(0));

-- Location: LCCOMB_X57_Y35_N16
\bufferSaida[7]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[7]~10_combout\ = ((!\selULA~combout\(1) & !\selULA~combout\(0))) # (!\selULA~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \selULA~combout\(1),
	datac => \selULA~combout\(0),
	datad => \selULA~combout\(2),
	combout => \bufferSaida[7]~10_combout\);

-- Location: PIN_D21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\X[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_X(1),
	combout => \X~combout\(1));

-- Location: LCCOMB_X60_Y35_N12
\bufferSaida[1]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[1]~13_combout\ = (\Y~combout\(0) & \X~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Y~combout\(0),
	datad => \X~combout\(0),
	combout => \bufferSaida[1]~13_combout\);

-- Location: LCCOMB_X60_Y35_N6
\bufferSaida[1]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[1]~14_combout\ = (\selULA~combout\(0) & (\selULA~combout\(1) $ ((!\X~combout\(1))))) # (!\selULA~combout\(0) & (!\selULA~combout\(1) & (\X~combout\(1) $ (\bufferSaida[1]~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001110010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \selULA~combout\(0),
	datab => \selULA~combout\(1),
	datac => \X~combout\(1),
	datad => \bufferSaida[1]~13_combout\,
	combout => \bufferSaida[1]~14_combout\);

-- Location: LCCOMB_X60_Y35_N8
\bufferSaida[1]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[1]~15_combout\ = (\X~combout\(1) & ((\selULA~combout\(1)))) # (!\X~combout\(1) & (\selULA~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \selULA~combout\(0),
	datab => \selULA~combout\(1),
	datac => \X~combout\(1),
	combout => \bufferSaida[1]~15_combout\);

-- Location: PIN_C23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Y[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Y(1),
	combout => \Y~combout\(1));

-- Location: LCCOMB_X60_Y35_N10
\bufferSaida[1]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[1]~16_combout\ = (\selULA~combout\(2) & (((\Y~combout\(1))))) # (!\selULA~combout\(2) & (\bufferSaida[1]~14_combout\ $ (((\bufferSaida[1]~15_combout\) # (\Y~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bufferSaida[1]~14_combout\,
	datab => \selULA~combout\(2),
	datac => \bufferSaida[1]~15_combout\,
	datad => \Y~combout\(1),
	combout => \bufferSaida[1]~16_combout\);

-- Location: LCCOMB_X60_Y35_N28
\instanciaSomador|gen:1:uut|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \instanciaSomador|gen:1:uut|cout~0_combout\ = (\Y~combout\(1) & ((\X~combout\(1)) # ((\Y~combout\(0) & \X~combout\(0))))) # (!\Y~combout\(1) & (\Y~combout\(0) & (\X~combout\(1) & \X~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Y~combout\(1),
	datab => \Y~combout\(0),
	datac => \X~combout\(1),
	datad => \X~combout\(0),
	combout => \instanciaSomador|gen:1:uut|cout~0_combout\);

-- Location: PIN_F21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\X[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_X(2),
	combout => \X~combout\(2));

-- Location: LCCOMB_X61_Y35_N16
\bufferSaida[2]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[2]~17_combout\ = (\selULA~combout\(1) & (((\X~combout\(2) & \selULA~combout\(0))))) # (!\selULA~combout\(1) & (\X~combout\(2) $ (((\instanciaSomador|gen:1:uut|cout~0_combout\) # (\selULA~combout\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \selULA~combout\(1),
	datab => \instanciaSomador|gen:1:uut|cout~0_combout\,
	datac => \X~combout\(2),
	datad => \selULA~combout\(0),
	combout => \bufferSaida[2]~17_combout\);

-- Location: LCCOMB_X61_Y35_N2
\bufferSaida[2]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[2]~18_combout\ = (\X~combout\(2) & (\selULA~combout\(1))) # (!\X~combout\(2) & ((\selULA~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \selULA~combout\(1),
	datac => \X~combout\(2),
	datad => \selULA~combout\(0),
	combout => \bufferSaida[2]~18_combout\);

-- Location: PIN_A23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Y[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Y(2),
	combout => \Y~combout\(2));

-- Location: LCCOMB_X61_Y35_N4
\bufferSaida[2]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[2]~19_combout\ = (\selULA~combout\(2) & (((\Y~combout\(2))))) # (!\selULA~combout\(2) & (\bufferSaida[2]~17_combout\ $ (((\bufferSaida[2]~18_combout\) # (\Y~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bufferSaida[2]~17_combout\,
	datab => \bufferSaida[2]~18_combout\,
	datac => \Y~combout\(2),
	datad => \selULA~combout\(2),
	combout => \bufferSaida[2]~19_combout\);

-- Location: PIN_F20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Y[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Y(3),
	combout => \Y~combout\(3));

-- Location: PIN_E22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\X[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_X(3),
	combout => \X~combout\(3));

-- Location: LCCOMB_X61_Y35_N22
\bufferSaida[3]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[3]~22_combout\ = (\bufferSaida[3]~21_combout\ & (((!\selULA~combout\(0)) # (!\X~combout\(3))))) # (!\bufferSaida[3]~21_combout\ & (\Y~combout\(3) & (\X~combout\(3) & \selULA~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bufferSaida[3]~21_combout\,
	datab => \Y~combout\(3),
	datac => \X~combout\(3),
	datad => \selULA~combout\(0),
	combout => \bufferSaida[3]~22_combout\);

-- Location: LCCOMB_X61_Y35_N0
\bufferSaida[3]~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[3]~23_combout\ = (\selULA~combout\(2) & ((\Y~combout\(3)))) # (!\selULA~combout\(2) & (\bufferSaida[3]~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \selULA~combout\(2),
	datab => \bufferSaida[3]~22_combout\,
	datac => \Y~combout\(3),
	combout => \bufferSaida[3]~23_combout\);

-- Location: PIN_D23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\X[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_X(4),
	combout => \X~combout\(4));

-- Location: LCCOMB_X61_Y35_N24
\bufferSaida[4]~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[4]~25_combout\ = (\X~combout\(4) & ((\selULA~combout\(1)))) # (!\X~combout\(4) & (\selULA~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \selULA~combout\(0),
	datab => \X~combout\(4),
	datad => \selULA~combout\(1),
	combout => \bufferSaida[4]~25_combout\);

-- Location: LCCOMB_X61_Y35_N14
\bufferSaida[4]~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[4]~38_combout\ = (\instanciaSomador|gen:3:uut|cout~1_combout\) # ((\Y~combout\(3) & \X~combout\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instanciaSomador|gen:3:uut|cout~1_combout\,
	datab => \Y~combout\(3),
	datac => \X~combout\(3),
	combout => \bufferSaida[4]~38_combout\);

-- Location: LCCOMB_X61_Y35_N30
\bufferSaida[4]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[4]~24_combout\ = (\selULA~combout\(1) & (\X~combout\(4) & ((\selULA~combout\(0))))) # (!\selULA~combout\(1) & (\X~combout\(4) $ (((\bufferSaida[4]~38_combout\) # (\selULA~combout\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100100010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \selULA~combout\(1),
	datab => \X~combout\(4),
	datac => \bufferSaida[4]~38_combout\,
	datad => \selULA~combout\(0),
	combout => \bufferSaida[4]~24_combout\);

-- Location: PIN_B23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Y[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Y(4),
	combout => \Y~combout\(4));

-- Location: LCCOMB_X61_Y35_N26
\bufferSaida[4]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[4]~26_combout\ = (\selULA~combout\(2) & (((\Y~combout\(4))))) # (!\selULA~combout\(2) & (\bufferSaida[4]~24_combout\ $ (((\bufferSaida[4]~25_combout\) # (\Y~combout\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bufferSaida[4]~25_combout\,
	datab => \bufferSaida[4]~24_combout\,
	datac => \Y~combout\(4),
	datad => \selULA~combout\(2),
	combout => \bufferSaida[4]~26_combout\);

-- Location: PIN_J16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Y[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Y(5),
	combout => \Y~combout\(5));

-- Location: PIN_A19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\X[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_X(5),
	combout => \X~combout\(5));

-- Location: LCCOMB_X57_Y35_N28
\bufferSaida[5]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[5]~28_combout\ = (\X~combout\(5) & (\selULA~combout\(1))) # (!\X~combout\(5) & ((\selULA~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \selULA~combout\(1),
	datac => \selULA~combout\(0),
	datad => \X~combout\(5),
	combout => \bufferSaida[5]~28_combout\);

-- Location: LCCOMB_X61_Y35_N12
\instanciaSomador|gen:3:uut|cout~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \instanciaSomador|gen:3:uut|cout~1_combout\ = (\bufferSaida~20_combout\ & ((\instanciaSomador|gen:1:uut|cout~0_combout\ & ((\Y~combout\(2)) # (\X~combout\(2)))) # (!\instanciaSomador|gen:1:uut|cout~0_combout\ & (\Y~combout\(2) & \X~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bufferSaida~20_combout\,
	datab => \instanciaSomador|gen:1:uut|cout~0_combout\,
	datac => \Y~combout\(2),
	datad => \X~combout\(2),
	combout => \instanciaSomador|gen:3:uut|cout~1_combout\);

-- Location: LCCOMB_X61_Y35_N28
\instanciaSomador|gen:4:uut|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \instanciaSomador|gen:4:uut|cout~0_combout\ = (\X~combout\(4) & ((\instanciaSomador|gen:3:uut|cout~0_combout\) # ((\Y~combout\(4)) # (\instanciaSomador|gen:3:uut|cout~1_combout\)))) # (!\X~combout\(4) & (\Y~combout\(4) & 
-- ((\instanciaSomador|gen:3:uut|cout~0_combout\) # (\instanciaSomador|gen:3:uut|cout~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \instanciaSomador|gen:3:uut|cout~0_combout\,
	datab => \X~combout\(4),
	datac => \Y~combout\(4),
	datad => \instanciaSomador|gen:3:uut|cout~1_combout\,
	combout => \instanciaSomador|gen:4:uut|cout~0_combout\);

-- Location: LCCOMB_X57_Y35_N10
\bufferSaida[5]~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[5]~27_combout\ = (\selULA~combout\(1) & (\X~combout\(5) & (\selULA~combout\(0)))) # (!\selULA~combout\(1) & (\X~combout\(5) $ (((\selULA~combout\(0)) # (\instanciaSomador|gen:4:uut|cout~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000110010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \selULA~combout\(1),
	datab => \X~combout\(5),
	datac => \selULA~combout\(0),
	datad => \instanciaSomador|gen:4:uut|cout~0_combout\,
	combout => \bufferSaida[5]~27_combout\);

-- Location: LCCOMB_X57_Y35_N30
\bufferSaida[5]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[5]~29_combout\ = (\selULA~combout\(2) & (\Y~combout\(5))) # (!\selULA~combout\(2) & (\bufferSaida[5]~27_combout\ $ (((\Y~combout\(5)) # (\bufferSaida[5]~28_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Y~combout\(5),
	datab => \bufferSaida[5]~28_combout\,
	datac => \bufferSaida[5]~27_combout\,
	datad => \selULA~combout\(2),
	combout => \bufferSaida[5]~29_combout\);

-- Location: PIN_C19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\X[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_X(6),
	combout => \X~combout\(6));

-- Location: LCCOMB_X57_Y35_N12
\bufferSaida[6]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[6]~32_combout\ = (\X~combout\(6) & ((\selULA~combout\(1)))) # (!\X~combout\(6) & (\selULA~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \selULA~combout\(0),
	datab => \selULA~combout\(1),
	datac => \X~combout\(6),
	combout => \bufferSaida[6]~32_combout\);

-- Location: LCCOMB_X57_Y35_N26
\bufferSaida[6]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[6]~31_combout\ = (\selULA~combout\(1) & (((\X~combout\(6) & \selULA~combout\(0))))) # (!\selULA~combout\(1) & (\X~combout\(6) $ (((\bufferSaida[6]~30_combout\) # (\selULA~combout\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bufferSaida[6]~30_combout\,
	datab => \selULA~combout\(1),
	datac => \X~combout\(6),
	datad => \selULA~combout\(0),
	combout => \bufferSaida[6]~31_combout\);

-- Location: PIN_B19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Y[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Y(6),
	combout => \Y~combout\(6));

-- Location: LCCOMB_X57_Y35_N22
\bufferSaida[6]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[6]~33_combout\ = (\selULA~combout\(2) & (((\Y~combout\(6))))) # (!\selULA~combout\(2) & (\bufferSaida[6]~31_combout\ $ (((\bufferSaida[6]~32_combout\) # (\Y~combout\(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bufferSaida[6]~32_combout\,
	datab => \bufferSaida[6]~31_combout\,
	datac => \Y~combout\(6),
	datad => \selULA~combout\(2),
	combout => \bufferSaida[6]~33_combout\);

-- Location: LCCOMB_X57_Y35_N6
\bufferSaida[7]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[7]~36_combout\ = (\X~combout\(7) & (\selULA~combout\(1))) # (!\X~combout\(7) & ((\selULA~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X~combout\(7),
	datab => \selULA~combout\(1),
	datac => \selULA~combout\(0),
	combout => \bufferSaida[7]~36_combout\);

-- Location: PIN_D19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Y[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Y(7),
	combout => \Y~combout\(7));

-- Location: LCCOMB_X57_Y35_N24
\bufferSaida[6]~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[6]~30_combout\ = (\Y~combout\(5) & ((\X~combout\(5)) # (\instanciaSomador|gen:4:uut|cout~0_combout\))) # (!\Y~combout\(5) & (\X~combout\(5) & \instanciaSomador|gen:4:uut|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Y~combout\(5),
	datab => \X~combout\(5),
	datad => \instanciaSomador|gen:4:uut|cout~0_combout\,
	combout => \bufferSaida[6]~30_combout\);

-- Location: LCCOMB_X57_Y35_N18
\bufferSaida[7]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[7]~34_combout\ = (\Y~combout\(6) & ((\X~combout\(6)) # (\bufferSaida[6]~30_combout\))) # (!\Y~combout\(6) & (\X~combout\(6) & \bufferSaida[6]~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Y~combout\(6),
	datab => \X~combout\(6),
	datac => \bufferSaida[6]~30_combout\,
	combout => \bufferSaida[7]~34_combout\);

-- Location: LCCOMB_X57_Y35_N20
\bufferSaida[7]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[7]~35_combout\ = (\selULA~combout\(1) & (\X~combout\(7) $ ((\selULA~combout\(0))))) # (!\selULA~combout\(1) & (!\selULA~combout\(0) & (\X~combout\(7) $ (\bufferSaida[7]~34_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100101001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X~combout\(7),
	datab => \selULA~combout\(1),
	datac => \selULA~combout\(0),
	datad => \bufferSaida[7]~34_combout\,
	combout => \bufferSaida[7]~35_combout\);

-- Location: LCCOMB_X57_Y35_N0
\bufferSaida[7]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \bufferSaida[7]~37_combout\ = (\selULA~combout\(2) & (((\Y~combout\(7))))) # (!\selULA~combout\(2) & (\bufferSaida[7]~35_combout\ $ (((!\bufferSaida[7]~36_combout\ & \Y~combout\(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bufferSaida[7]~36_combout\,
	datab => \Y~combout\(7),
	datac => \bufferSaida[7]~35_combout\,
	datad => \selULA~combout\(2),
	combout => \bufferSaida[7]~37_combout\);

-- Location: LCCOMB_X60_Y35_N22
\Equal5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal5~0_combout\ = (!\bufferSaida[1]~16_combout\ & (!\bufferSaida[0]~12_combout\ & (\bufferSaida[7]~10_combout\ & !\bufferSaida[2]~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bufferSaida[1]~16_combout\,
	datab => \bufferSaida[0]~12_combout\,
	datac => \bufferSaida[7]~10_combout\,
	datad => \bufferSaida[2]~19_combout\,
	combout => \Equal5~0_combout\);

-- Location: LCCOMB_X57_Y35_N8
\Equal5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal5~1_combout\ = (!\bufferSaida[4]~26_combout\ & (!\bufferSaida[6]~33_combout\ & (!\bufferSaida[5]~29_combout\ & !\bufferSaida[3]~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bufferSaida[4]~26_combout\,
	datab => \bufferSaida[6]~33_combout\,
	datac => \bufferSaida[5]~29_combout\,
	datad => \bufferSaida[3]~23_combout\,
	combout => \Equal5~1_combout\);

-- Location: LCCOMB_X57_Y35_N2
\Equal5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal5~2_combout\ = (\Equal5~0_combout\ & (!\bufferSaida[7]~37_combout\ & \Equal5~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~0_combout\,
	datab => \bufferSaida[7]~37_combout\,
	datac => \Equal5~1_combout\,
	combout => \Equal5~2_combout\);

-- Location: PIN_A21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\out_ac[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bufferSaida[0]~12_combout\,
	oe => \bufferSaida[7]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => ww_out_ac(0));

-- Location: PIN_B21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\out_ac[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bufferSaida[1]~16_combout\,
	oe => \bufferSaida[7]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => ww_out_ac(1));

-- Location: PIN_A22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\out_ac[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bufferSaida[2]~19_combout\,
	oe => \bufferSaida[7]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => ww_out_ac(2));

-- Location: PIN_B22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\out_ac[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bufferSaida[3]~23_combout\,
	oe => \bufferSaida[7]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => ww_out_ac(3));

-- Location: PIN_J18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\out_ac[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bufferSaida[4]~26_combout\,
	oe => \bufferSaida[7]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => ww_out_ac(4));

-- Location: PIN_K16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\out_ac[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bufferSaida[5]~29_combout\,
	oe => \bufferSaida[7]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => ww_out_ac(5));

-- Location: PIN_B20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\out_ac[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bufferSaida[6]~33_combout\,
	oe => \bufferSaida[7]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => ww_out_ac(6));

-- Location: PIN_E20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\out_ac[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \bufferSaida[7]~37_combout\,
	oe => \bufferSaida[7]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => ww_out_ac(7));

-- Location: PIN_AC17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\out_n~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_out_n);

-- Location: PIN_D20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\out_z~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Equal5~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_out_z);
END structure;


