library IEEE;
use IEEE.std_logic_1164.all;

entity AND8Bits is
port(
E : in std_logic_vector(7 downto 0); 
S : out std_logic -- Salida
);
end AND8Bits;
-- Descripcion del circuito
architecture func of AND8Bits is
begin
S <= E(7) and  E(6) and	 E(5) and E(4) and E(3) and E(2) and E(1) and E(0);
end func;