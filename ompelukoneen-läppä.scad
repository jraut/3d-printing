use <lib/roundedcube.scad>

w = 43;
h = 1.6;
d = 27;

knob_depth = 5;
knob_offset = 11.05 - knob_depth;

knob_w = 4;
knob_distance_from_center = 2 + knob_depth / 2;
knob_h = 1.5;
knob_roundess = 0.75;
knob_hole_max_d = 2; // knob_w - knob_protrude ei saisi olla enempää
knob_protrude = knob_w - knob_hole_max_d;

notch_w = 5.4; // kuinka iso kiinnikeliparen koko on
notch_d_from_wall = 11.75; // Kuinka iso matka kiinnitylipareesta on seinään
notch_depth = 0.5;
notch_distance_from_surface = 0.5;
notch_height = 0.5;
notch_container_height = 4;
notch_container_depth = 2;
notch_container_width = notch_w + 0.2 + 2;

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

// knob
translate([-w/2 + notch_container_depth/2,0, h]) {
// Main cube with a part removed
    difference() {
        roundedcube([notch_container_depth, notch_container_width,notch_container_height], true,  0.001, "");
        // Shape to subtract from the main cube
        translate([-notch_container_depth / 2, -1 * ((notch_container_width + notch_w)/ 2)/2, notch_height / 3]) {
            cube([notch_depth, notch_w + 1, notch_h]);  
        }
    }
}
    
