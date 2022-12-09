l1 = 0.09984;
l2 = 0.350;
l3 = 0.099;
l4 = 0.14956;
l5 = 0.099;
l6 = 0.07831;
l7 = 0.030 + (0.180/2);

a = 0.088;

a1 = 0;
a2 = 0;
a3 = 0;
a4 = 0;
a5 = 0;
a6 = 0;
a7 = 0;

d1 = l1;
d2 = 0;
d3 = l2 +l3;
d4 = -a;
d5 = l4 + l5;
d6 = a;
d7 = l6 + l7;

alpha1 = -pi/2;
alpha2 = pi/2;
alpha3 = -pi/2;
alpha4 = pi/2;
alpha5 = -pi/2;
alpha6 = pi/2;
alpha7 = 0;

L(1) = Link('revolute', 'd', d1, 'a', a1, 'alpha', alpha1);
L(2) = Link('revolute', 'd', d2, 'a', a2, 'alpha', alpha2);
L(3) = Link('revolute', 'd', d3, 'a', a3, 'alpha', alpha3);
L(4) = Link('revolute', 'd', d4, 'a', a4, 'alpha', alpha4);
L(5) = Link('revolute', 'd', d5, 'a', a5, 'alpha', alpha5);
L(6) = Link('revolute', 'd', d6, 'a', a6, 'alpha', alpha6);
L(7) = Link('revolute', 'd', d7, 'a', a7, 'alpha', alpha7);

trash_arm = SerialLink(L);


%Force Controll
restingPosition =       [0 -1.57 0 3.14 3.14 0 0];
rotateBeforeUnfurl =    [1.57 -1.57 0 3.14 3.14 0 0];
startPosition =         [2.36 -0.786 0.786 -1.57 3.14 0 0];
stopPosition =          [0.786 -0.786 -0.786 -1.57 2.36 0 0];
readyBeforeDepot =      [0 0 0 -1.57 1.57 0 0];

ForceX = 20; % Newton
ForceY = 0; % Newton
ForceZ = 0; % Newton
ForceTreshold = 20; % Newton 

if (ForceX<=ForceTreshold && ForceY<= ForceTreshold && ForceZ<=ForceTreshold) 
    J = trash_arm.jacobe(restingPosition)
    W0 = [ForceX; ForceY; ForceZ; 0; 0; 0];
    Q = J' * W0
else
    Q = 0
    disp('Force too high!')
    disp('Reduce Force on one of the axes!') 
end
