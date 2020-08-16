clear all;

% Creating four points
point1 = [1 1 1];
point2 = [2 1 1];
point3 = [2 2 1];
point4 = [1 2.5 1.5];

% Plotting 4 points
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


% orienting the point 4 in same plane as other 3 points

% Creating vector between points 1 and 2
vec12 = point2 - point1;
vec12_p = [point1; point1+vec12];
vec12_UV = vec12./vecnorm(vec12')';
plot3(vec12_p(:,1),vec12_p(:,2),vec12_p(:,3),'c', 'LineWidth',0.5);

% Creating vector between points 1 and 3
vec13 = point3 - point1;
vec13_p = [point1; point1+vec13];
vec13_UV = vec13./vecnorm(vec13')';
plot3(vec13_p(:,1),vec13_p(:,2),vec13_p(:,3),'c', 'LineWidth',0.5);

% Creating vector between points 2 and 3
vec23 = point3 - point2;
vec23_p = [point2; point2+vec23];
vec23_UV = vec23./vecnorm(vec23')';
plot3(vec23_p(:,1),vec23_p(:,2),vec23_p(:,3),'c', 'LineWidth',0.5);



