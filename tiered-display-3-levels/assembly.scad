include <common.scad>
include <config.scad>
include <joint.scad>
include <shelf.scad>
include <wall.scad>

/* assembly / joint_base / joint_modules / shelf / wall / wall_middle */
part = "assembly";

module assembly()
{
	union()
	{
		joint_z = -(shelf_h_sep * 3 / 2) + wall_t - (wall_dovetail_len / 2);
		wall_y = (shelf_w / 2) - (wall_t / 2);

		/* Left wall */
		translate([0, -wall_y, 0])
			color(color_wall)
				wall_middle();

		/* Right wall */
		translate([0, +wall_y, 0])
			color(color_wall)
				wall();

		/* Shelf 1 */
		translate([+shelf_d, 0, -(shelf_h_sep / 2) + (shelf_t / 2)])
			shelf();

		/* Shelf 2 */
		translate([0, 0, (shelf_h_sep / 2) + (shelf_t / 2)])
			shelf();

		/* Shelf 3 */
		translate([-shelf_d, 0, (shelf_h_sep * 3 / 2) + (shelf_t / 2)])
			shelf();

		/* Joint base */
		translate([0, 0, joint_z])
			joint_base();

		/* Joint modules */
		translate([0, (wall_total_h / 2), joint_z])
			joint_modules();
	}
}

if (part == "assembly")
{
	assembly();
}
else if (part == "joint_base")
{
	joint_base();
}
else if (part == "joint_modules")
{
	joint_modules();
}
else if (part == "shelf")
{
	shelf();
}
else if (part == "wall")
{
	wall();
}
else if (part == "wall_middle")
{
	wall_middle();
}
