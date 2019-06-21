LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity ULA is 
port(
	alux_in: in std_logic_vector (7 downto 0);
	aluy_in: in std_logic_vector(7 downto 0);

	alu_passy : IN std_logic;
	alu_add : IN std_logic;
	alu_or : IN std_logic;
	alu_and : IN std_logic;
	alu_not : IN std_logic;
	
	alu_out:	out std_logic_vector(7 downto 0);
	alun_out:	out std_logic;
	aluz_out:	out std_logic);
end ULA;

architecture ckt of ULA is

--somador
component somador8bits is 
port ( 
		asum : in std_logic_vector (7 downto 0); 
		bsum : in std_logic_vector (7 downto 0); 
		cinsum : in std_logic; 
		ssum : out std_logic_vector (7 downto 0); 
		coutsum : out std_logic);
end component;

component somador is 
port(a, b, cin : in std_logic;
	s, cout : out std_logic);
end component;

signal XPLUSY: std_logic_vector(7 downto 0);
signal bufferSaida : std_logic_vector(7 downto 0);


begin

	XPLUSY <= alux_in + aluy_in;
	
	bufferSaida <= XPLUSY when alu_add = '1' else
					(alux_in AND aluy_in) when alu_and = '1' else
					(alux_in OR aluy_in) when alu_or = '1' else
					(NOT alux_in) when alu_not = '1' else
					aluy_in when alu_passy = '1' else
					"ZZZZZZZZ";
	
	alun_out <= '1' when signed(bufferSaida) < 0 else '0';
	aluz_out <= '1' when bufferSaida = "00000000" else '0';
	alu_out <= bufferSaida;
	
end ckt;
