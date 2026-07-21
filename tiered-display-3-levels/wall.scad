include <common.scad>
include <config.scad>

wall_total_l = shelf_d * 3;
wall_total_h = shelf_h_sep * 3;

module wall_common()
{
	difference()
	{
		union()
		{
			/* main horizontal */
			translate([0, 0, -(wall_total_h / 2) + (wall_t / 2)])
				color(color_wall)
					cube([wall_total_l, wall_t, wall_t], center=true);

			/* main vertical */
			translate([-(wall_total_l / 2) + (wall_t / 2), 0, 0])
				color(color_wall)
					cube([wall_t, wall_t, wall_total_h], center=true);

			/* shelf 1 vertical */
			translate([(wall_total_l / 2) - (wall_t / 2), 0, -(shelf_h_sep)])
				color(color_wall)
					cube([wall_t, wall_t, shelf_h_sep], center=true);

			/* shelf 1 horizontal */
			translate([(wall_total_l / 2) - ((shelf_d + wall_t) / 2), 0, -(shelf_h_sep / 2) - (wall_t / 2)])
				color(color_wall)
					cube([shelf_d + wall_t, wall_t, wall_t], center=true);

			/* shelf 2 vertical */
			translate([(shelf_d / 2) - (wall_t / 2), 0, 0])
				color(color_wall)
					cube([wall_t, wall_t, shelf_h_sep], center=true);

			/* shelf 2 horizontal */
			translate([-(wall_t / 2), 0, (shelf_h_sep / 2) - (wall_t / 2)])
				color(color_wall)
					cube([shelf_d + wall_t, wall_t, wall_t], center=true);

			/* shelf 3 vertical */
			translate([-(shelf_d / 2) - (wall_t / 2), 0, +(shelf_h_sep)])
				color(color_wall)
					cube([wall_t, wall_t, shelf_h_sep], center=true);

			/* shelf 3 horizontal */
			translate([-shelf_d, 0, (wall_total_h / 2) - (wall_t / 2)])
				color(color_wall)
					cube([shelf_d, wall_t, wall_t], center=true);
		}

		/* Shelf 1 dovetail */
		translate([
			-(shelf_d / 2) + eps,
			0,
			(wall_total_h / 2) + eps
		])
			rotate([0, 0, 90])
				color(color_test)
					dovetail(
						length = shelf_dovetail_len + clearance + eps,
						depth = joint_depth + clearance + eps,
						neck = joint_neck + 2 * clearance,
						head = joint_head + 2 * clearance
					);

		/* Shelf 2 dovetail */
		translate([
			(shelf_d * 3 / 2) + eps,
			0,
			-(shelf_h_sep / 2) + eps
		])
			rotate([0, 0, 90])
				color(color_test)
					dovetail(
						length = shelf_dovetail_len + clearance + eps,
						depth = joint_depth + clearance + eps,
						neck = joint_neck + 2 * clearance,
						head = joint_head + 2 * clearance
					);

		/* Shelf 3 dovetail */
		translate([
			(shelf_d / 2) + eps,
			0,
			(shelf_h_sep / 2) + eps
		])
			rotate([0, 0, 90])
				color(color_test)
					dovetail(
						length = shelf_dovetail_len + clearance + eps,
						depth = joint_depth + clearance + eps,
						neck = joint_neck + 2 * clearance,
						head = joint_head + 2 * clearance
					);

		/* Base dovetail 1 */
		translate([
			0,
			(wall_t / 2) + eps,
			-(wall_total_h / 2) + wall_t + eps
		])
			rotate([270, 0, 0])
				color(color_test)
					dovetail(
						length = wall_dovetail_len + clearance + eps,
						depth = joint_depth + clearance + eps,
						neck = joint_neck + 2 * clearance,
						head = joint_head + 2 * clearance
					);
	}
}

module wall()
{
	difference()
	{
		/* Wall */
		wall_common();

		/* Base dovetail 2 */
		translate([
			0,
			-(wall_t / 2) - eps,
			-(wall_total_h / 2) + wall_t + eps
		])
			rotate([90, 180, 0])
				color(color_test)
					dovetail(
						length = wall_dovetail_len + clearance + eps,
						depth = joint_depth + clearance + eps,
						neck = joint_neck + 2 * clearance,
						head = joint_head + 2 * clearance
					);
	}
}


module wall_middle()
{
	shelf_y = -(wall_t + (clearance / 2));

	difference()
	{
		union()
		{
			wall_common();

			/* shelf 1 horizontal */
			translate([(wall_total_l / 2) - ((shelf_d + wall_t) / 2), shelf_y, -(shelf_h_sep / 2) - (wall_t / 2)])
				color(color_wall)
					cube([shelf_d + wall_t, wall_t + clearance, wall_t], center=true);

			/* shelf 2 horizontal */
			translate([-(wall_t / 2), shelf_y, (shelf_h_sep / 2) - (wall_t / 2)])
				color(color_wall)
					cube([shelf_d + wall_t, wall_t + clearance, wall_t], center=true);

			/* shelf 3 horizontal */
			translate([-shelf_d, shelf_y, (wall_total_h / 2) - (wall_t / 2)])
				color(color_wall)
					cube([shelf_d, wall_t + clearance, wall_t], center=true);

			/* Base 2 */
			translate([0, -wall_t, -(wall_total_h / 2) + (wall_t / 2)])
				color(color_wall)
					cube([wall_t * 2, wall_t + (clearance * 2), wall_t], center=true);
		}

		/* Shelf 1 dovetail */
		translate([
			-(shelf_d / 2) + eps,
			-(wall_t + clearance),
			(wall_total_h / 2) + eps
		])
			rotate([0, 0, 90])
				color(color_test)
					dovetail(
						length = shelf_dovetail_len + clearance + eps,
						depth = joint_depth + clearance + eps,
						neck = joint_neck + 2 * clearance,
						head = joint_head + 2 * clearance
					);

		/* Shelf 2 dovetail */
		translate([
			(shelf_d * 3 / 2) + eps,
			-(wall_t + clearance),
			-(shelf_h_sep / 2) + eps
		])
			rotate([0, 0, 90])
				color(color_test)
					dovetail(
						length = shelf_dovetail_len + clearance + eps,
						depth = joint_depth + clearance + eps,
						neck = joint_neck + 2 * clearance,
						head = joint_head + 2 * clearance
					);

		/* Shelf 3 dovetail */
		translate([
			(shelf_d / 2) + eps,
			-(wall_t + clearance),
			(shelf_h_sep / 2) + eps
		])
			rotate([0, 0, 90])
				color(color_test)
					dovetail(
						length = shelf_dovetail_len + clearance + eps,
						depth = joint_depth + clearance + eps,
						neck = joint_neck + 2 * clearance,
						head = joint_head + 2 * clearance
					);

		/* Base dovetail 2 */
		translate([
			0,
			-(wall_t + clearance) -(wall_t / 2) - eps,
			-(wall_total_h / 2) + wall_t + eps
		])
			rotate([90, 180, 0])
				color(color_test)
					dovetail(
						length = wall_dovetail_len + clearance + eps,
						depth = joint_depth + clearance + eps,
						neck = joint_neck + 2 * clearance,
						head = joint_head + 2 * clearance
					);
	}
}
