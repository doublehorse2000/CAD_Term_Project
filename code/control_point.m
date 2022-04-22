classdef control_point < handle
    %UNTITLED 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        m_x,
        m_y,
        m_z,
        m_level
    end
    
    methods
        function obj = control_point(x,y,z,level)
            %   初始化
            obj.m_x = x;
            obj.m_y = y;
            obj.m_z = z;
            obj.m_level = level;
        end
    end
end

