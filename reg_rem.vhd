library ieee;
use ieee.std_logic_1164.all;

entity reg_rem is
	port(
	entrada : in std_logic_vector(7 downto 0);
	cargaREM : in std_logic;
	clock : in std_logic;
	saida : out std_logic_vector(7 downto 0)
	);
end reg_rem;

architecture comportamento of reg_rem is
signal aux : std_logic_vector(7 downto 0);
begin
	process(clock, cargaREM)
	begin
		if clock = '1' and cargaREM = '1' then
			aux <= entrada;
		end if;
	end process;
saida <= aux;
end comportamento;
