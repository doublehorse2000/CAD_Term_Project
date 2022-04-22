classdef control_mesh < handle
    %UNTITLED 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        m_type,
        m_number,
        m_point,
        m_m,
        m_n
    end
    
    methods
        function obj = control_mesh(type,number,point)
            obj.m_m = 3;
            obj.m_n = 3;
            obj.m_type = type;
            obj.m_number = number;
            obj.m_point = point;
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
                    Bu(:,i+1) = prod(i + 1:obj.m_m) / prod(1:obj.m_m - i) * u .^ i .* (1 - u) .^ (obj.m_m - i);
                end
                for i = 0:obj.m_n
                    Bw(:,i+1) = prod(i + 1:obj.m_n) / prod(1:obj.m_n - i) * w .^ i .* (1 - w) .^ (obj.m_n - i);
                end
                Sx = Bu * px * Bw';
                Sy = Bu * py * Bw';
                Sz = Bu * pz * Bw';
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
                    obj.m_point(9).m_y],4,4)';
                pz = reshape([obj.m_point(1).m_z
                    obj.m_point(2).m_z
                    obj.m_point(3).m_z
                    obj.m_point(4).m_z
                    obj.m_point(5).m_z
                    obj.m_point(6).m_z
                    obj.m_point(7).m_z
                    obj.m_point(8).m_z
                    obj.m_point(9).m_z],4,4)';
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
            elseif obj.m_type == "circle"
            elseif obj.m_type == "line"
            end
            
        end
    end
end

