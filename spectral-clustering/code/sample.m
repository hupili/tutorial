% Sample spectral technique

clear ;
close all ;

load('data.mat') ;

figure;
% Get the ground truth and plot the data scatter
% N and K come from "gen_data.m"
C1X1 = X(1:N, 1);
C1X2 = X(1:N, 2);
C2X1 = X((N+1):end, 1);
C2X2 = X((N+1):end, 2);
scatter(C1X1, C1X2) ; 
hold on ;
scatter(C2X1, C2X2) ;
%title('Scatter Plot');
print(gcf, '-depsc', '../plot/sc_sample_scatter.eps') ;

figure ;
% Ordinary K-means
[idx, c] = kmeans(X, K) ;
plot(X(idx==1, 1), X(idx==1, 2), 'ob') ;
hold on ;
plot(X(idx==2, 1), X(idx==2, 2), 'or') ;
h = plot(c(1, 1), c(1, 2), '*b') ;
set(h, 'LineWidth', 20) ;
h = plot(c(2, 1), c(2, 2), '*r') ;
set(h, 'LineWidth', 20) ;
print(gcf, '-depsc', '../plot/sc_sample_kmeans.eps') ;

figure ;
% Spectral Clustering
epsilon = 0.7 ; % Super parameter for similarity graph formation
D = dist(X') ; % Compute distance for each pair
A = double(D < epsilon) ; % Conect nearby nodes
gplot(A, X) ;
print(gcf, '-depsc', '../plot/sc_sample_adj.eps') ;
figure ;
[V, Lambda] = eigs(A, K) ; % Eigen-value decomposition, only get Largest K EVs
[idx, c] = kmeans(V, K) ; % Run ordinary K-Means
plot(X(idx==1, 1), X(idx==1, 2), 'ob') ;
hold on ;
plot(X(idx==2, 1), X(idx==2, 2), 'or') ;
print(gcf, '-depsc', '../plot/sc_sample_sc.eps') ;

figure ;
plot(V(idx==1, 1), V(idx==1, 2), 'ob') ;
hold on ;
plot(V(idx==2, 1), V(idx==2, 2), 'or') ;
print(gcf, '-depsc', '../plot/sc_sample_2d_embed.eps') ;

figure ;
theta = linspace(0, 2 * pi, 1000); 
plot(cos(theta), sin(theta)); 
hold on;
r = sqrt(sum(V.*V,2)) .* (randn(length(V), 1) * 0.01 + 1) ; 
Vn = V ./ [r, r] ;
plot(Vn(idx==1, 1), Vn(idx==1, 2), 'ob') ;
hold on ;
plot(Vn(idx==2, 1), Vn(idx==2, 2), 'or') ;
grid on;
print(gcf, '-depsc', '../plot/sc_sample_2d_embed_unit_circle.eps') ;


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
print(gcf, '-depsc', '../plot/sc_sample_pkmeans.eps') ;
