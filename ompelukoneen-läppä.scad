use <lib/roundedcube.scad>

w = 43.5;
h = 3;
d = 28.5;

knob_depth = 6;
knob_w = 10;
knob_distance_from_center = 2 + knob_depth / 2;
knob_h = 2;
knob_roundess = 1.1;
knob_protrude = 3;

// wt eli seinän paksuus 
module kalikka(x,y,z,wt) { 
    difference() {
    group() {
            color("blue") {
                roundedcube([x+wt+wt,y+wt+wt,z+wt], true, , "xy");
                }
        }
        translate([0,0,wt]) { 
            color("red") {
                #roundedcube([x,y,z],radius=0.1, center=true);
            }
        }
    }
}
// kalikka(x=12.7, y=6.7, z=2.3, wt=0.6);
roundedcube([w, d, h], true, 1.5, "xy");
translate([w /2 - knob_w / 2 + knob_protrude, 0, h / 2 + knob_h]) {
    translate([0, knob_distance_from_center, 0]) {
        roundedcube([knob_w, knob_depth,knob_h], true, knob_roundess, "xy");
    }
    translate([0, -knob_distance_from_center, 0]) {
        roundedcube([knob_w, knob_depth,knob_h], true, knob_roundess, "xy");
    }
}