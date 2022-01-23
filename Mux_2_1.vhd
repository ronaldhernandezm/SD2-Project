library IEEE;
use IEEE.std_logic_1164.all;
entity Mux_2_1 is
port(
I : in std_logic_vector(31 downto 0); 
S : in std_logic; -- Seleccion
Y : out std_logic_vector(31 downto 0) -- Salida
);
end Mux_2_1;
-- Descripcion del circuito
architecture simple of Mux_2_1 is
begin
Y <= I when (S='0') else "00000000000000000000000000000000";--Asignacion condicional
end simple;