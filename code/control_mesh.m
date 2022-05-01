classdef control_mesh < handle
    
    properties
        m_type,
        m_m,
        m_n,
        m_point
    end
    
    methods
        function obj = control_mesh(type,point)
            obj.m_m = 3;
            obj.m_n = 3;
            obj.m_type = type;
            obj.m_point = point;%控制点类
            if type == "Bezier32"
                obj.m_n = 2;
            elseif type == "Bezier22"
                obj.m_m = 2;obj.m_n = 2;
            end
        end
        
        function [Sx,Sy,Sz] = make_mesh(obj)
            if obj.m_type == "Bezier33"
                px = reshape([obj.m_point(1).m_x
                    obj.m_point(2).m_x
                    obj.m_point(3).m_x
                    obj.m_point(4).m_x
                    obj.m_point(5).m_x
                    obj.m_point(6).m_x
                    obj.m_point(7).m_x
                    obj.m_point(8).m_x
                    obj.m_point(9).m_x
                    obj.m_point(10).m_x
                    obj.m_point(11).m_x
                    obj.m_point(12).m_x
                    obj.m_point(13).m_x
                    obj.m_point(14).m_x
                    obj.m_point(15).m_x
                    obj.m_point(16).m_x],4,4)';
                py = reshape([obj.m_point(1).m_y
                    obj.m_point(2).m_y
                    obj.m_point(3).m_y
                    obj.m_point(4).m_y
                    obj.m_point(5).m_y
                    obj.m_point(6).m_y
                    obj.m_point(7).m_y
                    obj.m_point(8).m_y
                    obj.m_point(9).m_y
                    obj.m_point(10).m_y
                    obj.m_point(11).m_y
                    obj.m_point(12).m_y
                    obj.m_point(13).m_y
                    obj.m_point(14).m_y
                    obj.m_point(15).m_y
                    obj.m_point(16).m_y],4,4)';
                pz = reshape([obj.m_point(1).m_z
                    obj.m_point(2).m_z
                    obj.m_point(3).m_z
                    obj.m_point(4).m_z
                    obj.m_point(5).m_z
                    obj.m_point(6).m_z
                    obj.m_point(7).m_z
                    obj.m_point(8).m_z
                    obj.m_point(9).m_z
                    obj.m_point(10).m_z
                    obj.m_point(11).m_z
                    obj.m_point(12).m_z
                    obj.m_point(13).m_z
                    obj.m_point(14).m_z
                    obj.m_point(15).m_z
                    obj.m_point(16).m_z],4,4)';
                Rm = 20;Rn = 20;
                u = linspace(0,1,Rm)';
                w = linspace(0,1,Rn)';
                Bu = zeros([Rm , obj.m_m + 1]);
                Bw = zeros([Rn , obj.m_n + 1]);
                for i = 0:obj.m_m
                    Bu(:,i+1) = prod(i+1:obj.m_m)/prod(1:obj.m_m-i)*u.^i.*(1-u).^(obj.m_m-i);
                end
                for i = 0:obj.m_n
                    Bw(:,i+1) = prod(i+1:obj.m_n)/prod(1:obj.m_n-i)*w.^i.*(1-w).^(obj.m_n-i);
                end
                Sx = Bu * px * Bw';
                Sy = Bu * py * Bw';
                Sz = Bu * pz * Bw';
                surf(Sx,Sy,Sz,'linestyle','-');
            elseif obj.m_type == "Bezier32"
                px = reshape([obj.m_point(1).m_x
                    obj.m_point(2).m_x
                    obj.m_point(3).m_x
                    obj.m_point(4).m_x
                    obj.m_point(5).m_x
                    obj.m_point(6).m_x
                    obj.m_point(7).m_x
                    obj.m_point(8).m_x
                    obj.m_point(9).m_x
                    obj.m_point(10).m_x
                    obj.m_point(11).m_x
                    obj.m_point(12).m_x],3,4)';
                py = reshape([obj.m_point(1).m_y
                    obj.m_point(2).m_y
                    obj.m_point(3).m_y
                    obj.m_point(4).m_y
                    obj.m_point(5).m_y
                    obj.m_point(6).m_y
                    obj.m_point(7).m_y
                    obj.m_point(8).m_y
                    obj.m_point(9).m_y
                    obj.m_point(10).m_y
                    obj.m_point(11).m_y
                    obj.m_point(12).m_y],3,4)';
                pz = reshape([obj.m_point(1).m_z
                    obj.m_point(2).m_z
                    obj.m_point(3).m_z
                    obj.m_point(4).m_z
                    obj.m_point(5).m_z
                    obj.m_point(6).m_z
                    obj.m_point(7).m_z
                    obj.m_point(8).m_z
                    obj.m_point(9).m_z
                    obj.m_point(10).m_z
                    obj.m_point(11).m_z
                    obj.m_point(12).m_z],3,4)';
                Rm = 20;Rn = 20;
                u = linspace(0,1,Rm)';
                w = linspace(0,1,Rn)';
                Bu = zeros([Rm , obj.m_m + 1]);
                Bw = zeros([Rn , obj.m_n + 1]);
                for i = 0:obj.m_m
                    Bu(:,i+1) = prod(i + 1:obj.m_m) / prod(1:obj.m_m - i) * u .^ i .* (1 - u) .^ (obj.m_m - i);
                end
                for i = 0:obj.m_n
                    Bw(:,i+1) = prod(i + 1:obj.m_n) / prod(1:obj.m_n - i) * w .^ i .* (1 - w) .^ (obj.m_n - i);
                end
                Sx = Bu * px * Bw';
                Sy = Bu * py * Bw';
                Sz = Bu * pz * Bw';
                surf(Sx,Sy,Sz,'linestyle','-');colormap(jet);
            elseif obj.m_type == "Bezier22"
                px = reshape([obj.m_point(1).m_x
                    obj.m_point(2).m_x
                    obj.m_point(3).m_x
                    obj.m_point(4).m_x
                    obj.m_point(5).m_x
                    obj.m_point(6).m_x
                    obj.m_point(7).m_x
                    obj.m_point(8).m_x
                    obj.m_point(9).m_x],3,3)';
                py = reshape([obj.m_point(1).m_y
                    obj.m_point(2).m_y
                    obj.m_point(3).m_y
                    obj.m_point(4).m_y
                    obj.m_point(5).m_y
                    obj.m_point(6).m_y
                    obj.m_point(7).m_y
                    obj.m_point(8).m_y
                    obj.m_point(9).m_y],3,3)';
                pz = reshape([obj.m_point(1).m_z
                    obj.m_point(2).m_z
                    obj.m_point(3).m_z
                    obj.m_point(4).m_z
                    obj.m_point(5).m_z
                    obj.m_point(6).m_z
                    obj.m_point(7).m_z
                    obj.m_point(8).m_z
                    obj.m_point(9).m_z],3,3)';
                Rm = 20;Rn = 20;
                u = linspace(0,1,Rm)';
                w = linspace(0,1,Rn)';
                Bu = zeros([Rm , obj.m_m + 1]);
                Bw = zeros([Rn , obj.m_n + 1]);
                for i = 0:obj.m_m
                    Bu(:,i+1) = prod(i + 1:obj.m_m) / prod(1:obj.m_m - i) * u .^ i .* (1 - u) .^ (obj.m_m - i);
                end
                for i = 0:obj.m_n
                    Bw(:,i+1) = prod(i + 1:obj.m_n) / prod(1:obj.m_n - i) * w .^ i .* (1 - w) .^ (obj.m_n - i);
                end
                Sx = Bu * px * Bw';
                Sy = Bu * py * Bw';
                Sz = Bu * pz * Bw';
                surf(Sx,Sy,Sz,'linestyle','-');colormap(jet);
            elseif obj.m_type == "circle"
                Sx = zeros([100,101]);Sy = zeros([100,101]);Sz = zeros([100,101]);
                o_1_x = (obj.m_point(1).m_x + obj.m_point(3).m_x) / 2;
                o_1_y = (obj.m_point(1).m_y + obj.m_point(3).m_y) / 2;
                o_1_z = (obj.m_point(1).m_z + obj.m_point(3).m_z) / 2;
                o_2_x = (obj.m_point(4).m_x + obj.m_point(6).m_x) / 2;
                o_2_y = (obj.m_point(4).m_y + obj.m_point(6).m_y) / 2;
                o_2_z = (obj.m_point(4).m_z + obj.m_point(6).m_z) / 2;
                a_1_x = obj.m_point(2).m_x - o_1_x;
                a_1_y = obj.m_point(2).m_y - o_1_y;
                a_1_z = obj.m_point(2).m_z - o_1_z;
                b_1_x = obj.m_point(1).m_x - o_1_x;
                b_1_y = obj.m_point(1).m_y - o_1_y;
                b_1_z = obj.m_point(1).m_z - o_1_z;
                a_2_x = obj.m_point(5).m_x - o_2_x;
                a_2_y = obj.m_point(5).m_y - o_2_y;
                a_2_z = obj.m_point(5).m_z - o_2_z;
                b_2_x = obj.m_point(4).m_x - o_2_x;
                b_2_y = obj.m_point(4).m_y - o_2_y;
                b_2_z = obj.m_point(4).m_z - o_2_z;
                u = linspace(0,1,100);
                v = 0 : 2 * pi / 100 : 2 * pi;
                for i = 1 : 100
                    o_x = u(i) * o_1_x + (1 - u(i)) * o_2_x;
                    o_y = u(i) * o_1_y + (1 - u(i)) * o_2_y;
                    o_z = u(i) * o_1_z + (1 - u(i)) * o_2_z;
                    a_x = u(i) * a_1_x + (1 - u(i)) * a_2_x;
                    a_y = u(i) * a_1_y + (1 - u(i)) * a_2_y;
                    a_z = u(i) * a_1_z + (1 - u(i)) * a_2_z;
                    b_x = u(i) * b_1_x + (1 - u(i)) * b_2_x;
                    b_y = u(i) * b_1_y + (1 - u(i)) * b_2_y;
                    b_z = u(i) * b_1_z + (1 - u(i)) * b_2_z;
                    for j = 1 : 101
                        Sx(i,j) = o_x + a_x * sin(v(j)) + b_x * cos(v(j));
                        Sy(i,j) = o_y + a_y * sin(v(j)) + b_y * cos(v(j));
                        Sz(i,j) = o_z + a_z * sin(v(j)) + b_z * cos(v(j));
                    end
                end
                surf(Sx,Sy,Sz,'linestyle','-');colormap(jet);
                
            elseif obj.m_type == "line"
                Rm = 20;Rn = 20;
                u = linspace(0,1,Rm);
                w = linspace(0,1,Rn);
                Sx = zeros([Rm,Rn]);Sy = zeros([Rm,Rn]);Sz = zeros([Rm,Rn]);
                for i = 1:Rm
                    for j = 1:Rn
                        
                        Pux = obj.m_point(1).m_x * (1 - u(i)) + obj.m_point(2).m_x * u(i);
                        Qux = obj.m_point(3).m_x * (1 - u(i)) + obj.m_point(4).m_x * u(i);
                        Sx(i,j) = Pux * (1 - w(j)) + Qux * w(j);
                        
                        Puy = obj.m_point(1).m_y * (1 - u(i)) + obj.m_point(2).m_y * u(i);
                        Quy = obj.m_point(3).m_y * (1 - u(i)) + obj.m_point(4).m_y * u(i);
                        Sy(i,j) = Puy * (1 - w(j)) + Quy * w(j);
                        
                        Puz = obj.m_point(1).m_z * (1 - u(i)) + obj.m_point(2).m_z * u(i);
                        Quz = obj.m_point(3).m_z * (1 - u(i)) + obj.m_point(4).m_z * u(i);
                        Sz(i,j) = Puz * (1 - w(j)) + Quz * w(j);
                    end
                end
                surf(Sx,Sy,Sz,'linestyle','-');colormap(jet);
            elseif obj.m_type == "tui"
                px = [obj.m_point(1).m_y
                    obj.m_point(2).m_y
                    obj.m_point(3).m_y
                    obj.m_point(4).m_y
                    obj.m_point(5).m_y
                    obj.m_point(6).m_y
                    obj.m_point(7).m_y
                    obj.m_point(8).m_y
                    obj.m_point(9).m_y
                    obj.m_point(10).m_y
                    obj.m_point(11).m_y
                    obj.m_point(12).m_y
                    obj.m_point(13).m_y
                    obj.m_point(14).m_y
                    obj.m_point(15).m_y];
                py = [obj.m_point(1).m_z
                    obj.m_point(2).m_z
                    obj.m_point(3).m_z
                    obj.m_point(4).m_z
                    obj.m_point(5).m_z
                    obj.m_point(6).m_z
                    obj.m_point(7).m_z
                    obj.m_point(8).m_z
                    obj.m_point(9).m_z
                    obj.m_point(10).m_z
                    obj.m_point(11).m_z
                    obj.m_point(12).m_z
                    obj.m_point(13).m_z
                    obj.m_point(14).m_z
                    obj.m_point(15).m_z];                
                m = 14;Rm = 50;Bu = zeros([Rm , m + 1]);
                u = linspace(0,1,Rm);v = 0 : 2 * pi / 100 : 2 * pi;
                Sx = zeros([Rm,101]);Sy = zeros([Rm,101]);Sz = zeros([Rm,101]);
                for i = 0 : m
                    Bu(:,i + 1) = prod(i + 1:m) / prod(1:m - i) *  u .^ i .* (1 - u) .^ (m - i);
                end
                Dx = Bu * px;Dy = Bu * py;
                for i = 1 : Rm
                    r = abs(Dx(i) - obj.m_point(15).m_y);
                    for j = 1:101
                        Sx(i,j) = obj.m_point(15).m_y + r * cos(v(j));
                        Sy(i,j) = Dy(i);
                        Sz(i,j) = r * sin(v(j));
                    end
                end
                surf(Sz,Sx,Sy,'linestyle','-');colormap(jet);
            end
        end
    end
end

