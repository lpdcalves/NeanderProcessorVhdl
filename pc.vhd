library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity pc is
	port(
	entrada : in std_logic_vector(7 downto 0);
	cargaPC : in std_logic;
	incrementarPC : in std_logic;
	clear : in std_logic;
	clock : in std_logic;
	saida : out std_logic_vector(7 downto 0)
	);
end pc;

architecture comportamento of pc is
signal aux : std_logic_vector(7 downto 0) := (others => '0');
begin	
	process (clock, cargaPC, clear)
	begin
		if clear = '1' then
			aux <= "00000000";
		elsif cargaPC = '1' then
			aux <= entrada;
		elsif rising_edge(clock) then
			if incrementarPC = '1' then
				aux <= aux + "00000001";
			else
				aux <= aux;
			end if;
		end if;
	end process;
saida <= aux;
end comportamento;