LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY contador IS
	PORT(reloj, reset, cargar, habilcnt, down,up : IN STD_LOGIC;
		 dato: IN STD_LOGIC_VECTOR(7 downto 0);
		 Q : OUT STD_LOGIC_VECTOR(7 downto 0));
END contador;

ARCHITECTURE sol OF contador IS
SIGNAL conteo: STD_LOGIC_VECTOR(7 downto 0);  -- define un bus de 4 bits
signal dato_ent: STD_LOGIC_VECTOR(7 downto 0);
BEGIN
	dato_ent <= dato(7)&dato(6)&dato(5)&dato(4)&dato(3)&dato(2)&dato(1)&dato(0);
	PROCESS(reloj,reset,down)
	BEGIN
		if reset='0' then conteo<="00000000"; -- reset asíncrona
  		elsif (reloj'event and reloj='1') then -- flanco ascendente?
			if cargar='1' then conteo<=dato_ent; --carga en paralelo
			elsif habilcnt='1' then    -- habilitado?
				if (up='1' and down ='0') then conteo<=conteo+1; --incremento
					elsif (up='0' and down ='1') then conteo<=conteo-1; --decremento
					else conteo<=conteo;
				end if;
			end if;
		end if;
		Q(7)<=conteo(7); --transfiere el contenido del registro a las salidas
		Q(6)<=conteo(6);
		Q(5)<=conteo(5);
		Q(4)<=conteo(4);
		Q(3)<=conteo(3); --transfiere el contenido del registro a las salidas
		Q(2)<=conteo(2);
		Q(1)<=conteo(1);
		Q(0)<=conteo(0);
	END PROCESS;
END sol;