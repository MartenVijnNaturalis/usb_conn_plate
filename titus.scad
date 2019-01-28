


// NBC Licensend
// Marten Vijn
// Jan 2019
plate_d=4;
plate_dd=1.6;
plate_t=81.6;
plate_m=82.7;
plate_b=79.8;
plate_h=46.3;
plate_hm=32.7;
 $fn=50;
usb();

module base(thick){
    linear_extrude(height=thick,twist = 0,slices=1){
    polygon([
        [-plate_b/2,0],
        [plate_b/2,0],
        [plate_m/2,plate_hm],
        [plate_t/2,plate_h],
        [-plate_t/2,plate_h],
        [-plate_m/2,plate_hm]
        ]);
    }
    }
    
module plate(){
    union(){
        base(plate_d);
       
        minkowski(){
            base(plate_dd); cylinder(r=2,h=0.01);
            }
        }
    } 
 
 module usb(){
     difference(){
        plate();
         //usb-b conn
       translate([15,30,-1]) cylinder(d=3,h=10);
       translate([-15,30,-1]) cylinder(d=3,h=10);
       translate([0,30,4]) cube([12,12,12], center=true);  
     }
     
 }


