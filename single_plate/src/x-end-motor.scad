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
 //translate(v=[-14,16,26]) cube(size = [20,14,52], center = true);
 translate(v=[-14,16,26]) cube(size = [17,14,52], center = true);
 //translate(v=[-19,38,9.5]) cube(size = [10,30,19], center = true);
 translate(v=[-18.25,38,9.5]) cube(size = [8.5,30,19], center = true);

 // z axis adjustment holder
 difference() {
   translate(v=[-2,15.5,48]) cube(size = [16,15,24], center = true);
   // angled cut
   translate(v=[13,16,40]) rotate([0,-60,0]) cube(size = [28,28,28], center = true);

   // hollowed space
   translate(v=[4,16.5,40]) cube(size = [16,7.5,24], center = true);

   // z adjuster screw hole
   translate(v=[0,16.5,38]) cube(size = [3.1,3.1,40], center = true);
   translate(v=[0,16.5,37]) cube(size = [3.1,7.5,34], center = true);

   // z adjuster nut trap
   translate(v=[0,16.5,62]) cube(size = [5.5,6.25,10], center = true);
 }
}

//3mm_nut_hole();
module 3mm_nut_hole() {
  translate([-10,0,0])  rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 21, r=3.2*da6, $fn=6, center=true);
  translate([10,0,0]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 20, r=6.4*da6, $fn=6, center=true);
}

module z_endstop_adjust(){
}

module x_end_motor_holes(){
 x_end_holes();
 // Position to place
 translate(v=[-0,32,30.25]){
  // Belt hole
  translate(v=[-14,1,0]) cube(size = [10,46,22], center = true);

  // Motor mounting holes
  translate(v=[-18,-15.5,-15.5]) 3mm_nut_hole();
  translate(v=[-18,-15.5,15.5]) 3mm_nut_hole();
  translate(v=[-18,15.5,-15.5]) 3mm_nut_hole();

  // Material saving cutout
  translate(v=[-10,40,-31]) rotate(a=[60,0,0])  cube(size = [60,45,45], center = true);
  translate(v=[-10,40,-2]) rotate(a=[-60,0,0])  cube(size = [60,45,45], center = true);

  //translate(v=[-23.5,10,-30]) rotate(a=[60,0,0])  cube(size = [20,45,45], center = true);
  translate(v=[-9,10,-30]) rotate(a=[60,0,0])  cube(size = [10,45,45], center = true);
  //translate(v=[-14,10,30]) rotate(a=[-60,0,0])  cube(size = [20,45,45], center = true);

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
