%sample spectral technique

clear ;
close all ;

load('data.mat') ;

figure ;

[idx, c] = kmeans(X, K) ;
plot(X(idx==1, 1), X(idx==1, 2), 'ob') ;
hold on ;
plot(X(idx==2, 1), X(idx==2, 2), 'or') ;
h = plot(c(1, 1), c(1, 2), '*b') ;
set(h, 'LineWidth', 20) ;
h = plot(c(2, 1), c(2, 2), '*r') ;
set(h, 'LineWidth', 20) ;
print(gcf, '-dpng', '../plot/sc_sample_kmeans.png') ;

figure ;
epsilon = 0.7 ;
D = dist(X') ;
A = double(D < epsilon) ;
gplot(A, X) ;
print(gcf, '-dpng', '../plot/sc_sample_adj.png') ;
figure ;
[V, Lambda] = eigs(A, K) ;
[idx, c] = kmeans(V, K) ;
plot(X(idx==1, 1), X(idx==1, 2), 'ob') ;
hold on ;
plot(X(idx==2, 1), X(idx==2, 2), 'or') ;
print(gcf, '-dpng', '../plot/sc_sample_sc.png') ;

figure ;
plot(V(idx==1, 1), V(idx==1, 2), 'ob') ;
hold on ;
plot(V(idx==2, 1), V(idx==2, 2), 'or') ;
print(gcf, '-dpng', '../plot/sc_sample_2d_embed.png') ;
% h = plot(c(1, 1), c(1, 2), '*b') ;
% set(h, 'LineWidth', 20) ;
% h = plot(c(2, 1), c(2, 2), '*r') ;
% set(h, 'LineWidth', 20) ;

figure ;
%Test polar coordinate system
%1. subtract sample mean 
%2. convert from cartesian coordinate to polar coordinate
[ptheta, pr] = cart2pol(X(:,1) - mean(X(:,1)), X(:,2) - mean(X(:,2))) ;
PX = [zscore(ptheta), zscore(pr)] ;
[idx, c] = kmeans(PX, K) ;
plot(X(idx==1, 1), X(idx==1, 2), 'ob') ;
hold on ;
plot(X(idx==2, 1), X(idx==2, 2), 'or') ;
% h = plot(c(1, 1), c(1, 2), '*b') ;
% set(h, 'LineWidth', 20) ;
% h = plot(c(2, 1), c(2, 2), '*r') ;
% set(h, 'LineWidth', 20) ;
print(gcf, '-dpng', '../plot/sc_sample_pkmeans.png') ;