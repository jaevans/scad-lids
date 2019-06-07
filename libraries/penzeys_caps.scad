use <thread_profile.scad>


// Penzey's "B"  plastic bottle cap thread (estimated from bottle thread dims)
function bottle_penzeys_plastic_b_nut_inner_diameter() = 1.66 * 25.4; // 1.66 inches diameter
function bottle_penzeys_plastic_b_nut_thread_pitch()   = 1/6 * 25.4; // 1/6 inch
function bottle_penzeys_plastic_b_nut_thread_height()  = 1.15;
function bottle_penzeys_plastic_b_nut_thread_profile() = [
    [0,0],
    [-bottle_penzeys_plastic_b_nut_thread_height(),0.32],
    [-bottle_penzeys_plastic_b_nut_thread_height(),1.12],
    [0,1.42]
];

module penzeys_plastic_b_cap_screw(fn=$fn) {
    straight_thread(
            section_profile = bottle_penzeys_plastic_b_nut_thread_profile(),
            higbee_arc = 10,
            r     = bottle_penzeys_plastic_b_nut_inner_diameter() / 2,
            turns = 1.2, // guesstimated
            pitch = bottle_penzeys_plastic_b_nut_thread_pitch(),
            fn    = $fn
     );
}

module penzeys_plastic_b_cap(fn=$fn) {
    union() {
        difference() {
            cylinder(r=45/2,h=11.25);
            translate([0, 0, 2]) cylinder(r=bottle_penzeys_plastic_b_nut_inner_diameter() / 2,h=12);
        }
        translate([0, 0, 4]) penzeys_plastic_b_cap_screw();
    }
}

// Penzey's "D"  Glass bottle cap thread (estimated from bottle thread dims)
function bottle_penzeys_d_nut_inner_diameter() = 2.25 * 25.4; // 2.25 inches diameter
function bottle_penzeys_d_nut_outer_diameter() = 2.32 * 25.4; // 2.25 inches diameter
function bottle_penzeys_d_nut_thread_pitch()   = 1/6 * 25.4; // 1/6 inch
function bottle_penzeys_d_nut_thread_height()  = 1.15;
function bottle_penzeys_d_nut_thread_profile() = [
    [0,0],
    [-bottle_penzeys_d_nut_thread_height(),0.32],
    [-bottle_penzeys_d_nut_thread_height(),1.12],
    [0,1.42]
];

module penzeys_d_cap_screw(fn=$fn) {
    straight_thread(
            section_profile = bottle_penzeys_d_nut_thread_profile(),
            higbee_arc = 10,
            r     = bottle_penzeys_d_nut_inner_diameter() / 2,
            turns = 1.2, // guesstimated
            pitch = bottle_penzeys_d_nut_thread_pitch(),
            fn    = fn
     );
}

module penzeys_d_cap(fn=$fn) {
    union() {
        difference() {
            cylinder(r=bottle_penzeys_d_nut_outer_diameter()/2,h=12.3);
            translate([0, 0, 2]) cylinder(r=bottle_penzeys_d_nut_inner_diameter() / 2,h=12);
        }
        translate([0, 0, 4]) penzeys_d_cap_screw();
    }
}

