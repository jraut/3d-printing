use <lib/roundedcube.scad>

// # makes the object solid, useful when doing difference
//  Then there are !, and others

w = 42;
h = 1.6;
d = 27.5;

knob_depth = 5;
knob_offset = 11.05 - knob_depth;

knob_w = 4;
knob_distance_from_center = 2 + knob_depth / 2;
knob_h = 1.5;
knob_roundess = 0.75;
knob_hole_max_d = 2; // knob_w - knob_protrude ei saisi olla enempää
knob_protrude = knob_w - knob_hole_max_d;

notch_w = 10.4; // kuinka iso kiinnikeliparen koko on
notch_depth = 1;
notch_height = 1;
notch_container_height = 4;
notch_container_depth = 2;
notch_container_wall_width = 2;
notch_container_width = notch_w + notch_container_wall_width * 2;

roundedcube([ w, d, h ], true, 1, "z");
translate([ w / 2 - knob_w / 2 + knob_protrude, 1.4, h / 2 + knob_h / 2 ])
{
    translate([ 0, knob_distance_from_center, 0 ])
    {
        roundedcube([ knob_w, knob_depth, knob_h ], true, knob_roundess, "zmax");
    }
    translate([ 0, -knob_distance_from_center, 0 ])
    {
        roundedcube([ knob_w, knob_depth, knob_h ], true, knob_roundess, "zmax");
    }
}

// knob
translate([ -w / 2 + notch_container_depth / 2, 0, h ])
{
    // Main cube with a part removed
    difference()
    {
        roundedcube([ notch_container_depth, notch_container_width, notch_container_height ], true, 0.00001, "");
        // Shape to subtract from the main cube
        translate([
            -0.001 - notch_container_depth / 2, -1 * (notch_w) / 2, -0.5
        ])
        {
            cube([ notch_depth, notch_w, notch_height ]);
        }
    }
}