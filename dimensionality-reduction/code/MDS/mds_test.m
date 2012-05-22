clear ;
close all ;

n = 100 ;
m = 2 ;
sigma = 0.05 ; %Gaussian(isotropic) noise variance

%original sample=================

%[0,1], [0,1] uniform
%X = rand(n,m) ; 

%semi circle
% X_1 = linspace(0,1,n)' ;
% X_2 = [0.5 + sqrt(0.5 ^ 2 - ( X_1 - 0.5) .^ 2)] ;
% X = [X_1, X_2] ;

%semi circle
theta = linspace(0, pi, n)' ;
X = [0.5 + 0.5 * cos(theta), 0.5 + 0.5 * sin(theta)] ;

X = [X, zeros(n,1)] ;
figure ;
scatter3(X(:,1), X(:,2), X(:,3)) ;
axis([0,1,0,1,-0.5,0.5]) ;
%original sample END=================

%sample with noise
Xn = X + randn(n,m+1) * sigma ;
figure ;
scatter3(Xn(:,1), Xn(:,2), Xn(:,3)) ;
axis([0,1,0,1,-0.5,0.5]) ;

%noise only in the extra direction ;
Xnn = [X(:, 1:2), randn(n,1) * sigma] ;
figure ;
scatter3(Xnn(:,1), Xnn(:,2), Xnn(:,3)) ;
axis([0,1,0,1,-0.5,0.5]) ;

%distance^2
%watch out for the square
D = dist(X').^2 ;
Dn = dist(Xn').^2 ;
Dnn = dist(Xnn').^2 ;

%centering matrix
J = eye(n,n) - repmat(1/n,n,n) ;

%MDS
B = -0.5 * J * D * J ;
[v, d] = eig(B) ;
x = v(:,1:m) * (d(1:m,1:m) .^ 0.5) ;
Bn = -0.5 * J * Dn * J ;
[vn, dn] = eig(Bn) ;
xn = vn(:,1:m) * (dn(1:m,1:m) .^ 0.5) ;
Bnn = -0.5 * J * Dnn * J ;
[vnn, dnn] = eig(Bnn) ;
xnn = vnn(:,1:m) * (dnn(1:m,1:m) .^ 0.5) ;

figure ;
hold on ;
subplot(2,2,1) ;
scatter(X(:,1), X(:,2)) ;
subplot(2,2,2) ;
scatter(x(:,1), x(:,2)) ;
subplot(2,2,3) ;
scatter(xn(:,1), xn(:,2)) ;
subplot(2,2,4) ;
scatter(xnn(:,1), xnn(:,2)) ;
