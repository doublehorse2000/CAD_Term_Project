% 初始化
clc;clear;
% 输入控制点信息


point(1) = control_point(0.163134,2.86943,0.851007,0);
point(2) = control_point(0.163134,2.86943,0.851007,0);
point(3) = control_point(0.163134,2.86943,0.851007,0);
point(4) = control_point(0.163134,2.86943,0.851007,0);
point(5) = control_point(-0.132369,3.10981,0.876723,0);
point(6) = control_point(-0.00630125,3.11526,0.927799,0);
point(7) = control_point(0.209835,3.11345,0.927485,0);
point(8) = control_point(0.294057,3.11383,0.894287,0);
point(9) = control_point(-0.421919,3.60741,0.856838,0);
point(10) = control_point(-0.226222,3.60625,0.920154,0);
point(11) = control_point(0.209325,3.60669,0.915636,0);
point(12) = control_point(0.400957,3.60644,0.835345,0);
point(13) = control_point(-0.387513,3.81609,0.779347,0);
point(14) = control_point(-0.195505,3.81532,0.803485,0);
point(15) = control_point(0.188419,3.81528,0.802642,0);
point(16) = control_point(0.387513,3.81609,0.779347,0);
mesh(1) = control_mesh("Bezier33",point);

joint = control_joint(mesh);