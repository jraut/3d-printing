use <lib/roundedcube.scad>

w = 43.5;
h = 2.10;
d = 28.35;

knob_depth = 5.2;
knob_offset = 11.05 - knob_depth;
knob_w = 7.35;
knob_distance_from_center = 2 + knob_depth / 2;
knob_h = 2;
knob_roundess = 0.75;
knob_hole_max_d = 4.45; // knob_w - knob_protrude ei saisi olla enempää
knob_protrude = knob_w - knob_hole_max_d;

klipsi_w = 5.4; // kuinka iso kiinnikeliparen koko on
klipsi_d_from_wall = 11.75; // Kuinka iso matka kiinnitylipareesta on seinään

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
roundedcube([w, d, h], true, 1, "z");
translate([w /2 - knob_w / 2 + knob_protrude, 1.4, h / 2 + knob_h / 2]) {
    translate([0, knob_distance_from_center, 0]) {
        roundedcube([knob_w, knob_depth,knob_h], true, knob_roundess, "zmax");
    }
    translate([0, -knob_distance_from_center, 0]) {
        roundedcube([knob_w, knob_depth,knob_h], true, knob_roundess, "zmax");
    }
}