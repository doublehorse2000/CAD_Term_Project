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
                n_x = obj.m_point(2).m_x - obj.m_point(1).m_x;
                n_y = obj.m_point(2).m_y - obj.m_point(1).m_y;
                n_z = obj.m_point(2).m_z - obj.m_point(1).m_z;
                n = [n_x n_y n_z] ./ sqrt(n_x^2 + n_y^2 + n_z^2);
                a_x = obj.m_point(1).m_x - obj.m_point(3).m_x;
                a_y = obj.m_point(1).m_y - obj.m_point(3).m_y;
                a_z = obj.m_point(1).m_z - obj.m_point(3).m_z;
                a = [a_x a_y a_z] ./ sqrt(a_x^2 + a_y^2 + a_z^2);                
                r = sqrt((obj.m_point(1).m_x - obj.m_point(3).m_x)^2 + (obj.m_point(1).m_y - obj.m_point(3).m_y)^2 + (obj.m_point(1).m_z - obj.m_point(3).m_z)^2);
                b = cross(a,n);
                u = linspace(0,1,100);
                v = 0 : 2 * pi / 100;
                for i = 1 : 100
                    for j = 1 : 101
                        c_x = obj.m_point(1).m_x * u(i) + obj.m_point(3).m_x * (1 - u(i));
                        Sx(i,j) = c_x + r * cos(v(j)) * a(1) + r * sin(v(j)) * b(1);
                        c_y = obj.m_point(1).m_y * u(i) + obj.m_point(3).m_y * (1 - u(i));
                        Sy(i,j) = c_y + r * cos(v(j)) * a(2) + r * sin(v(j)) * b(2);
                        c_z = obj.m_point(1).m_z * u(i) + obj.m_point(3).m_z * (1 - u(i));
                        Sz(i,j) = c_z + r * cos(v(j)) * a(3) + r * sin(v(j)) * b(3);
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
                    surf(Sx,Sy,Sz,'linestyle','-');colormap(jet);
                end
            end 
        end
    end
end

