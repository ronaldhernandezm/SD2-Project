library ieee;
use ieee.std_logic_1164.all;

entity MSS is
port ( 	Clock, Resetn: IN STD_LOGIC;
			START, finRAM, finROM,patrimonial: 	IN STD_LOGIC;
			LdROM,LdRAM,LdPatr,enDespRAM,enCROM,enCRAM: OUT STD_LOGIC;
			enRegEspecie,enRegEdad,enPatr,enEspROM,FIN: OUT STD_LOGIC);
			
end MSS;

architecture funcionamiento of MSS is
type estado is (Ta,Tb,Tc,Td,Th,Ti,Tj,Tk,Tl);
signal y: estado;
begin 
	process (Resetn, Clock)
	begin
	if Resetn='0' then y <= Ta;
	elsif (Clock'event and Clock ='1') then 
		case y is
			when Ta => if START='1' then y <= Tb; else y <= Ta; end if;
			when Tb => y <= Tc;
			when Tc => y <= Td;
			when Td => if patrimonial='1' then y <= Ti; else y <= Th ;end if;
			when Th => if finRAM ='1' then y <= Tj; else y <= Tc ;end if;
			when Ti => y <= Th;
			when Tj => if finROM ='1' then y <= Tl; else y <= Tk ;end if;
			when Tk => y <= Tc;
			when Tl => y <= Ta;--Regreso al estado inicial
		end case;
	end if;
	end process;
	
	process (y)
	begin
	LdROM<='0';LdRAM<='0';LdPatr<='0';enDespRAM<='0';enCROM<='0';enCRAM<= '0';enRegEspecie<= '0';enRegEdad<= '0';enPatr<= '0';FIN<= '0';enEspROM<= '0';
		case y is 
			when Ta => LdROM<='0';LdRAM<='0';LdPatr<='0';enDespRAM<='0';enCROM<='0';enCRAM<= '0';enRegEspecie<= '0';enRegEdad<= '0';enPatr<= '0';FIN<= '0';enEspROM<= '0';
			when Tb => LdROM<='1';LdRAM<='1';LdPatr<='1';enDespRAM<='0';enCROM<='0';enCRAM<= '0';enRegEspecie<= '0';enRegEdad<= '0';enPatr<= '0';FIN<= '0';enEspROM<= '0';
			when Tc => LdROM<='0';LdRAM<='0';LdPatr<='0';enDespRAM<='1';enCROM<='0';enCRAM<= '0';enRegEspecie<= '0';enRegEdad<= '0';enPatr<= '0';FIN<= '0';enEspROM<= '1';
			when Td => LdROM<='0';LdRAM<='0';LdPatr<='0';enDespRAM<='0';enCROM<='0';enCRAM<= '0';enRegEspecie<= '1';enRegEdad<= '1';enPatr<= '0';FIN<= '0';enEspROM<= '0';
			when Th => LdROM<='0';LdRAM<='0';LdPatr<='0';enDespRAM<='0';enCROM<='0';enCRAM<= '1';enRegEspecie<= '0';enRegEdad<= '0';enPatr<= '0';FIN<= '0';enEspROM<= '0';
			when Ti => LdROM<='0';LdRAM<='0';LdPatr<='0';enDespRAM<='0';enCROM<='0';enCRAM<= '0';enRegEspecie<= '0';enRegEdad<= '0';enPatr<= '1';FIN<= '0';enEspROM<= '0';
			when Tj => LdROM<='0';LdRAM<='0';LdPatr<='0';enDespRAM<='0';enCROM<='0';enCRAM<= '0';enRegEspecie<= '0';enRegEdad<= '0';enPatr<= '0';FIN<= '0';enEspROM<= '0';
			when Tk => LdROM<='0';LdRAM<='0';LdPatr<='0';enDespRAM<='0';enCROM<='1';enCRAM<= '0';enRegEspecie<= '0';enRegEdad<= '0';enPatr<= '0';FIN<= '0';enEspROM<= '0';
			when Tl => LdROM<='0';LdRAM<='0';LdPatr<='0';enDespRAM<='0';enCROM<='0';enCRAM<= '0';enRegEspecie<= '0';enRegEdad<= '0';enPatr<= '0';FIN<= '1';enEspROM<= '0';
		end case;
	end process;
end funcionamiento;