LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY memoria IS
	PORT (
		ck : IN std_logic;
		reset : IN std_logic;
		mem_read : IN std_logic;
		mem_write : IN std_logic;
		address : IN std_logic_vector(4 DOWNTO 0);
		rdm_out : IN std_logic_vector(7 DOWNTO 0);
		mem_out : OUT std_logic_vector(7 DOWNTO 0)
	);
END memoria;

ARCHITECTURE comportamento OF memoria IS

	TYPE array_memoria IS ARRAY (0 TO 31) OF std_logic_vector(7 DOWNTO 0);

	SIGNAL memdata : array_memoria;

	CONSTANT OPNOP : std_logic_vector(7 DOWNTO 0) := "00000000";
	CONSTANT OPSTA : std_logic_vector(7 DOWNTO 0) := "00010000";
	CONSTANT OPLDA : std_logic_vector(7 DOWNTO 0) := "00100000";
	CONSTANT OPADD : std_logic_vector(7 DOWNTO 0) := "00110000";
	CONSTANT OPOR : std_logic_vector(7 DOWNTO 0) := "01000000";
	CONSTANT OPAND : std_logic_vector(7 DOWNTO 0) := "01010000";
	CONSTANT OPNOT : std_logic_vector(7 DOWNTO 0) := "01100000";
	CONSTANT OPJMP : std_logic_vector(7 DOWNTO 0) := "10000000";
	CONSTANT OPJN : std_logic_vector(7 DOWNTO 0) := "10010000";
	CONSTANT OPJZ : std_logic_vector(7 DOWNTO 0) := "10100000";
	CONSTANT OPHLT : std_logic_vector(7 DOWNTO 0) := "11110000";

BEGIN
	--address <= rem_out(4 DOWNTO 0);
	memory : PROCESS (ck, reset)
		VARIABLE i : INTEGER;
	BEGIN
		-- reset
		IF (reset = '1') THEN
 
			memdata(0) <= OPLDA;
			memdata(1) <= x"0A";
			memdata(2) <= OPADD;
			memdata(3) <= x"0B";
			memdata(4) <= OPJZ;
			memdata(5) <= x"08";
			memdata(6) <= OPLDA;
			memdata(7) <= x"0C";
			memdata(8) <= OPHLT;
			memdata(9) <= x"00";
			memdata(10) <= x"09";
			memdata(11) <= x"F6";
			memdata(12) <= x"03";
			memdata(13) <= x"00";
			memdata(14) <= x"00";
			memdata(15) <= x"00";
			memdata(16) <= x"00";
			memdata(17) <= x"00";
			memdata(18) <= x"00";
			memdata(19) <= x"00";
			memdata(20) <= x"00";
			memdata(21) <= x"00";
			memdata(22) <= x"00";
			memdata(23) <= x"00";
			memdata(24) <= x"00";
			memdata(25) <= x"00";
			memdata(26) <= x"00";
			memdata(27) <= x"00";
			memdata(28) <= x"00";
			memdata(29) <= x"00";
			memdata(30) <= x"00";
			memdata(31) <= x"00";

			-- synchronized operations
		ELSIF (rising_edge(ck)) THEN
			-- accumulator
			IF (mem_write = '1') THEN
				CASE address IS
					WHEN "00000" => memdata(0) <= rdm_out;
					WHEN "00001" => memdata(1) <= rdm_out;
					WHEN "00010" => memdata(2) <= rdm_out;
					WHEN "00011" => memdata(3) <= rdm_out;
					WHEN "00100" => memdata(4) <= rdm_out;
					WHEN "00101" => memdata(5) <= rdm_out;
					WHEN "00110" => memdata(6) <= rdm_out;
					WHEN "00111" => memdata(7) <= rdm_out;
					WHEN "01000" => memdata(8) <= rdm_out;
					WHEN "01001" => memdata(9) <= rdm_out;
					WHEN "01010" => memdata(10) <= rdm_out;
					WHEN "01011" => memdata(11) <= rdm_out;
					WHEN "01100" => memdata(12) <= rdm_out;
					WHEN "01101" => memdata(13) <= rdm_out;
					WHEN "01110" => memdata(14) <= rdm_out;
					WHEN "01111" => memdata(15) <= rdm_out;
					WHEN "10000" => memdata(16) <= rdm_out;
					WHEN "10001" => memdata(17) <= rdm_out;
					WHEN "10010" => memdata(18) <= rdm_out;
					WHEN "10011" => memdata(19) <= rdm_out;
					WHEN "10100" => memdata(20) <= rdm_out;
					WHEN "10101" => memdata(21) <= rdm_out;
					WHEN "10110" => memdata(22) <= rdm_out;
					WHEN "10111" => memdata(23) <= rdm_out;
					WHEN "11000" => memdata(24) <= rdm_out;
					WHEN "11001" => memdata(25) <= rdm_out;
					WHEN "11010" => memdata(26) <= rdm_out;
					WHEN "11011" => memdata(27) <= rdm_out;
					WHEN "11100" => memdata(28) <= rdm_out;
					WHEN "11101" => memdata(29) <= rdm_out;
					WHEN "11110" => memdata(30) <= rdm_out;
					WHEN "11111" => memdata(31) <= rdm_out;
					WHEN OTHERS => memdata(0) <= rdm_out;
				END CASE;
			END IF;
		END IF;
	END PROCESS memory;

	mem_out <= memdata(0) WHEN address = "00000" ELSE
	           memdata(1) WHEN address = "00001" ELSE
	           memdata(2) WHEN address = "00010" ELSE
	           memdata(3) WHEN address = "00011" ELSE
	           memdata(4) WHEN address = "00100" ELSE
	           memdata(5) WHEN address = "00101" ELSE
	           memdata(6) WHEN address = "00110" ELSE
	           memdata(7) WHEN address = "00111" ELSE
	           memdata(8) WHEN address = "01000" ELSE
	           memdata(9) WHEN address = "01001" ELSE
	           memdata(10) WHEN address = "01010" ELSE
	           memdata(11) WHEN address = "01011" ELSE
	           memdata(12) WHEN address = "01100" ELSE
	           memdata(13) WHEN address = "01101" ELSE
	           memdata(14) WHEN address = "01110" ELSE
	           memdata(15) WHEN address = "01111" ELSE
	           memdata(16) WHEN address = "10000" ELSE
	           memdata(17) WHEN address = "10001" ELSE
	           memdata(18) WHEN address = "10010" ELSE
	           memdata(19) WHEN address = "10011" ELSE
	           memdata(20) WHEN address = "10100" ELSE
	           memdata(21) WHEN address = "10101" ELSE
	           memdata(22) WHEN address = "10110" ELSE
	           memdata(23) WHEN address = "10111" ELSE
	           memdata(24) WHEN address = "11000" ELSE
	           memdata(25) WHEN address = "11001" ELSE
	           memdata(26) WHEN address = "11010" ELSE
	           memdata(27) WHEN address = "11011" ELSE
	           memdata(28) WHEN address = "11100" ELSE
	           memdata(29) WHEN address = "11101" ELSE
	           memdata(30) WHEN address = "11110" ELSE
	           memdata(31) WHEN address = "11111" ELSE
	           memdata(0);
END comportamento;
