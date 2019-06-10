entity somador is
port(a, b, cin : in bit;
s, cout : out bit);
end somador;
architecture comportamento of somador is
begin
s <= a xor b xor cin;
cout <= ( (a xor b) and cin ) or (a and b);
end comportamento;