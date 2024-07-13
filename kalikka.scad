use <roundedcube.scad>

// wt eli seinän paksuus 
module kalikka(x,y,z,wt) { 
    difference() {
    group() {
            color("blue") {
                roundedcube([x+wt+wt,y+wt+wt,z+wt], true, 0.7, "xy");
                }
        }
        translate([0,0,wt]) { 
            color("red") {
                #roundedcube([x,y,z],radius=0.1, center=true);
            }
        }
    }
}
kalikka(x=12.7, y=6.7, z=2.3, wt=0.6);
tuolleen tein joskus tyhjän laatikon, testaa
