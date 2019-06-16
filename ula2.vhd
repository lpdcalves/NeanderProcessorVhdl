LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY ula2 IS
	PORT (
		ck : IN std_logic;
		alu_passy : IN std_logic;
		alu_add : IN std_logic;
		alu_or : IN std_logic;
		alu_and : IN std_logic;
		alu_not : IN std_logic;
		alux_in : IN std_logic_vector(7 DOWNTO 0);
		aluy_in : IN std_logic_vector(7 DOWNTO 0);
		alu_out : OUT std_logic_vector(7 DOWNTO 0);
		alun_out : OUT std_logic;
		aluz_out : OUT std_logic
	);
END ula2;

ARCHITECTURE comportamento OF ula2 IS

BEGIN
	alu : PROCESS (alux_in, aluy_in, alu_passy, 
			alu_add, alu_or, alu_and, alu_not)
		VARIABLE res : std_logic_vector(7 DOWNTO 0);
	BEGIN
		IF alu_passy = '1' THEN
			res := aluy_in;
		ELSIF alu_add = '1' THEN
			res := alux_in + aluy_in;
		ELSIF alu_or = '1' THEN
			res := alux_in OR aluy_in;
		ELSIF alu_and = '1' THEN
			res := alux_in AND aluy_in;
		ELSIF alu_not = '1' THEN
			res := NOT alux_in;
		END IF;
		IF res(7) = '1' THEN
			alun_out <= '1';
		ELSE
			alun_out <= '0';
		END IF;
		IF res = x"00" THEN
			aluz_out <= '1';
		ELSE
			aluz_out <= '0';
		END IF;
		alu_out <= res;
	END PROCESS alu;
END comportamento;
