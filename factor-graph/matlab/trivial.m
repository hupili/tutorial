%factor graph, trivial example. 
clear ;

p_ab = [
    0.5 0.5; 
    0.25 0.75
    ] ;

p_cb = [
    0 1 ;
    1 0
    ] ;

p_dc = [
    0.5 0.5 ;
    0.125 0.875
    ] ;

p_b = [
    0.5 0.5 ] ;

%function g = p_b * p_ab * p_cb * p_dc
g = [] ;
for i = 0:15
    bin = dec2bin(i, 4) ;
    a = bin(1) + 1 - '0';
    b = bin(2) + 1 - '0';
    c = bin(3) + 1 - '0';
    d = bin(4) + 1 - '0';
    g(i+1) = p_b(b) * p_ab(b,a) * p_cb(b,c) * p_dc(c,d) ;
end

