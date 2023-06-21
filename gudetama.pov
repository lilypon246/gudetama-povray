#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
#include "glass.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 75      // front view
                            location  <10, 0, -15>
                            right     x*image_width/image_height
                            look_at   <0, 1, 0>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <4, 4 ,-3>
                            right     x*image_width/image_height
                            look_at   <-1.0 , 0.0 , 1>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90 // right side view
                            location  <3.0 , 1.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0 , 8,-0.001>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
camera{Camera_1}
// sun ---------------------------------------------------------------------
light_source{<-3500,1500,-500> color White}
// sky ---------------------------------------------------------------------
plane{<0,1,0>,1 hollow  
       texture{ pigment{ bozo turbulence 0.92
                         color_map { [0.00 rgb <0.20, 0.20, 1.0>*0.9]
                                     [0.50 rgb <0.20, 0.20, 1.0>*0.9]
                                     [0.70 rgb <1,1,1>]
                                     [0.85 rgb <0.25,0.25,0.25>]
                                     [1.0 rgb <0.5,0.5,0.5>]}
                        scale<1,1,1.5>*2.5  translate< 0,0,0>
                       }
                finish {ambient 1 diffuse 0} }      
       scale 10000}
// fog ---------------------------------------------------------------------
fog{fog_type   2
    distance   900
    color      White
    fog_offset 0.1
    fog_alt    2.0
    turbulence 0.8} 

    

// ground ------------------------------------------------------------------
plane { <0,1,0>, -5 
               texture{ T_Stone32    
                //normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture
       }
       
       
//brick wall--------------------------------------------------------------
#declare Wall =       
box {
  <-14, -5, -50>
  <-13, 50, 15>
texture{ pigment{ brick color White                // color mortar
                        color rgb<0.8,0.25,0.1>    // color brick
                        brick_size <0.25, 0.0525, 0.125> // format in x ,y and z- direction 
                        mortar 0.01                      // size of the mortar 
                         } // end of pigment
            normal {wrinkles 0.75 scale 0.01}
            finish {ambient 0.15 diffuse 0.95 phong 0.2} 
            scale <-13,15,20>
            rotate<0,0,0>  translate<0.01, 0.04,-0.10>
               } // end of texture
   scale 2

}


union{
    object {Wall
        rotate<0,90,0>
        translate<70,0,-6>
        
    }
}

//window-----------------------------------------------------------------
difference{
        object{Wall}
        union{
            box {
                <-50, 5, 0>
                <-10, 15, 5>
                    texture{ pigment{ color White }
                        } // end of texture -------------------------------------------

                    }
            box {
                    <-50, 5, -2>
                    <-10, 15, -7>
                        texture{ pigment{ color White }
                        } // end of texture -------------------------------------------

          }
          
          box {
                    <-50, 5, 7>
                    <-10, 15, 12>
                        texture{ pigment{ color White }
                        } // end of texture -------------------------------------------

          }
          
 }        
}


               

// Table--------------------------------------------------------------------
union{
box {
  <-3, -0.3, -3>
  <3, 0.2, 3>
    texture{ T_Wood25    
        normal { wood 0.5 scale 0.05 turbulence 0.1 rotate<0,0,0> }
            finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture 

}


//Table Feet
cylinder {
  <-2.5, -5, -2.5>
  <-2.5, 0, -2.5>
  0.2 // Radius
    texture{ T_Wood25    
        normal { wood 0.5 scale 0.05 turbulence 0.1 rotate<0,0,0> }
            finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture
}

cylinder {
  <2.5, -5, -2.5>
  <2.5, 0, -2.5>
  0.2 // Radius
    texture{ T_Wood25    
        normal { wood 0.5 scale 0.05 turbulence 0.1 rotate<0,0,0> }
            finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture
}

cylinder {
  <-2.5, -5, 2.5>
  <-2.5, 0, 2.5>
  0.2 // Radius
    texture{ T_Wood25    
        normal { wood 0.5 scale 0.05 turbulence 0.1 rotate<0,0,0> }
            finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture
}

cylinder {
  <2.5, -5, 2.5>
  <2.5, 0, 2.5>
  0.2 // Radius
    texture{ T_Wood25    
        normal { wood 0.5 scale 0.05 turbulence 0.1 rotate<0,0,0> }
            finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture
}
}

//end of Table--------------------------------------------------------

// Chair--------------------------------------------------------------------
#declare Chair =
union{
    box {
        <-3, 0, -3>
        <0.5, 0.2, 0.5>
            texture{ T_Wood25    
                normal { wood 0.5 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture 

}


//Chair Feet=========================
    cylinder {
        <-2.5, -3, -2.5>
        <-2.5, 0, -2.5>
        0.2 // Radius
            texture{ T_Wood25    
                normal { wood 0.5 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                    finish { phong 1 } 
                        rotate<0,0,0> scale 0.5 translate<0,0,0>
                    } // end of texture
}

    cylinder {
        <0, -3, -2.5>
        <0, 0, -2.5>
        0.2 // Radius
            texture{ T_Wood25    
            normal { wood 0.5 scale 0.05 turbulence 0.1 rotate<0,0,0> }
            finish { phong 1 } 
            rotate<0,0,0> scale 0.5 translate<0,0,0>
        } // end of texture
}

    cylinder {
        <-2.5, -3, 0>
        <-2.5, 0, 0>
        0.2 // Radius
            texture{ T_Wood25    
                normal { wood 0.5 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture
}

    cylinder {
        <0, -3, 0>
        <0, 0, 0>
        0.2 // Radius
        texture{ T_Wood25    
                normal { wood 0.5 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture
}

//Chair Back=====================
cylinder {
  <0, 0.2, 0>
  <0, 3, 0>
  0.2 // Radius
    texture{ T_Wood25    
        normal { wood 0.5 scale 0.05 turbulence 0.1 rotate<0,0,0> }
            finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture
}

cylinder {
  <0, 0.2, -2.5>
  <0, 3, -2.5>
  0.2 // Radius
    texture{ T_Wood25    
        normal { wood 0.5 scale 0.05 turbulence 0.1 rotate<0,0,0> }
            finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture
}

box {
  <-0.2, 2, -3>
  <0.3, 4, 0.5>
    texture{ T_Wood25    
        normal { wood 0.5 scale 0.05 turbulence 0.1 rotate<0,0,0> }
            finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<-1,0,0>
              } // end of texture 

}

translate<8,-2,0>
rotate<0,10,0>
}

//end of Chair--------------------------------------------------------

union{
    object {Chair}             //east
    
    object {Chair
        rotate <0,90,0>
        translate <-2,0,2>}    //south
        
    object {Chair
        rotate <0,180,0>
        translate <-1,0,2>}    //west
        
    object {Chair
        rotate <0,270,0>
        translate <-2,0,-1>}  //north              

}

// Plate--------------------------------------------------------------
cylinder {
  <0, 0.2, 0>
  <0, 0.25, 0> // Top position
  2 // Radius
  texture {
    pigment {
      color White
    }
  }
}


// Gudetama body------------------------------------------------------
#declare Strength = 1; //(+ or -) strength of component's radiating density
#declare Radius1  = 1.2; //(0 < Radius) outer sphere of influence on other components
blob{
  threshold 0.6 // threshold (0.0 < threshold <= Strength) surface falloff threshold #

  sphere{<0.5, -1.4, 0.5>, Radius1, Strength}
  sphere{<-0.5, -1.4, 0.5>, Radius1, Strength}
  
  //feet
  cylinder{<1, -1.4, 0.7>, <1.2, -1.4, 0.7>, 0.1, 1}   //left
  cylinder{<0.9, -1.4, 0.2>, <1.2, -1.4, 0.2>, 0.1, 1} //right 
  
  //hands
  cylinder{<-0.2, -1.4, -0.1>, <0, -1.4, -0.2>, 0.1, 1} //right
  cylinder{<0.1, -1.4, 1.3>, <-0.3, -1.4, 0.9>, 0.1, 1}   //left

  scale <1, 0.5, 1>
  rotate<0,0,0>
  translate<0,1,-0.5>
  texture{ pigment{ color rgb<1, 0.64, 0> }
           finish { phong 1 }
         }
 } //------------------------------------------------------ end of blob object
 

 
//Gudetama Eyes--------------------------------------------
blob{
  threshold 0.6
  //eyes
  cylinder{<-0.47, -0.5, 0.1>, <-0.5, -0.48, 0.15>, 0.1, 1} //left
  cylinder{<-0.5, -0.44, 0.6>, <-0.47, -0.445, 0.65>, 0.1, 1}   //right
  
  translate<0,1,-0.5>
  texture{ pigment{ color rgb<0,0, 0> }
 }
}


//Gudetama Mouth--------------------------------------------
union{
sphere{ <0,0,0>, 0.07 

        texture { pigment {color White}}

        scale<2,0.2,0.99>  rotate<0,90,0>  translate<-0.29, 0.61, -0.09>  
      } // end of sphere -----------------------------------
       
sphere{ <0,0,0>, 0.09 

        texture { pigment {color Black}}

        scale<2,0.2,1.1>  rotate<0,90,2>  translate<-0.29, 0.6, -0.09>  
      } // end of sphere ----------------------------------- 

}
 
//white egg part------------------------------------------------------
cylinder {
  <0, 0.2, 0>
  <0, 0.3, 0> // Top position
  1.3 // Radius
  texture {
    pigment {
      color <0.2, 0.8, 0.9>
      transmit 0.8
    }
    
   finish{
    ambient 0.1
    diffuse 0.5
    specular 0.9
    brilliance 0.8
    phong 0.5
    phong_size 10
    reflection {0.2}
   }
  }
  
  interior{
    ior 1.33
  }
}


//make some dunnots--------------------------------------------------
//dunot 1
union{
torus { 0.5,0.3
        texture { 
        pigment{ 
            color rgb<1,0.84,0.3>
            }
        finish { 
        reflection { 0.00 metallic 0.50} }
                } // end of texture
        
    scale <1,1,1> rotate<0,0,0> translate<-0.5, 0.5, 2>
    } // end of torus  -------------------------------

torus { 0.5,0.3
        texture { 
        pigment{ 
            color rgb<1,0.4,0.7>
            }
        finish {
        phong 0.5 
        reflection { 0.00 metallic 0.50} }
                } // end of texture
        
    scale <1,0.8,1> rotate<0,0,0> translate<-0.5, 0.6, 2>
    } // end of torus
}


//dunot2
union{
torus { 0.4,0.3
        texture { 
        pigment{ 
            color rgb<1,0.84,0.3>
            }
        finish { 
        reflection { 0.00 metallic 0.50} }
                } // end of texture
        
    scale <1,1,1> rotate<0,0,0> translate<2, 0.5, 1>
    } // end of torus

torus { 0.4,0.3
        texture { 
        pigment{ 
            color rgb< 0.0, 1.0, 0.5>
            }
        finish {
        phong 0.5 
        reflection { 0.00 metallic 0.50} }
                } // end of texture
        
    scale <1,0.8,1> rotate<0,0,0> translate<2, 0.6, 1>
    }
} 

// end of dunot  -------------------------------

//house miniature-------------------------------------------------------------
//house 1
union{
prism { -1.00 ,1.00 , 6
       <-1.00, 0.00>,
       < 1.00, 0.00>, 
       < 1.00, 1.00>, 
       < 0.00, 2.00>, 
       <-1.00, 1.00>, 
       <-1.00, 0.00>
       rotate<-90,0,0> scale<1,1,-1>

       texture { pigment{ color rgb<0.95, 0.91, 0.62> } 
                 finish { phong 1.0 } 
               } 
       scale <0.2,0.2,0.2>       
       rotate <0,0,0> 
       translate <-2, 0.2, -1.7> 
     } // end of prism

prism { -1.10 ,1.10 , 7
       <-1.05, 0.95>,
       < 0.00, 2.00>,  
       < 1.05, 0.95>, 
       < 1.05, 1.00>, 
       < 0.00, 2.05>, 
       <-1.05, 1.00>, 
       <-1.05, 0.95>
       rotate<-90,0,0> scale<1,1,-1> 
       texture { pigment{ color Scarlet } 
                 finish { phong 1.0 }
               } // end of texture

       scale <0.2,0.2,0.2>       
       rotate <0,0,0> 
       translate <-2, 0.2, -1.7> 
     } // end of prism --------------------------------------------------------
}
     

//house 2
union{
prism { -1.00 ,1.00 , 6
       <-1.00, 0.00>,
       < 1.00, 0.00>, 
       < 1.00, 1.00>, 
       < 0.00, 2.00>, 
       <-1.00, 1.00>, 
       <-1.00, 0.00>
       rotate<-90,0,0> scale<1,1,-1>

       texture { pigment{ color rgb<0.95, 0.91, 0.62> } 
                 finish { phong 1.0 } 
               } 
       scale <0.2,0.2,0.2>       
       rotate <0,30,0> 
       translate <-2, 0.2, -2.5> 
     } // end of prism

prism { -1.10 ,1.10 , 7
       <-1.05, 0.95>,
       < 0.00, 2.00>,  
       < 1.05, 0.95>, 
       < 1.05, 1.00>, 
       < 0.00, 2.05>, 
       <-1.05, 1.00>, 
       <-1.05, 0.95>
       rotate<-90,0,0> scale<1, 1, -1> 
       texture { pigment{ color rgb< 0.0, 0.5, 0.5> } 
                 finish { phong 1.0 }
               } // end of texture

       scale <0.2,0.2,0.2>       
       rotate <0,30,0> 
       translate <-2, 0.2, -2.5> 
     } // end of prism --------------------------------------------------------
}



//picture----------------------------------------------------------------------


box {
   <3, 0, -1>
   <0, 1.5, -1>          
      texture {   
         pigment {
             image_map {
                 jpeg "gudepiyo.jpg" 
                    map_type 0        
                       }              
            scale <-3, 1.5, 1>
                 }   
               }
        scale <0.9,0,0> rotate<90,290,0> translate <2.2,-0.77,-3.6>
                
}

