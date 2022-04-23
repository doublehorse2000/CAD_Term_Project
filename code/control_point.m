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
            obj.m_y = x;
            obj.m_z = y;
            obj.m_x = z;
            obj.m_level = level;
        end
    end
end

