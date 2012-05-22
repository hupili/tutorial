%generate 2 circles data set. 

clear ;
close all ;

figure ; 

N = 100 ;
K = 2 ;

theta = linspace(0, 2 * pi, N) ;
C1X1 = 1 + cos(theta) + 0.1 * randn(1, N) ;
C1X2 = 1 + sin(theta) + 0.1 * randn(1, N) ;
scatter(C1X1, C1X2) ; hold on ;
theta = linspace(0, 2 * pi, 2*N) ;
C2X1 = 1 + 2 * cos(theta) + 0.1 * randn(1, 2*N) ;
C2X2 = 1 + 2 * sin(theta) + 0.1 * randn(1, 2*N) ;
scatter(C2X1, C2X2) ;
X = [C1X1', C1X2' ; C2X1', C2X2'] ;
print(gcf, '-dpng', '../plot/sc_sample_scatter.png') ;

save('data.mat') ;