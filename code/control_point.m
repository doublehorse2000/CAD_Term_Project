classdef control_point < handle
    
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

