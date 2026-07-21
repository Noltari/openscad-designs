include <common.scad>
include <config.scad>

module joint_dovetail()
{
	rotate([90, 0, 0])
		translate([0, -(wall_dovetail_len / 2), (joint_depth / 2)])
			dovetail(
				length = wall_dovetail_len,
				depth = joint_depth,
				neck = joint_neck,
				head = joint_head
			);
}

module joint(joint_len)
{
	c_l = joint_neck;
	c_w = joint_len + eps;
	c_h = wall_dovetail_len;

	joint_x = 0;
	joint_y = (joint_len / 2) + (joint_depth / 2);
	joint_z = 0;

	union()
	{
		color(color_joint)
			cube([c_l, c_w, c_h], center=true);

		color(color_dovetail)
			translate([joint_x, joint_y, joint_z])
				rotate([0, 0, 0])
					joint_dovetail();

		color(color_dovetail)
			translate([-joint_x, -joint_y, joint_z])
				rotate([0, 0, 180])
					joint_dovetail();
	}
}

module joint_base()
{
	joint(shelf_w - (wall_t * 2));
}

module joint_modules()
{
	joint(clearance);
}
