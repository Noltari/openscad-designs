// Wall box for Waveshare PCIe To M.2 Adapter Board (C)
// https://www.waveshare.com/product/raspberry-pi/pcie-to-m.2-board-c.htm

include <../libs/hex-grid/hex-grid.scad>

rpi_depth = 30;
rpi_height = 100;
rpi_width = 90;

box_cont = 10;
grid_sw = 9;
grid_wall = 2;

box_depth = rpi_depth + 2 + box_cont;
box_height = rpi_height - 60 + box_cont;
box_width = rpi_width + 10 + box_cont;

box_cont_h = box_cont / 2;
box_depth_h = box_depth / 2;
box_height_h = box_height / 2;
box_width_h = box_width / 2;

if ($preview) {
    color("blue") translate([0, 0, (rpi_height - box_height + box_cont) / 2]) cube([rpi_width, rpi_depth, rpi_height], center=true);
}

color("green") union() {
    difference() {
        cube([box_width, box_depth, box_height], center=true);
        cube([box_width - box_cont, box_depth + box_cont, box_height - box_cont], center=true);
        cube([box_width + box_cont, box_depth - box_cont, box_height - box_cont], center=true);
        cube([box_width - box_cont, box_depth - box_cont, box_height + box_cont], center=true);
    }

    // Back grid
    translate([box_width_h - box_cont - box_cont_h, -(box_depth_h - box_cont_h / 2), 0]) cube([box_cont * 2, box_cont / 2, box_height], center=true);
    translate([-(box_width_h - box_cont - box_cont_h), -(box_depth_h - box_cont_h / 2), 0]) cube([box_cont * 2, box_cont / 2, box_height], center=true);
    translate([0, -(box_depth_h - box_cont_h / 2), 0]) rotate([90, 0, 0]) create_grid(size=[box_width, box_height, box_cont_h], SW=grid_sw, wall=grid_wall);

    // Forward grid
    translate([0, box_depth_h - box_cont_h / 2, 0]) rotate([90, 0, 0]) create_grid(size=[box_width, box_height, box_cont_h], SW=grid_sw, wall=grid_wall);

    // Bottom grid
    translate([0, 0, box_cont_h / 2 - box_height_h]) create_grid(size=[box_width, box_depth, box_cont_h], SW=grid_sw, wall=grid_wall);

    // Left Grid
    translate([box_width_h - box_cont_h / 2, 0, 0]) rotate([0, 90, 0]) create_grid(size=[box_height, box_depth, box_cont_h], SW=grid_sw, wall=grid_wall);

    // Right grid
    translate([-(box_width_h - box_cont_h / 2), 0, 0]) rotate([0, 90, 0]) create_grid(size=[box_height, box_depth, box_cont_h], SW=grid_sw, wall=grid_wall);
}
