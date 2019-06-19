library ieee;
use ieee.std_logic_1164.all;

entity ac is
	port(
	entrada : in std_logic_vector(7 downto 0);
	cargaAC : in std_logic;
	clock : in std_logic;
	saida : out std_logic_vector(7 downto 0)
	);
end ac;

architecture comportamento of ac is
signal aux : std_logic_vector(7 downto 0);
begin
	process(clock, cargaAC)
	begin
		if clock = '1' and cargaAC = '1' then
			aux <= entrada;
		end if;
	end process;
saida <= aux;
end comportamento;
