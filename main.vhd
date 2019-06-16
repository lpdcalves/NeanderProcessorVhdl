LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY main IS
	PORT (
		reset : IN std_logic;
		clk : IN std_logic;
		ac : OUT std_logic_vector(7 DOWNTO 0)
	);
END main;

ARCHITECTURE comportamento OF main IS

	COMPONENT neander IS
		PORT (
			-- little i/o: only power, clock and reset
			ck : IN std_logic;
			reset : IN std_logic;
			pc : OUT std_logic_vector(7 DOWNTO 0);
			ri : OUT std_logic_vector(7 DOWNTO 0);
			estado : OUT std_logic_vector(7 DOWNTO 0);
			ac : OUT std_logic_vector(7 DOWNTO 0);
			rrdm : OUT std_logic_vector(7 DOWNTO 0);
			rrem : OUT std_logic_vector(7 DOWNTO 0);
			memo : OUT std_logic_vector(7 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT osc IS
		PORT (clk : OUT std_logic);
	END COMPONENT osc;

	--signal clk: std_logic;
	SIGNAL pc : std_logic_vector(7 DOWNTO 0);
	SIGNAL ri : std_logic_vector(7 DOWNTO 0);
	SIGNAL estado : std_logic_vector(7 DOWNTO 0);
	SIGNAL rrdm : std_logic_vector(7 DOWNTO 0);
	SIGNAL rrem : std_logic_vector(7 DOWNTO 0);
	SIGNAL memo : std_logic_vector(7 DOWNTO 0);

BEGIN
	neander1 : neander PORT MAP(clk, reset, pc, ri, estado, ac, rrdm, rrem, memo); 
 
END comportamento;

