include <common.scad>
include <config.scad>

module shelf()
{
	c_l = shelf_d;
	c_w = shelf_w;
	c_h = shelf_t;

	joint_x = shelf_w / 2 - wall_t / 2;
	joint_y = - shelf_d / 2;
	joint_z = - shelf_t / 2;

	union()
	{
		color(color_shelf)
			cube([c_l, c_w, c_h], center=true);

		color(color_dovetail)
			rotate([0, 0, 90])
				translate([joint_x, joint_y, joint_z])
					dovetail(
						length = shelf_dovetail_len,
						depth = joint_depth,
						neck = joint_neck,
						head = joint_head
					);

		color(color_dovetail)
			rotate([0, 0, 90])
				translate([0, joint_y, joint_z])
					dovetail(
						length = shelf_dovetail_len,
						depth = joint_depth,
						neck = joint_neck,
						head = joint_head
					);

		color(color_dovetail)
			rotate([0, 0, 90])
				translate([-joint_x, joint_y, joint_z])
					dovetail(
						length = shelf_dovetail_len,
						depth = joint_depth,
						neck = joint_neck,
						head = joint_head
					);
	}
}
