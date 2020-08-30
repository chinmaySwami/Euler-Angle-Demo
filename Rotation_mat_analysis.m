clear all;

% Creating four points emulating marker from distal segments
point1d = [1 1 1];
point2d = [2 1 1];
point3 = [2 2 1];
point4 = [1 2 1];

% Creating  points emulating marker from proximal segments
point1p = [2 3 2];
point2p = [1 3 2]; 

% Plotting 4 points
figure;
plot3(point1d(1),point1d(2),point1d(3),'or');
hold on;
plot3(point2d(1),point2d(2),point2d(3),'or');
plot3(point3(1),point3(2),point3(3),'og');
plot3(point4(1),point4(2),point4(3),'og');

plot3(point1p(1),point1p(2),point1p(3),'ob');
plot3(point2p(1),point2p(2),point2p(3),'ob');

xlabel(' x ');
ylabel(' Y ');
zlabel(' Z ');
xlim([-2 5])
ylim([-2 5])
zlim([-2 5])


% Creating distal segment axis
distal_origin  = (point1d + point2d)/2;
distal_end  = (point3 + point4)/2;

distal_y_v = distal_end - distal_origin;
distal_y_v_p = [distal_origin; distal_origin+distal_y_v];
distal_y_uv = distal_y_v./vecnorm(distal_y_v);

distal_z_v = point2d - distal_origin;
distal_z_v_p = [distal_origin; distal_origin+distal_z_v];
distal_z_uv = distal_y_v./vecnorm(distal_y_v);

distal_x_v = cross(distal_z_v, distal_y_v);
distal_x_v_p = [distal_origin; distal_origin+distal_x_v];
distal_x_uv = distal_x_v./vecnorm(distal_x_v);

distal_z_v = cross(distal_x_v, distal_y_v);
distal_z_v_p = [distal_origin; distal_origin+distal_z_v];
distal_z_uv = distal_y_v./vecnorm(distal_y_v);

plot3(distal_y_v_p(:,1),distal_y_v_p(:,2),distal_y_v_p(:,3),'g', 'LineWidth',0.5);
plot3(distal_z_v_p(:,1),distal_z_v_p(:,2),distal_z_v_p(:,3),'b', 'LineWidth',0.5);
plot3(distal_x_v_p(:,1),distal_x_v_p(:,2),distal_x_v_p(:,3),'r', 'LineWidth',0.5);

% Creating proximal segment axis
proximal_origin  = (point3 + point4)/2;
proximal_end  = (point1p + point2p)/2;



