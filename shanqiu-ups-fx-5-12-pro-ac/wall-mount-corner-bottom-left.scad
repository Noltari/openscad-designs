// Wall mount corner for Shanqiu UPS FX 5-12Pro-AC
// https://hgdups.com/product-13896-13942-36287.html

include <shanqiu-ups-fx-5-12-pro-ac.scad>

shanqiu_ups($preview);

box_color = "green";
box_cont = 10;
box_depth_pad = 0;

ups_border_sep = 6;
ups_wall_sep = 10;
ups_wall_sep_add = ups_wall_sep - box_cont / 2;

box_depth = ups_depth + box_depth_pad + box_cont;
box_height = 50;
box_width = 50;

box_cont_h = box_cont / 2;
box_depth_h = box_depth / 2;
box_height_h = box_height / 2;
box_width_h = box_width / 2;

difference() {
    translate([-(ups_height_h - box_height_h + box_cont_h), ups_wall_sep_add / 2, -(ups_width_h - box_width_h + box_cont_h)]) union() {
        color(box_color) difference() {
            cube([box_width, box_depth + ups_wall_sep_add, box_height], center=true);
            translate([0, -ups_wall_sep_add * 2 - box_cont, 0]) cube([box_width - box_cont * 2, box_depth + box_cont, box_height - box_cont * 2], center=true);
            translate([-ups_wall_sep, -ups_wall_sep_add / 2, box_cont]) cube([box_width, box_depth - ups_border_sep - box_cont, box_height], center=true);
        }
    }

    shanqiu_ups(true, box_color);

    translate([-(ups_height_h - box_cont), ups_depth_h + ups_wall_sep_add, -ups_width_h + box_cont]) rotate([90, 0, 0]) cylinder(ups_wall_sep + 1, d=3, center=true, $fn=100);
    translate([-(ups_height_h - box_cont), ups_depth_h + 1.4, -ups_width_h + box_cont]) rotate([90, 0, 0]) cylinder(3, d=6, center=true, $fn=100);

    translate([-(ups_height_h - box_height + box_cont * 2), ups_depth_h + ups_wall_sep_add, -ups_width_h + box_width - box_cont * 2]) rotate([90, 0, 0]) cylinder(ups_wall_sep + 1, d=3, center=true, $fn=100);
    translate([-(ups_height_h - box_height + box_cont * 2), ups_depth_h + 1.4, -ups_width_h + box_width - box_cont * 2]) rotate([90, 0, 0]) cylinder(3, d=6, center=true, $fn=100);
}
