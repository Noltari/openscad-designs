include <common.scad>
include <config.scad>
include <wall.scad>

rotate([90, 0, 0])
	color(color_print)
		wall();
