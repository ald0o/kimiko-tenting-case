// Parameters

shape2DFile = "benroe-standard-plates/kimiko-plate-bottom-screwless.svg";

withTent=true;
screwDiam=6;
screwHeight=2;

withRest=false;

hotSwap=true; 

hsHeight=2;
pcbThickness=1.6;
switchSubHeight=5;

pinHeight=3.3;

bzHeight=5;
bzRadius=2;

gasketThickness=1;
gasketWidth=3;

sideThickness=2;
bottomThickness=0;

clearance=0.1;

screws = [
[-43, -74, 0],//without rest
//[-22, -115, 0],// with rest
[-53, 21, 0], 
//[104, 14, 0]
// fake screws to make a nice convex hull
//[60, -24, 0]
//[90, -40, 0],
//[40, -112, 0],
//[-25, -62, 0], 
];

// computed values

underGasket = hsHeight;
interHeight = switchSubHeight + pcbThickness + gasketThickness;

totalHeight = interHeight + bzHeight + underGasket+bottomThickness;

pcbTopZ = pcbThickness+hsHeight +gasketThickness+bottomThickness;
plateTopZ = pcbTopZ+switchSubHeight;

module TRRS() {
    diam=9;
    inR = 2.4;
    translate([-75,-19.5,inR+ pcbTopZ])
    rotate([0,90,0]) {
        cylinder(h=30, d=diam);
    }
}

module USB() {
    //translate([-36,0,0]) cube([23,50,9.3]);
    translate([-28.69,29.4,8]) rotate([90,0,0]) cylinder(d=10,h=20);
}

module shape2D() {
   import (file = shape2DFile, convexity=0);
}

module screw() {
    minkowski() {
        cylinder(d=screwDiam+5,h=screwHeight);
        sphere(r=bzRadius);
    }      
}

module screws() {
    for (s = screws)
        hull() {      
            translate(s) screw();
            if (withRest)
                cylinder(r=52,h=screwHeight);
            else translate([20,-10,screwHeight/2])
                cylinder(r=40,h=screwHeight);
        }
}

module screw_hole() {
    cylinder(d=screwDiam,h=500);
}

module screwHoles() {
    for (s = screws) translate(s) screw_hole();
}
module tenting() {
    difference() {
        
//            outsideShape(screwHeight);
            screws();

//        hull() outsideShape(screwHeight);
        screwHoles();
    }
}

module rest() {
    restHeight = totalHeight - 3;
    difference() {
        hull() {
            outsideShape(restHeight);
            translate([47,-124,0]) {
                minkowski() {
                    cylinder(d=95,h=restHeight-8);
                    sphere(r=bzRadius);
                }
            }
        }
        translate([-250,0,0]) cube([500,200,100]);
    }

}

module insideBottom() {
    linear_extrude(height = underGasket + 200)
   offset(r=-gasketWidth) shape2D();
}

module insideTop() {
linear_extrude(height = interHeight + bzHeight + 100) offset(r=clearance) shape2D();
}

module outsideShape(height) {
    minkowski() {
        linear_extrude(height = height) shape2D();
        sphere(r = bzRadius);
    }
}

module outside() {
    outsideShape(totalHeight);
}


translate([45.6,-27.6,-2])
difference() {
    union() {
        outside();
        if (withTent) tenting();
        if (withRest) rest();
    }
    translate([0,0, bottomThickness]) {
        translate([0,0, underGasket])    { insideTop();};
        insideBottom();
    }
    translate([-2500,-2500,-5000]) cube([5000,5000,5000]);
    TRRS();
    USB();
}