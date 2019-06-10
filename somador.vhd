LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity somador is
port(a, b, cin : in std_logic;
s, cout : out std_logic);
end somador;
architecture comportamento of somador is
begin
s <= a xor b xor cin;
cout <= ( (a xor b) and cin ) or (a and b);
end comportamento;