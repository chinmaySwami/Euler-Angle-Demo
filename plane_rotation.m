clear all;

% Creating four points
point1 = [1 1 1];
point2 = [2 1 1];
point3 = [2 2 1];
% point4 = [1 2 1];
point4 = [1 3 5];

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
xlim([-2 5])
ylim([-2 5])
zlim([-2 5])

run_transform = true

if run_transform
    % orienting the point 4 in same plane as other 3 points

    % Plane 1 = 1,2,3
    % Creating vector between points 1 and 2
    vec12 = point2 - point1;
    vec12_p = [point1; point1+vec12];
    vec12_UV = vec12./vecnorm(vec12);
    plot3(vec12_p(:,1),vec12_p(:,2),vec12_p(:,3),'c', 'LineWidth',0.5);

    % Creating vector between points 1 and 3
    vec13 = point3 - point1;
    vec13_p = [point1; point1+vec13];
    vec13_UV = vec13./vecnorm(vec13);
    plot3(vec13_p(:,1),vec13_p(:,2),vec13_p(:,3),'c', 'LineWidth',0.5);

    % Creating vector between points 2 and 3
    vec23 = point3 - point2;
    vec23_p = [point2; point2+vec23];
    vec23_UV = vec23./vecnorm(vec23);
    plot3(vec23_p(:,1),vec23_p(:,2),vec23_p(:,3),'c', 'LineWidth',0.5);


    % Plane 2 = 1,2,4

    % Creating vector between points 1 and 4
    vec14 = point4 - point1;
    vec14_p = [point1; point1+vec14];
    vec14_UV = vec14./vecnorm(vec14);
    plot3(vec14_p(:,1),vec14_p(:,2),vec14_p(:,3),'m', 'LineWidth',0.5);


    % computing new axis
    ih2 = cross(vec12_UV, vec14_UV);
    ih2_UV = ih2./vecnorm(ih2);
    vec1i2_p = [point1; point1+ih2];
    plot3(vec1i2_p(:,1),vec1i2_p(:,2),vec1i2_p(:,3),'m', 'LineWidth',0.5)

    ih = cross(vec12_UV, vec13_UV);
    ih_UV = ih./vecnorm(ih);
    vec1i_p = [point1; point1+ih];
    plot3(vec1i_p(:,1),vec1i_p(:,2),vec1i_p(:,3),'c', 'LineWidth',0.5)


    % Creating vector between points 2 and 4
    vec24 = point4 - point2;
    vec24_p = [point2; point2+vec24];
    vec24_UV = vec24./vecnorm(vec24);
    plot3(vec24_p(:,1),vec24_p(:,2),vec24_p(:,3),'m', 'LineWidth',0.5);

    title('Rotating plane[magenta] to align with[cyan]')
    pause(5)

    % Computing the required angle of rotation 
    % theta = dot(ih2, vec12_UV);
    % theta = radtodeg(theta);

    % angle between 
    angle3 = atan2(norm(cross(vec14_UV,vec23_UV)), dot(vec14_UV,vec23_UV));

    angle = atan2(norm(cross(ih2_UV,vec12_UV)), dot(ih2_UV,vec12_UV));

    angle2 = atan2(norm(cross(ih2_UV,ih_UV)), dot(ih2_UV,ih_UV));

    % Plotting point after rotating it by angle 
    angle_deg = rad2deg(angle)
    theta =  -1 * angle;

    R_X = [1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)];
    R_Y = [cos(theta) 0 sin(theta) ; 0 1 0; -sin(theta) 0 cos(theta)];
    R_Z = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
    %Post Mul
%     R_XY = [cos(theta) 0 sin(theta); sin(theta)^2 cos(theta) -sin(theta)*cos(theta); cos(theta)*sin(theta) sin(theta) cos(theta)^2];
    %Pre Mul
    R_XY = [cos(theta) sin(theta)^2 cos(theta)*sin(theta);  0 cos(theta) -sin(theta);  -sin(theta) cos(theta)*sin(theta) cos(theta)^2];
    
    point4_n = R_Y * point4';
    % point4_new = point4+point4_n';
    plot3(point4_n(1),point4_n(2),point4_n(3),'ok');
    
    % Cheating code
    plot3(point4(1),point4(2),point4_n(3),'ok');

    % Plotting point after rotating it by angle3
    angle3_deg = rad2deg(angle3)
    theta =  -1 * angle3;

    R_X = [1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)];
    R_Y = [cos(theta) 0 sin(theta) ; 0 1 0; -sin(theta) 0 cos(theta)];
    R_Z = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
    %Post Mul
%     R_XY = [cos(theta) 0 sin(theta); sin(theta)^2 cos(theta) -sin(theta)*cos(theta); cos(theta)*sin(theta) sin(theta) cos(theta)^2];
    %Pre Mul
    R_XY = [cos(theta) sin(theta)^2 cos(theta)*sin(theta);  0 cos(theta) -sin(theta);  -sin(theta) cos(theta)*sin(theta) cos(theta)^2];
     
    point43_n = R_Y * point4';
    % point43_new = point4+point43_n';
    plot3(point43_n(1),point43_n(2),point43_n(3),'og');
    
    % Cheating code
    plot3(point4(1),point4(2),point43_n(3),'ob');

    % Plotting point after rotating it by angle2
    angle2_deg = rad2deg(angle2)
    theta =  -1 * angle2;

    R_X = [1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)];
    R_Y = [cos(theta) 0 sin(theta) ; 0 1 0; -sin(theta) 0 cos(theta)];
    R_Z = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
    %Post Mul
%     R_XY = [cos(theta) 0 sin(theta); sin(theta)^2 cos(theta) -sin(theta)*cos(theta); cos(theta)*sin(theta) sin(theta) cos(theta)^2];
    %Pre Mul
    R_XY = [cos(theta) sin(theta)^2 cos(theta)*sin(theta);  0 cos(theta) -sin(theta);  -sin(theta) cos(theta)*sin(theta) cos(theta)^2];

    point42_n = R_Y * point4';
    % point42_new = point4+point42_n';
    plot3(point42_n(1),point42_n(2),point42_n(3),'oy');
    
     % Cheating code
    plot3(point4(1),point4(2),point42_n(3),'ob');
   end
