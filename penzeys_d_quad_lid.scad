use <penzeys_caps.scad>
use <knurledFinishLib_v2.scad>

// 
//  Simple knob creater
//
//   Ben Hunter 2019
//

module knob(diameter, height, nobs = 6, neck = -1, neck_len = -1, hole = -1) {
    //
    // calulate the angle based an number of nobs
    angle = 360 / nobs ;	              

    difference() {

        union() {
            cylinder(d = diameter , h = height,center=false); 


            for(i = [0 : 1 : nobs-1]) {
                echo  ("Nob: ",i);
                rotate([0,0,angle*i])
                translate([diameter/3,0,0])
                cylinder(d1 = diameter * 3/5, d2=diameter * 7/16, h = height,center=false);  
            }
        }
        // Draw the neck if requested
        if (neck_len > 0 && neck > 0) {
            translate([0,0,height])
                cylinder(d = neck , h = neck_len,center=false); 
        }
        // Draw the center hole if requested
        if (hole > 0) {
            cylinder(d = hole , h = (height+neck_len)*3,center=false); 
        }
    }
}
$fn = 100;
/*


size = 20;      // Size of knob
height = 7;     
nobs = 6;       // nobs around thec outside
neck = 12;      // neck size
neck_len = 7;
hole= 6;        // bolt size
nut = 9.5;      // nut hex size M5 nut
*/

module penzeys_plastic_b_tri() {
    union() {
        knob(diameter=bottle_penzeys_plastic_b_nut_inner_diameter(), height = 9, nobs = 3, hole=bottle_penzeys_plastic_b_nut_inner_diameter());

        penzeys_b_cap();
    }
}

// penzeys_plastic_b_tri();

module penzeys_d_quad() {
    union() {
        knob(diameter=bottle_penzeys_d_nut_inner_diameter(), height = 12.3, nobs = 4, hole=bottle_penzeys_d_nut_inner_diameter());

        penzeys_d_cap();
    }
}
penzeys_d_quad();
