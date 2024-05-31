#include "colors.inc"
#include "shapes.inc"
#include "glass.inc"

camera{  
        //location<13,13,-13>
        location <20,(1-clock)*15+15,-20>
        look_at <0,0,0> 
        rotate<0,clock*360,0>
        angle (1-clock)*10+30
}   

//background { color LightBlue }
background{color NavyBlue} 

//object{Cylinder_X scale 0.01 pigment{color Red} finish{ambient 1.0} no_shadow}   
//object{Cylinder_Y scale 0.01 pigment{color Green} finish{ambient 1.0} no_shadow} 
//object{Cylinder_Z scale 0.01 pigment{color Blue} finish{ambient 1.0} no_shadow}        

//light_source{<0,10,-10> color White}
//light_source{<0,10,0> color White}  
light_source{<10,10,-10> color White}
#declare I=0;
#while(I<6)
        light_source{<cos(2*pi*I/6),10,sin(2*pi*I/6)> color White}  
        light_source{<cos(2*pi*I/6),-10,sin(2*pi*I/6)> color White}
        #declare I = I+1;
#end  

#declare Crystal =merge{
        object {
                prism {
                linear_sweep
                linear_spline
                0, // 下面の位置
                1, // 上面の位置
                12, // 底面の頂点数
                #declare I=0;
                #while(I < 12)
                        <cos(2*pi*I/12),sin(2*pi*I/12)>
                        #declare I = I+1;
                #end
                }
                scale <1,2,1>
        } 
        
        object {
                prism {
                conic_sweep
                linear_spline
                0, // 下面の位置
                1, // 上面の位置
                12, // 底面の頂点数
                #declare I=0;
                #while(I < 12)
                        <cos(2*pi*I/12),sin(2*pi*I/12)>
                        #declare I = I+1;
                #end
                }
                scale<1,-1.5,1>
                translate<0,3.5,0> 
        }  
        
        object {
                prism {
                conic_sweep
                linear_spline
                0, // 下面の位置
                1, // 上面の位置
                12, // 底面の頂点数
                #declare I=0;
                #while(I < 12)
                        <cos(2*pi*I/12),sin(2*pi*I/12)>
                        #declare I = I+1;
                #end
                }
                scale<1,1.5,1>
                translate<0,-1.5,0> 
        }  
}
#declare snow = merge{
        difference{
                object{
                        prism {
                        linear_sweep
                        0, // 下面の位置
                        1, // 上面の位置
                        6, // 底面の頂点数
                        #declare I=0;
                        #while(I < 6)
                                <cos(2*pi*I/6),sin(2*pi*I/6)>
                                #declare I = I+1;
                        #end
                        }
                        //scale <1,2,1>
                        scale<2,0.25,2>
                }
                
                object{
                        prism {
                        linear_sweep
                        linear_spline
                        0, // 下面の位置
                        1, // 上面の位置
                        6, // 底面の頂点数
                        #declare I=0;
                        #while(I < 6)
                                <cos(2*pi*I/6),sin(2*pi*I/6)>
                                #declare I = I+1;
                        #end
                        }     
                        scale <1.5,1.5,1.5>  
                        translate<0,-1,0>
                }  
        } 
        
        difference{
                object{
                        prism {
                        linear_sweep
                        linear_spline
                        0, // 下面の位置
                        1, // 上面の位置
                        6, // 底面の頂点数
                        #declare I=0;
                        #while(I < 6)
                                <cos(2*pi*I/6),sin(2*pi*I/6)>
                                #declare I = I+1;
                        #end
                        }
                        //scale <1,2,1>
                        scale<1,0.25,1>
                }
                
                object{
                        prism {
                        linear_sweep
                        linear_spline
                        0, // 下面の位置
                        1, // 上面の位置
                        6, // 底面の頂点数
                        #declare I=0;
                        #while(I < 6)
                                <cos(2*pi*I/6),sin(2*pi*I/6)>
                                #declare I = I+1;
                        #end
                        }     
                        scale <0.5,1.5,0.5>  
                        translate<0,-1,0>
                }
        }
        merge{
                #declare I=0;
                #while(I<6)
                object{
                        Cube
                        scale<0.25,0.25,1.75>
                        translate<0,0,2.5>   
                        rotate y*60*I+y*30
                } 
                
                object{
                        Cube
                        scale<0.25,0.25,0.75>
                        rotate y*30 
                        translate<-0.75,0,2.5> 
                        rotate y*60*I
                }
                object{
                        Cube
                        scale<0.25,0.25,0.75>
                        rotate y*90
                        translate<-1.9,0,1.85>
                        rotate y*60*I
                }        
                object{
                        Cube
                        scale<0.25,0.25,0.5>
                        rotate y*30 
                        translate<-1.25,0,3.25>
                        rotate y*60*I 
                }
                object{
                        Cube
                        scale<0.25,0.25,0.5>
                        rotate y*90 
                        translate<-2.15,0,2.75>
                        rotate y*60*I
                }
                #declare I = I+1;
                #end 
        }
} 
 
#declare snow1=union{
        object{
                prism {
                        conic_sweep
                        linear_spline
                        0, // 下面の位置
                        1, // 上面の位置
                        4, // 底面の頂点数
                        #declare I=0;
                        #while(I < 4)
                                <cos(2*pi*I/4),sin(2*pi*I/4)>
                                #declare I = I+1;
                        #end
                } 
                scale<1,-1,1>  
                translate<0,1,0>
                pigment{color White}
        } 
        object{
                prism {
                        conic_sweep
                        linear_spline
                        0, // 下面の位置
                        1, // 上面の位置
                        4, // 底面の頂点数
                        #declare I=0;
                        #while(I < 4)
                                <cos(2*pi*I/4),sin(2*pi*I/4)>
                                #declare I = I+1;
                        #end
                } 
                translate<0,-1,0>
                pigment{color White}
        }  
}

object{
        snow 
        translate<0,-1,0> 
        scale<1,0.5,1>
        pigment{color Clear}
        finish{ F_Glass1 }
        interior {
                I_Glass1
                fade_color Col_Azurite_02
                ior 1.15
        }
} 

object{
        Crystal 
        translate<0,1.5,0> 
        pigment{color Clear}
        finish{ F_Glass1 }
        interior {
                I_Glass1
                fade_color Col_Blue_03
                ior 1.33
        }
}     

object{
        Plane_XZ
        pigment{rgb<0.1,0.1,0.3>} 
        //pigment{NavyBlue}
        translate<0,-20,0>
}   

#declare S1 = seed(2023);    
#declare I=0;
#while(I<200)
        object{
                snow1 
                scale 0.15
                rotate x*rand(S1)
                rotate y*rand(S1)
                rotate z*rand(S1)
                translate<((-30-30)*rand(S1)+30),clock*-30+((25-15)*rand(S1)+15),((-30-30)*rand(S1)+30)> 
                pigment{White}       
        }
        object{
                Sphere
                scale 0.1
                translate<((-30-30)*rand(S1)+30),clock*-30+((25-15)*rand(S1)+15),((-30-30)*rand(S1)+30)> 
                pigment{White}
        }
        #declare I = I+1;
#end