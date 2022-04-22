ID = 316098052;
disp(ID)

%%
% 1. Scalar Arithmetic
% 1
3*2^4
% 2
(3*2)^4
% 3
3-2^4
% 4
3^4-3
% 5
8/2^4
% 6
2^4\8
% 7
8^4/2
%%
% 2. Vector
% 1
x = [3 4 7 11]
% 2
x = 3:8
% 3
x = 8:-1:0
% 4
xx = [8 7 6 5 4 3 2 1 0];
% 5
xx
% 6
x = linspace(0,1,11)
% 7
x = 0:0.1:1
% 8
y = linspace(0,1);
% 9
length(x)
% 10
length(y)
% 11
size(x)
% 12
size(y)
% 13
y(3)
% 14
y(1:12)
% 15
y([3 6 9 12])
% 16
x'
% 17
z = [1+2j 4-3j]
% 18
z'
% 19
z.'
% 20
3*[1 2 5]

%%
% 3. Matrix arithmetic
A = [3 1 5; 7 4 2; 7 6 8]
b = [1;2;3]
C = [1 0 0]

% 1
A^-1
% 2
transpose(A)
A.'
% 3
A*b
% 4
b.'*A
% 5
A.'*b
% 6
Ct = [b A*b A^2*b]
% 7
Ot = [C ; C*A; C*A^2]
% 8
exp(A)
% 9
rank(Ot)
% 10
rank(Ct)
% 11
eig(A)
% 12
[V, D] = eig(A) % V - eigen-vectors of A
% 13
eig(Ct)
% 14
[V, D] = eig(Ct) % V - eigen-vectors of Ct
% 15
eig(Ot)
% 16
[V, D] = eig(Ot) % V - eigen-vectors of Ct
% 17
Ot.*Ct

%%
% 4.1 Orthogonal Matrix Function
A = eye(3)
Ort_mat(A)

% 4.2 Replace values in a matrix
M = Replace_mat(A,1,2)

%%
% 5. Polynomials
p = [1 0 -12 0 39 2 -28];
x = -3:0.1:3;
y = polyval(p,x);
% 1
plot(x,y)
% 2
r = roots(p)
% 3
TF = islocalmin(y);
% 4
plot(x,y,x(TF),y(TF),'r*')

function ans = Ort_mat(x)
    if x' == x^-1
        ans = 1;
    else
        ans = 0;
    end
end

function B = Replace_mat(A,u,v)
    Mask = A==u;
    B =A.*not(Mask)+ Mask*v;
end

