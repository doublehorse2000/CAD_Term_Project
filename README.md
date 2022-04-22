# CAD_Term_Project
本仓库为数字化设计与制造的大作业

## Matlab脚本

### 1.control_joint类

```c++
class control_joint{
    double m_world[3];//
    double m_head[3];//level = 1
    double m_shoulder_l[3];//level = 2
    double m_shoulder_r[3];//level = 3
    double m_elbow_l[3];//level = 21
    double m_elbow_r[3];//level = 31
    double m_leg_l[3];//level = 4
    double m_leg_r[3];//level = 5
    double m_knee_l[3];//level = 41
    double m_knee_r[3];//level = 51
    control_mesh mesh[200];
    
    void move_world(double x,double y,double z,double alpha,double beta);
    void move_head(double x,double y,double z,double alpha,double beta);
    void move_shoulder_l(double x,double y,double z,double alpha,double beta);
    void move_shoulder_r(double x,double y,double z,double alpha,double beta);
    void move_elbow_l(double x,double y,double z,double alpha,double beta);
    void move_elbow_r(double x,double y,double z,double alpha,double beta);
    void move_leg_l(double x,double y,double z,double alpha,double beta);
    void move_leg_r(double x,double y,double z,double alpha,double beta);
    void move_knee_l(double x,double y,double z,double alpha,double beta);
    void move_knee_r(double x,double y,double z,double alpha,double beta);
    
    
};
```

### 2.control_mesh

```c++
class control_mesh{
    string type;
    //"Bezier33"
    //"Bezier32"
    //"Bezier22"
    //"Circle"
    //"line"
    int number;//控制点个数
    control_point m_point[16];
    void make_mesh();
};
```

### 3.control_point

```c++
class control_point{
    int m_x;
    int m_y;
    int m_z;
    int level;
};
```

