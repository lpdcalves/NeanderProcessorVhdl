LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY main IS
	PORT (
		clk : IN std_logic;
		reset : IN std_logic;
		raw_data : IN std_logic_vector(8 DOWNTO 0);
		modo : IN std_logic_vector(1 DOWNTO 0);
		bnt_enter : IN std_logic;
		bnt_fim : IN std_logic;
		ac : OUT std_logic_vector(7 DOWNTO 0);
		d1 : OUT std_logic_vector(6 DOWNTO 0);
		d2 : OUT std_logic_vector(6 DOWNTO 0);
		memo : OUT std_logic_vector(7 DOWNTO 0)
	);
END main;

ARCHITECTURE comportamento OF main IS

	COMPONENT neander IS
		PORT (
			ck : IN std_logic;
			reset : IN std_logic;
			inst_end : IN std_logic_vector(7 DOWNTO 0);
			inst_cod : IN std_logic_vector(7 DOWNTO 0);
			program_data : IN std_logic_vector(7 DOWNTO 0);
			bnt_enter : IN std_logic;
			bnt_fim : IN std_logic;
			modo : IN std_logic_vector(1 DOWNTO 0);
			ac : OUT std_logic_vector(7 DOWNTO 0);
			memo : OUT std_logic_vector(7 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT conversor_display IS
		PORT (
			s1, s2, s3, s4 : IN std_logic;
			a, b, c, d, e, f, g : OUT std_logic
		);
	END COMPONENT;

	SIGNAL opCod : std_logic_vector(7 DOWNTO 0);
	SIGNAL endMemoria : std_logic_vector(7 DOWNTO 0);
	SIGNAL inputData : std_logic_vector(7 DOWNTO 0);
	SIGNAL ac_aux : std_logic_vector(7 DOWNTO 0);
	SIGNAL d1_aux : std_logic_vector(6 DOWNTO 0);
	SIGNAL d2_aux : std_logic_vector(6 DOWNTO 0);	

BEGIN

	ac <= ac_aux;
	d1 <= not(d1_aux);
	d2 <= not(d2_aux);

	neander1 : neander PORT MAP
	(
		ck => clk,
		reset => NOT(reset),
		inst_end => "000" & raw_data(4 DOWNTO 0),
		inst_cod => raw_data(8 DOWNTO 5) & "0000",
		program_data => raw_data(8 DOWNTO 1),
		bnt_enter => NOT(bnt_enter),
		bnt_fim => NOT(bnt_fim),
		modo => modo,
		ac => ac_aux,
		memo => memo
	);
	
	conv1 : conversor_display PORT MAP
	(
		ac_aux(3), ac_aux(2), ac_aux(1), ac_aux(0), 
		d1_aux(0), d1_aux(1), d1_aux(2), d1_aux(3), d1_aux(4), d1_aux(5), d1_aux(6));
	
	conv2 : conversor_display PORT MAP
	(
		ac_aux(7), ac_aux(6), ac_aux(5), ac_aux(4), 
		d2_aux(0), d2_aux(1), d2_aux(2), d2_aux(3), d2_aux(4), d2_aux(5), d2_aux(6));

END comportamento;
