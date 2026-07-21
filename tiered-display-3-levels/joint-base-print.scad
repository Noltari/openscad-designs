include <common.scad>
include <config.scad>
include <joint.scad>

rotate([0, 180, 0])
	color(color_print)
		joint_base();
