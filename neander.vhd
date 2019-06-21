LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY neander IS
	PORT (
			ck : IN std_logic;
			reset : IN std_logic;
			inst_end : IN std_logic_vector(7 DOWNTO 0);
			inst_cod : IN std_logic_vector(7 DOWNTO 0);
			program_data : IN std_logic_vector(7 DOWNTO 0);
			bnt_enter : IN std_logic;
			bnt_fim : IN std_logic;			
			modo : IN std_logic_vector(1 DOWNTO 0);
			ac : OUT std_logic_vector(7 DOWNTO 0);
			memo:	out std_logic_vector(7 downto 0)
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

component ULA IS
	PORT(alu_passy : IN std_logic;
		alu_add : IN std_logic;
		alu_or : IN std_logic;
		alu_and : IN std_logic;
		alu_not : IN std_logic;
		alux_in : IN std_logic_vector(7 DOWNTO 0);
		aluy_in : IN std_logic_vector(7 DOWNTO 0);
		alu_out : OUT std_logic_vector(7 DOWNTO 0);
		alun_out : OUT std_logic;
		aluz_out : OUT std_logic);
END component ULA;

	TYPE memarray IS ARRAY (0 TO 31) OF std_logic_vector(7 DOWNTO 0);
	SIGNAL address : std_logic_vector(4 DOWNTO 0);
	SIGNAL memdata : memarray;
	
	TYPE tipoestado IS (
	   inicio,
	   doreadprog0, doreadprog1, doreadprog2, doreadprog3, doreadprog4a,
		doreadprog4b, doreadprog5, doreadprog6, doreadprog7, doreadprog8,   
	   doreaddata0, doreaddata1, doreaddata2, doreaddata3, doreaddata4, doreaddata5, 		
		init, fetch0, fetch1, fetch2, decod,
		doaluop1, doaluop2, doaluop3, doaluop4,
		doaluop5load, doaluop5add, doaluop5or, doaluop5and,
		dostore1, dostore2, dostore3, dostore4, dostore5,
		dontjump, dojump1, dojump2, dojump3, doalunot);
		
	SIGNAL estadoatual, proximoestado: tipoestado;	
		
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
	
	-- sinais de controle control: da máquina de estado para o datapath

	SIGNAL mem_read : std_logic;
	SIGNAL mem_write : std_logic;
	SIGNAL pc_inc : std_logic;
	SIGNAL pc_load : std_logic;
	SIGNAL ri_load : std_logic;
	SIGNAL rdm_load : std_logic;
	SIGNAL rem_load0 : std_logic;
	SIGNAL rem_load1 : std_logic;
	
	SIGNAL pc_load_start_code : std_logic; 
	SIGNAL pc_load_start_data : std_logic; 	
	SIGNAL rdm_load_inst_cod : std_logic;
	SIGNAL rdm_load_inst_end : std_logic;	
	SIGNAL rdm_load_prog_data : std_logic;
		
	-- signals below select alu operations and load ac and flags
	SIGNAL alu_passy : std_logic;
	SIGNAL alu_add : std_logic;
	SIGNAL alu_or : std_logic;
	SIGNAL alu_and : std_logic;
	SIGNAL alu_not : std_logic;
	
	-- load accumulator and flags is derived from alu operations
	SIGNAL acnz_load : std_logic;
	
	-- instrucoes
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
	
	-- Enderecos especiais na memoria 
	CONSTANT START_CODE : std_logic_vector(7 DOWNTO 0) := x"00"; -- inicio do programa na memoria
	CONSTANT START_DATA : std_logic_vector(7 DOWNTO 0) := x"1A"; -- inicio dos dados na memoria

BEGIN

	-- Conexoes entre o datapath e a maquina de estados finitos
	alux_in <= ac_out;
	aluy_in <= mem_out;
	memo <= mem_out;
	ac <= ac_out;
	
	-- Registrador de estado
	regestado : PROCESS (ck, reset)	
	BEGIN
		IF (reset = '1') THEN
			estadoatual <= inicio;
		ELSIF (rising_edge(ck)) THEN
			estadoatual <= proximoestado;
		END IF;
	END PROCESS;
	
	-- Logica combinacional da maquina de estados finitos
	logicacomb_input : PROCESS(estadoatual, bnt_enter, bnt_fim, modo, 
	                           inst_end, inst_cod, program_data,
	                           ri_out, flagz_out, flagz_out)		
	BEGIN
		
		pc_load_start_code <= '0';
		pc_load_start_data <= '0';
		rdm_load_inst_cod <= '0';
		rdm_load_inst_end <= '0';
		rdm_load_prog_data <= '0';

		mem_read <= '0';
		mem_write <= '0';
		pc_inc <= '0';
		pc_load <= '0';
		ri_load <= '0';
		rdm_load <= '0';
		rem_load0 <= '0';
		rem_load1 <= '0';
		alu_passy <= '0';
		alu_add <= '0';
		alu_or <= '0';
		alu_and <= '0';
		alu_not <= '0';

		CASE estadoatual IS
		
         -- inicio da maquina de estados		
			WHEN inicio => 
				IF (bnt_enter = '1') and (modo = "00") THEN				   
					proximoestado <= doreadprog0;
				ELSIF (bnt_enter = '1') and (modo = "01") THEN	
					proximoestado <= doreaddata0;
				ELSIF (bnt_enter = '1') and (modo = "10") THEN	
					proximoestado <= init;
				ELSE
					proximoestado <= inicio;
				END IF;
				
			-- maquina de estados para carregar um programa na memoria	
			WHEN doreadprog0 => 
				pc_load_start_code <= '1'; 
				proximoestado <= doreadprog1;
			WHEN doreadprog1 => 
				rem_load0 <= '1'; 
				proximoestado <= doreadprog2;
			WHEN doreadprog2 => 
			   pc_inc <= '1';
				rdm_load_inst_cod <= '1';
				proximoestado <= doreadprog3;
			WHEN doreadprog3 => 
				mem_write <= '1';
				proximoestado <= doreadprog4a;			
			WHEN doreadprog4a =>
				IF (inst_cod = OPHLT) THEN				
					proximoestado <= doreadprog7;
				ELSIF (inst_cod = OPNOT) THEN				
					proximoestado <= doreadprog7;		
				ELSIF (inst_cod = OPNOP) THEN				
					proximoestado <= doreadprog7;						
				ELSE 					
					proximoestado <= doreadprog4b;
				END IF;
			WHEN doreadprog4b =>
				rem_load0 <= '1';
				proximoestado <= doreadprog5;				
			WHEN doreadprog5 =>
				pc_inc <= '1';
				rdm_load_inst_end <= '1';		
				proximoestado <= doreadprog6;
			WHEN doreadprog6 =>	 
				mem_write <= '1';
				proximoestado <= doreadprog7;	
			WHEN doreadprog7 =>	 
				IF (bnt_enter = '1') THEN				   
					proximoestado <= doreadprog7;
				ELSE
					proximoestado <= doreadprog8;			
				END IF;					
			WHEN doreadprog8 => 	
				IF (bnt_fim = '1') THEN				   
					proximoestado <= inicio;
				ELSIF (bnt_enter = '1') THEN	
					proximoestado <= doreadprog1;
				ELSE 
					proximoestado <= doreadprog8;
				END IF;
				
			-- maquina de estados para carregar dados na memoria	
			WHEN doreaddata0 => 
				pc_load_start_data <= '1'; 
				proximoestado <= doreaddata1;
			WHEN doreaddata1 => 
				rem_load0 <= '1'; 
				proximoestado <= doreaddata2;
			WHEN doreaddata2 => 
			   pc_inc <= '1';
				rdm_load_prog_data <= '1';
				proximoestado <= doreaddata3;
			WHEN doreaddata3 => 
				mem_write <= '1';
				proximoestado <= doreaddata4;
			WHEN doreaddata4 =>	 
				IF (bnt_enter = '1') THEN				   
					proximoestado <= doreaddata4;
				ELSE
					proximoestado <= doreaddata5;			
				END IF;					
			WHEN doreaddata5 => 	
				IF (bnt_fim = '1') THEN				   
					proximoestado <= inicio;
				ELSIF (bnt_enter = '1') THEN	
					proximoestado <= doreaddata1;
				ELSE 
					proximoestado <= doreaddata5;
				END IF;	
				
			-- maquina de estados do computador neander	
			WHEN init =>
			   pc_load_start_code <= '1';
				proximoestado <= fetch0;
			WHEN fetch0 => 
				rem_load0 <= '1'; 
				proximoestado <= fetch1;
			WHEN fetch1 => 
				mem_read <= '1'; 
				pc_inc <= '1'; 
				proximoestado <= fetch2;
			WHEN fetch2 => 
				ri_load <= '1';
				proximoestado <= decod;
			WHEN decod =>
				CASE ri_out IS
					WHEN OPNOP => 
						proximoestado <= fetch0;
					WHEN OPLDA => 
						proximoestado <= doaluop1;
					WHEN OPSTA => 
						proximoestado <= dostore1;
					WHEN OPADD => 
						proximoestado <= doaluop1;
					WHEN OPOR => 
						proximoestado <= doaluop1;
					WHEN OPAND => 
						proximoestado <= doaluop1;
					WHEN OPNOT => 
						proximoestado <= doalunot;
					WHEN OPJMP => 
						proximoestado <= dojump1;
					WHEN OPJN => 
					   IF flagn_out = '1' THEN
							proximoestado <= dojump1;
						ELSE
							proximoestado <= dontjump;
						END IF;
					WHEN OPJZ => 
						IF flagz_out = '1' THEN
							proximoestado <= dojump1;
						ELSE 
							proximoestado <= dontjump;
						END IF;
					WHEN OPHLT => 
						proximoestado <= inicio;
					WHEN OTHERS => 
						proximoestado <= inicio;
				END CASE;
			WHEN doaluop1 => 
				rem_load0 <= '1'; 
				proximoestado <= doaluop2;
			WHEN doaluop2 => 
				mem_read <= '1'; 
				pc_inc <= '1';
				proximoestado <= doaluop3;
			WHEN doaluop3 => 
				rem_load1 <= '1';      
				proximoestado <= doaluop4;
			WHEN doaluop4 => 
				mem_read <= '1';
				IF ri_out = OPLDA THEN
					proximoestado <= doaluop5load;
				ELSIF ri_out = OPADD THEN
					proximoestado <= doaluop5add;
				ELSIF ri_out = OPOR THEN
					proximoestado <= doaluop5or;
				ELSIF ri_out = OPAND THEN
					proximoestado <= doaluop5and;
				END IF;
			WHEN doaluop5load => 
				alu_passy <= '1';
				proximoestado <= fetch0;
			WHEN doaluop5add => 
				alu_add <= '1';
				proximoestado <= fetch0;
			WHEN doaluop5or => 
				alu_or <= '1';
				proximoestado <= fetch0;
			WHEN doaluop5and => 
				alu_and <= '1'; 
				proximoestado <= fetch0;
			WHEN doalunot => 
				alu_not <= '1';
				proximoestado <= fetch0;
			WHEN dostore1 => 
				rem_load0 <= '1'; 
				proximoestado <= dostore2;
			WHEN dostore2 => 
				mem_read <= '1'; 
				pc_inc <= '1';
				proximoestado <= dostore3;
			WHEN dostore3 => 
				rem_load1 <= '1'; 
				proximoestado <= dostore4;
			WHEN dostore4 => 
				rdm_load <= '1';
				proximoestado <= dostore5;
			WHEN dostore5 => 
				mem_write <= '1';
				proximoestado <= fetch0;
			WHEN dojump1 => 
				rem_load0 <= '1'; 
				proximoestado <= dojump2;
			WHEN dojump2 => 
				mem_read <= '1'; 
				pc_inc <= '1'; 
				proximoestado <= dojump3;
			WHEN dojump3 => 
				pc_load <= '1'; 
				proximoestado <= fetch0;
			WHEN dontjump => 
				pc_inc <= '1';
				proximoestado <= fetch0;
			WHEN OTHERS => 
				proximoestado <= inicio;
		END CASE;
		acnz_load <= alu_passy OR alu_add OR alu_or OR alu_and OR alu_not;						
	END PROCESS;
		

-- registradores de carga paralela
	
registradores : PROCESS (ck, reset)
	VARIABLE pc_reg : std_logic_vector(7 DOWNTO 0);
BEGIN

	-- reset todos os registradores
	IF (reset = '1') THEN
		ac_out <= "00000000";
		ri_out <= "00000000";
		pc_out <= "00000000";
		rdm_out <= "00000000";
		rem_out <= "00000000";
		flagn_out <= '0';
		flagz_out <= '0';
		pc_reg := "00000000";
		
		
	ELSIF (rising_edge(ck)) THEN
	
		-- acumulador ACC
		IF (acnz_load = '1') THEN
			ac_out <= alu_out;
			flagn_out <= alun_out;
			flagz_out <= aluz_out;
		END IF;
				
		-- contador do programa PC
		IF (pc_load = '1') THEN
			pc_reg := mem_out;
		ELSIF (pc_load_start_code = '1') THEN
			pc_reg := START_CODE;
		ELSIF (pc_load_start_data = '1') THEN
			pc_reg := START_DATA; 
		ELSIF (pc_inc = '1') THEN
			pc_reg := pc_reg + 1;
		END IF;
		pc_out <= pc_reg;
		
		-- registrador REM - armazena o endereco de um registrador na memoria
		IF (rem_load0 = '1') THEN
			rem_out <= pc_out;
		ELSIF (rem_load1 = '1') THEN
			rem_out <= mem_out;
		END IF;
		
		-- registrador RDM - conectado a entrada da memoria
		IF (rdm_load = '1') THEN
			rdm_out <= ac_out;
		ELSIF(rdm_load_inst_cod = '1') THEN
			rdm_out <= inst_cod;			
		ELSIF(rdm_load_inst_end = '1') THEN
			rdm_out <= inst_end;
		ELSIF(rdm_load_prog_data = '1') THEN	
			rdm_out <= program_data;	
		END IF;
		
		-- registrador RI - contem os codigos das instrucoes
		IF (ri_load = '1') THEN
			ri_out <= mem_out;
		END IF;
		
	END IF;
END PROCESS registradores;


ula1: ULA port map 
	   (alu_passy => alu_passy,
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
