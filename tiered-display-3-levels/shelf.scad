include <config.scad>

module shelf_dovetail(length,
	depth,
	neck,
	head)
{
	rotate([-90, 0, 0])
		linear_extrude(height = length, convexity = 10)
			polygon(points = [
				[-neck / 2, 0],
				[-head / 2, depth],
				[ head / 2, depth],
				[ neck / 2, 0]
			]);
}

module shelf()
{
	st_l = shelf_d;
	st_w = shelf_w;
	st_h = shelf_t;

	joint_x = shelf_w / 2 - wall_t / 2;
	joint_y = - shelf_d / 2;
	joint_z = - shelf_t / 2;

	union() {
		cube([st_l, st_w, st_h], center=true);

		rotate([0, 0, 90])
			translate([joint_x, joint_y, joint_z])
				shelf_dovetail(
					length = joint_length,
					depth = joint_depth,
					neck = joint_neck,
					head = joint_head
				);

		rotate([0, 0, 90])
			translate([-joint_x, joint_y, joint_z])
				shelf_dovetail(
					length = joint_length,
					depth = joint_depth,
					neck = joint_neck,
					head = joint_head
				);
	}
}
