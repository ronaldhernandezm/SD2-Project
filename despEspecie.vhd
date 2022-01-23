
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity despEspecie is
	Port ( D: in STD_LOGIC_VECTOR(31 downto 0);
		CLK, RESET, enable: in STD_LOGIC;
		Q: out STD_LOGIC_VECTOR(7 downto 0));
end despEspecie;

Architecture sol of despEspecie is
Begin
	process (CLK, RESET)
		begin
			if reset ='0' then Q<="00000000";
			elsif (clk'event and clk='1' and enable='1') then
			Q <= D(16)&D(17)&D(18)&D(19)&D(20)&D(21)&D(22)&D(23);
			end if;
	end process;	
end sol;