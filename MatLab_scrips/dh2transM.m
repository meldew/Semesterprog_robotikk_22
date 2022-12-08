function [Tmatrise] = dh2transM(thet, d, a, alpha)
    
    Sq = sin(thet);
    Cq = cos(thet);
    
    Saph = sinpi(alpha/pi); % sinpi = sin(pi) => sinpi(1/2) = sin(pi/2)
    Caph = cospi(alpha/pi); % Deler derfor på pi


    Tmatrise = [Cq     -Sq*Caph    Sq*Saph     a*Cq;
     Sq     Cq*Caph     -Cq*Saph    a*Sq;
     0      Saph        Caph        d;
     0      0           0           1];
end
