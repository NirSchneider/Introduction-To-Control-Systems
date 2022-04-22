%% Student ID
ID = 316098052;
disp(ID)
%% 1 Manipulator control
% 2. Response of the closed-loop system to a step input
A = [0 1;0 -0.4];
B = [0 1]';
C = [1 0];
D = 0;
sys = ss(A,B,C,D);
test = tf([0 1],[1 0.4 0]);
pzmap(test)
%%
step(test)
%%
% 4. Response of the state variable feedback system to a step input
A_k = [0 1;-18.4 -5.9];
B = [0 1]';
C = [1 0];
D = 0;
sys = ss(A_k,B,C,D);

% pzmap(sys)
step(sys);
stepinfo(sys)
%%
syms L1 L2 LAM
A = [0 1;-7 -2];
L = [L1 L2]';
C = [1 4];
O = LAM*eye(2)-A - L*C;
de = det(O);

%% 5 Pole-placement algorithm for state-space model
%%
clear
check = myPolePlacement(magic(5), [1;2;3;4;5], [-1, -2, -3, -4, -5])
K = place(magic(5), [1;2;3;4;5], [-1, -2, -3, -4, -5])


function [out] =  myPolePlacement(A, B, p)
    s = size(A);
    K  = sym('k',[1 s(1)]);
    A_s = A-B*K;
    p2 = poly(p);
    poli = charpoly(A_s);
    sol = poli == p2;
    sol_k = solve(sol , K)
    A = struct2cell(sol_k);
    out = double(cat(2,A{:}));
end