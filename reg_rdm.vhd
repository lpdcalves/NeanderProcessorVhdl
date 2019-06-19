library ieee;
use ieee.std_logic_1164.all;

entity reg_rdm is
	port(
	entrada : in std_logic_vector(7 downto 0);
	cargaRDM : in std_logic;
	clock : in std_logic;
	clear : in std_logic;
	saida : out std_logic_vector(7 downto 0)
	);
end reg_rdm;

architecture comportamento of reg_rdm is
signal aux : std_logic_vector(7 downto 0);
begin
	process(clock, cargaRDM)
	begin
		if clear = '1' then
			aux <= "00000000";
		elsif rising_edge(clock) then
			if cargaRDM = '1' then
				aux <= entrada;
			else
				aux <= aux;
		end if;
	end process;
saida <= aux;
end comportamento;