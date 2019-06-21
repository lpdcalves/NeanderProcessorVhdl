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
		memo:	out std_logic_vector(7 downto 0)
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
			memo:	out std_logic_vector(7 downto 0)			
		);
	END COMPONENT;

	SIGNAL opCod : std_logic_vector(7 DOWNTO 0);
	SIGNAL endMemoria : std_logic_vector(7 DOWNTO 0);
	SIGNAL inputData : std_logic_vector(7 DOWNTO 0);

BEGIN

	neander1 : neander PORT MAP
	(
		ck => clk,
		reset => not(reset),
		inst_end => "000" & raw_data(4 DOWNTO 0),
		inst_cod => raw_data(8 DOWNTO 5) & "0000",
		program_data => raw_data(8 DOWNTO 1),
		bnt_enter => not(bnt_enter),
		bnt_fim => not(bnt_fim),			
		modo => modo,
		ac => ac,
		memo => memo
		);

END comportamento;

