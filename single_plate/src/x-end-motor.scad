// PRUSA iteration3
// X end motor
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

// x-end needs to have thicker walls so slic3r will actually infill

use <inc/x-end.scad>

da6 = 1 / cos(180 / 6) / 2;
da8 = 1 / cos(180 / 8) / 2;
da12 = 1 / cos(180 / 12) / 2;

module x_end_motor_base(){
 x_end_base();
 //translate(v=[-14,31,26]) cube(size = [17,44,52], center = true);
 translate(v=[-14,16,26]) cube(size = [20,14,52], center = true);
 translate(v=[-19,38,9.5]) cube(size = [10,30,19], center = true);
}

//3mm_nut_hole();
module 3mm_nut_hole() {
  translate([-10,0,0])  rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 22, r=3.2*da6, $fn=6, center=true);
  translate([10,0,0]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 20, r=6.4*da6, $fn=6, center=true);
}

module x_end_motor_holes(){
 x_end_holes();
 // Position to place
 translate(v=[-0,32,30.25]){
  // Belt hole
  translate(v=[-14,1,0]) cube(size = [10,46,22], center = true);
  // Motor mounting holes
  translate(v=[-20,-15.5,-15.5]) 3mm_nut_hole();
  translate(v=[-20,-15.5,15.5]) 3mm_nut_hole();
  translate(v=[-20,15.5,-15.5]) 3mm_nut_hole();

  // Material saving cutout
  translate(v=[-10,40,-31]) rotate(a=[60,0,0])  cube(size = [60,45,45], center = true);
  translate(v=[-10,40,-2]) rotate(a=[-60,0,0])  cube(size = [60,45,45], center = true);

  //translate(v=[-23.5,10,-30]) rotate(a=[60,0,0])  cube(size = [20,45,45], center = true);
  translate(v=[-9,10,-30]) rotate(a=[60,0,0])  cube(size = [10,45,45], center = true);
  translate(v=[-14,10,30]) rotate(a=[-60,0,0])  cube(size = [20,45,45], center = true);

  translate([-10,1,-0.25]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 40, r=28.5*da6, $fn=6, center=true);
 }
}


// Final part
module x_end_motor(){
 difference(){
  x_end_motor_base();
  x_end_motor_holes();
 }
}

//x_end_motor_holes();
x_end_motor();
