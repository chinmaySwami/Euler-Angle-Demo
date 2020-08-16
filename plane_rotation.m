clear all;

% Creating four points
point1 = [1 1 1];
point2 = [2 1 1];
point3 = [2 2 1];
point4 = [1 2.5 1.5];

figure;
plot3(point1(1),point1(2),point1(3),'or');
hold on;
plot3(point2(1),point2(2),point2(3),'or');
plot3(point3(1),point3(2),point3(3),'og');
plot3(point4(1),point4(2),point4(3),'ob');

xlabel(' x ');
ylabel(' Y ');
zlabel(' Z ');
xlim([-5 5])
ylim([-5 5])
zlim([-5 5])



