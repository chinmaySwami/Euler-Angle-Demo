clear all;

% Creating four points emulating marker oriented above the plane
point1d = [1 1 1];
point2d = [2 1 1];
point3d = [2 2 1];
point4d = [1 2 1];
% point4 = [1 2 0];

% Creating four points emulating marker oriented below the plane
point1p = [1 1 1];
point2p = [2 1 1];
point3p = [2 3 2];
point4p = [1 3 2]; 

% Plotting 4 points
figure;
plot3(point1d(1),point1d(2),point1d(3),'or');
hold on;
plot3(point2d(1),point2d(2),point2d(3),'or');
plot3(point3d(1),point3d(2),point3d(3),'og');
plot3(point4d(1),point4d(2),point4d(3),'og');

plot3(point3p(1),point3p(2),point3p(3),'ob');
plot3(point4p(1),point4p(2),point4p(3),'ob');

xlabel(' x ');
ylabel(' Y ');
zlabel(' Z ');
xlim([-2 5])
ylim([-2 5])
zlim([-2 5])
