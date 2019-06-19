LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY main IS
	PORT (
		reset : IN std_logic;
		clk : IN std_logic;
		entrada : IN std_logic_vector(8 DOWNTO 0);
		modo : IN std_logic_vector(1 DOWNTO 0);
		bntEnter : IN  std_logic;
		btnFim : IN std_logic;
		
		ac : OUT std_logic_vector(7 DOWNTO 0)
	);
END main;

ARCHITECTURE comportamento OF main IS

	COMPONENT neander IS
		PORT (
			ck : IN std_logic;
			reset : IN std_logic;
			pc : OUT std_logic_vector(7 DOWNTO 0);
			ri : OUT std_logic_vector(7 DOWNTO 0);
			ac : OUT std_logic_vector(7 DOWNTO 0);
			rrdm : OUT std_logic_vector(7 DOWNTO 0);
			rrem : OUT std_logic_vector(7 DOWNTO 0);
			memo : OUT std_logic_vector(7 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT osc IS
		PORT (clk : OUT std_logic);
	END COMPONENT osc;

	SIGNAL opCod : std_logic_vector(7 DOWNTO 0);
	SIGNAL endMemoria : std_logic_vector(7 DOWNTO 0);
	SIGNAL inputData : std_logic_vector(7 DOWNTO 0);
	
	SIGNAL pc : std_logic_vector(7 DOWNTO 0);
	SIGNAL ri : std_logic_vector(7 DOWNTO 0);
	SIGNAL estado : std_logic_vector(7 DOWNTO 0);
	SIGNAL rrdm : std_logic_vector(7 DOWNTO 0);
	SIGNAL rrem : std_logic_vector(7 DOWNTO 0);
	SIGNAL memo : std_logic_vector(7 DOWNTO 0);

BEGIN
	endMemoria <= "000" & entrada (4 DOWNTO 0);
	opCod <= "0000" & entrada (8 DOWNTO 5);
	inputData <= entrada (8 DOWNTO 1);
	
	neander1 : neander PORT MAP(clk, reset, pc, ri, ac, rrdm, rrem, memo); 
 
END comportamento;

