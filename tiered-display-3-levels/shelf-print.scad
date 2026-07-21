include <common.scad>
include <config.scad>
include <shelf.scad>

rotate([0, 180, 0])
	color(color_print)
		shelf();
