
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity despEdad is
	Port ( D: in STD_LOGIC_VECTOR(31 downto 0);
		CLK, RESET, enable: in STD_LOGIC;
		Q: out STD_LOGIC_VECTOR(7 downto 0));
end despEdad;

Architecture sol of despEdad is
Begin
	process (CLK, RESET)
		begin
			if reset ='0' then Q<="00000000";
			elsif (clk'event and clk='1' and enable='1') then
			Q <= D(24)&D(25)&D(26)&D(27)&D(28)&D(29)&D(30)&D(31);
			end if;
	end process;	
end sol;