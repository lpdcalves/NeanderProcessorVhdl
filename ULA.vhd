LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity ULA is 
port(
	X: in std_logic_vector (7 downto 0);
	Y: in std_logic_vector(7 downto 0);
	selULA: in std_logic_vector(2 downto 0);
	
	out_ac:	out std_logic_vector(7 downto 0);
	out_n:	out std_logic;
	out_z:	out std_logic);
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

	--somador
	instanciaSomador: somador8bits port map (	asum(0)=>X(0), asum(1)=>X(1), asum(2)=>X(2), asum(3)=>X(3), asum(4)=>X(4), asum(5)=>X(5), asum(6)=>X(6), asum(7)=>X(7),
															bsum(0)=>Y(0), bsum(1)=>Y(1), bsum(2)=>Y(2), bsum(3)=>Y(3), bsum(4)=>Y(4), bsum(5)=>Y(5), bsum(6)=>Y(6), bsum(7)=>Y(7),
															ssum(0)=>XPLUSY(0), ssum(1)=>XPLUSY(1),	ssum(2)=>XPLUSY(2),	ssum(3)=>XPLUSY(3), ssum(4)=>XPLUSY(4), ssum(5)=>XPLUSY(5),	ssum(6)=>XPLUSY(6),	ssum(7)=>XPLUSY(7),
															cinsum => '0');
	
	bufferSaida <= XPLUSY when selULA = "000" else
					(X AND Y) when selULA = "001" else
					(X OR Y) when selULA = "010" else
					(NOT X) when selULA = "011" else
					Y when selULA = "100" else
					"ZZZZZZZZ";
	
	out_n <= '1' when signed(bufferSaida) < 0 else '0';
	out_z <= '1' when bufferSaida = "00000000" else '0';
	out_ac <= bufferSaida;
	
end ckt;
