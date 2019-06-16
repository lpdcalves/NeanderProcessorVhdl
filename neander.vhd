-- UFRGS - II - PPGC - CMP114 - Marcelo Johann - 16/06/2003
-- Didatic Computer Neander - version 0.1 - LDA STA ADD JMP

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY neander IS
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
END ENTITY neander;

ARCHITECTURE comportamento OF neander IS

component memoria IS
	PORT(ck: IN std_logic;
		reset: IN std_logic;
		mem_read: IN std_logic;
		mem_write: IN std_logic;
		address: IN std_logic_vector(4 DOWNTO 0);
		rdm_out: IN std_logic_vector(7 DOWNTO 0);
		mem_out: OUT std_logic_vector(7 DOWNTO 0)
);
END component memoria; 

component ula2 IS
	PORT(ck: IN std_logic;
		alu_passy : IN std_logic;
		alu_add : IN std_logic;
		alu_or : IN std_logic;
		alu_and : IN std_logic;
		alu_not : IN std_logic;
		alux_in : IN std_logic_vector(7 DOWNTO 0);
		aluy_in : IN std_logic_vector(7 DOWNTO 0);
		alu_out : OUT std_logic_vector(7 DOWNTO 0);
		alun_out : OUT std_logic;
		aluz_out : OUT std_logic);
END component ula2; 


	TYPE memarray IS ARRAY (0 TO 31) OF std_logic_vector(7 DOWNTO 0);
	TYPE statetype IS (init, fetch0, fetch1, fetch2, decod,
		doaluop1, doaluop2, doaluop3, doaluop4,
		doaluop5load, doaluop5add, doaluop5or, doaluop5and,
		dostore1, dostore2, dostore3, dostore4, dostore5,
		dontjump, dojump1, dojump2, dojump3, doalunot);

	-- internal signals that connect architecture components
	SIGNAL mem_out : std_logic_vector(7 DOWNTO 0);
	SIGNAL pc_out : std_logic_vector(7 DOWNTO 0);
	SIGNAL ac_out : std_logic_vector(7 DOWNTO 0);
	SIGNAL ri_out : std_logic_vector(7 DOWNTO 0);
	SIGNAL rdm_out : std_logic_vector(7 DOWNTO 0);
	SIGNAL rem_out : std_logic_vector(7 DOWNTO 0);
	SIGNAL alux_in : std_logic_vector(7 DOWNTO 0);
	SIGNAL aluy_in : std_logic_vector(7 DOWNTO 0);
	SIGNAL alu_out : std_logic_vector(7 DOWNTO 0);
	SIGNAL alun_out : std_logic;
	SIGNAL aluz_out : std_logic;
	SIGNAL flagn_out : std_logic;
	SIGNAL flagz_out : std_logic;
	-- control signals: from FSM to datapath
	SIGNAL control_all : std_logic_vector(12 DOWNTO 0);
	SIGNAL mem_read : std_logic;
	SIGNAL mem_write : std_logic;
	SIGNAL pc_inc : std_logic;
	SIGNAL pc_load : std_logic;
	SIGNAL ri_load : std_logic;
	SIGNAL rdm_load : std_logic;
	SIGNAL rem_load0 : std_logic;
	SIGNAL rem_load1 : std_logic;
	-- signals below select alu operations and load ac and flags
	SIGNAL alu_passy : std_logic;
	SIGNAL alu_add : std_logic;
	SIGNAL alu_or : std_logic;
	SIGNAL alu_and : std_logic;
	SIGNAL alu_not : std_logic;
	-- load accumulator and flags is derived from alu operations
	SIGNAL acnz_load : std_logic;
	-- instruction mnemonics
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
	-- control machine states and memory
	SIGNAL state : statetype;
	SIGNAL address : std_logic_vector(4 DOWNTO 0);
	SIGNAL memdata : memarray;

BEGIN
	-- lets use good names for control signals
	mem_read <= control_all(12);
	mem_write <= control_all(11);
	pc_inc <= control_all(10);
	pc_load <= control_all(9);
	ri_load <= control_all(8);
	rdm_load <= control_all(7);
	rem_load0 <= control_all(6);
	rem_load1 <= control_all(5);
	alu_passy <= control_all(4);
	alu_add <= control_all(3);
	alu_or <= control_all(2);
	alu_and <= control_all(1);
	alu_not <= control_all(0);
	acnz_load <= alu_passy OR alu_add OR alu_or OR alu_and OR alu_not;
	
	
	-- simple interconnections of the datapath and outputs
	alux_in <= ac_out;
	aluy_in <= mem_out;
	pc <= pc_out;
	ri <= ri_out;
	ac <= ac_out;
	rrdm <= rdm_out;
	rrem <= rem_out;
	memo <= mem_out;

	-- FSM: the heart of the processor
	control : PROCESS (ck, reset)
	BEGIN
		IF (reset = '1') THEN
			state <= init;
		ELSIF (rising_edge(ck)) THEN
			CASE state IS
				WHEN init => state <= fetch0;
				WHEN fetch0 => state <= fetch1;
				WHEN fetch1 => state <= fetch2;
				WHEN fetch2 => state <= decod;
				WHEN decod =>
					CASE ri_out IS
						WHEN OPNOP => state <= fetch0;
						WHEN OPLDA => state <= doaluop1;
						WHEN OPSTA => state <= dostore1;
						WHEN OPADD => state <= doaluop1;
						WHEN OPOR => state <= doaluop1;
						WHEN OPAND => state <= doaluop1;
						WHEN OPNOT => state <= doalunot;
						WHEN OPJMP => state <= dojump1;
						WHEN OPJN => 
						   IF flagn_out = '1' THEN
								state <= dojump1;
							ELSE
								state <= dontjump;
							END IF;
				      WHEN OPJZ => 
						   IF flagz_out = '1' THEN
								state <= dojump1;
							ELSE 
								state <= dontjump;
							END IF;
						WHEN OPHLT => state <= decod;
						WHEN OTHERS => state <= fetch0;
					END CASE;
				WHEN doaluop1 => state <= doaluop2;
				WHEN doaluop2 => state <= doaluop3;
				WHEN doaluop3 => state <= doaluop4;
				WHEN doaluop4 => 
				   IF ri_out = OPLDA THEN
						state <= doaluop5load;
					ELSIF ri_out = OPADD THEN
						state <= doaluop5add;
					ELSIF ri_out = OPOR THEN
						state <= doaluop5or;
					ELSIF ri_out = OPAND THEN
						state <= doaluop5and;
					END IF;
				WHEN doaluop5load => state <= fetch0;
				WHEN doaluop5add => state <= fetch0;
				WHEN doaluop5or => state <= fetch0;
				WHEN doaluop5and => state <= fetch0;
				WHEN doalunot => state <= fetch0;
				WHEN dostore1 => state <= dostore2;
				WHEN dostore2 => state <= dostore3;
				WHEN dostore3 => state <= dostore4;
				WHEN dostore4 => state <= dostore5;
				WHEN dostore5 => state <= fetch0;
				WHEN dojump1 => state <= dojump2;
				WHEN dojump2 => state <= dojump3;
				WHEN dojump3 => state <= fetch0;
				WHEN dontjump => state <= fetch0;
				WHEN OTHERS => state <= fetch0;
			END CASE;
	END IF;
END PROCESS control;

-- control function of the states
WITH state SELECT
	control_all <= "0000000000000" WHEN init,
	"0000001000000" WHEN fetch0,
	"1010000000000" WHEN fetch1,
	"0000100000000" WHEN fetch2,
	"0000000000000" WHEN decod,
	"0000001000000" WHEN doaluop1,
	"1010000000000" WHEN doaluop2,
	"0000000100000" WHEN doaluop3,
	"1000000000000" WHEN doaluop4,
	"0000000010000" WHEN doaluop5load,
	"0000000001000" WHEN doaluop5add,
	"0000000000100" WHEN doaluop5or,
	"0000000000010" WHEN doaluop5and,
	"0000001000000" WHEN dostore1,
	"1010000000000" WHEN dostore2,
	"0000000100000" WHEN dostore3,
	"0000010000000" WHEN dostore4,
	"0100000000000" WHEN dostore5,
	"0010000000000" WHEN dontjump,
	"0000001000000" WHEN dojump1,
	"1010000000000" WHEN dojump2,
	"0001000000000" WHEN dojump3,
	"0000000000001" WHEN doalunot,
	"0000000000000" WHEN OTHERS;

WITH state SELECT
	estado <= x"00" WHEN init,
	x"01" WHEN fetch0,
	x"02" WHEN fetch1,
	x"03" WHEN fetch2,
	x"04" WHEN decod,
	x"05" WHEN doaluop1,
	x"06" WHEN doaluop2,
	x"07" WHEN doaluop3,
	x"08" WHEN doaluop4,
	x"09" WHEN doaluop5load,
	x"0a" WHEN doaluop5add,
	x"0b" WHEN doaluop5or,
	x"0c" WHEN doaluop5and,
	x"0d" WHEN dostore1,
	x"0e" WHEN dostore2,
	x"0f" WHEN dostore3,
	x"10" WHEN dostore4,
	x"11" WHEN dostore5,
	x"12" WHEN dontjump,
	x"13" WHEN dojump1,
	x"14" WHEN dojump2,
	x"15" WHEN dojump3,
	x"16" WHEN doalunot,
	x"17" WHEN OTHERS
	;

-- all datapath: registers, interconnections and muxes

datapath : PROCESS (ck, reset)
	VARIABLE pc_reg : std_logic_vector(7 DOWNTO 0);
BEGIN
	-- reset all registers
	IF (reset = '1') THEN
		ac_out <= "00000000";
		ri_out <= "00000000";
		pc_out <= "00000000";
		rdm_out <= "00000000";
		rem_out <= "00000000";
		flagn_out <= '0';
		flagz_out <= '0';
		pc_reg := "00000000";
		-- now the synchronized operations
	ELSIF (rising_edge(ck)) THEN
		-- accumulator
		IF (acnz_load = '1') THEN
			ac_out <= alu_out;
			flagn_out <= alun_out;
			flagz_out <= aluz_out;
		END IF;
		-- program counter
		IF (pc_load = '1') THEN
			pc_reg := mem_out;
		ELSIF (pc_inc = '1') THEN
			pc_reg := pc_reg + 1;
		END IF;
		pc_out <= pc_reg;
		-- other registers
		IF (rem_load0 = '1') THEN
			rem_out <= pc_out;
		ELSIF (rem_load1 = '1') THEN
			rem_out <= mem_out;
		END IF;
		IF (rdm_load = '1') THEN
			rdm_out <= ac_out;
		END IF;
		IF (ri_load = '1') THEN
			ri_out <= mem_out;
		END IF;
	END IF;
END PROCESS datapath;

ula1: ula2 port map 
	   (ck => ck,
		alu_passy => alu_passy,
		alu_add => alu_add,
		alu_or => alu_or,
		alu_and => alu_and,
		alu_not => alu_not,
		alux_in => alux_in,
		aluy_in => aluy_in,
		alu_out => alu_out,
		alun_out => alun_out,
		aluz_out => aluz_out);


memoria1 : memoria port map
      (ck => ck,
		reset => reset,
		mem_read => mem_read,
		mem_write => mem_write,
		address => rem_out(4 DOWNTO 0),
		rdm_out => rdm_out,
		mem_out => mem_out);

END ARCHITECTURE comportamento;
