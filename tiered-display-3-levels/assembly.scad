include <base.scad>
include <shelf.scad>
include <wall.scad>

module shelves()
{
	union()
	{
		translate([shelf_d, 0, (shelf_h_sep * 1) - (thickness / 2)])
			shelf();
		translate([shelf_d + (shelf_d / 2) - (thickness / 2), 0, (shelf_h_sep / 2)])
			shelf_stand();

		translate([0, 0, (shelf_h_sep * 2) - (thickness / 2)])
			shelf();
		translate([(shelf_d / 2) - (thickness / 2), 0, shelf_h_sep + (shelf_h_sep / 2) - thickness])
			shelf_stand();

		translate([-shelf_d, 0, (shelf_h_sep * 3) - (thickness / 2)])
			shelf();
		translate([-shelf_d + (shelf_d / 2) - (thickness / 2), 0, (shelf_h_sep * 2) + (shelf_h_sep / 2) - thickness])
			shelf_stand();
	}
}

module walls()
{
	union()
	{
		translate([0, 0, (base_h / 2)])
			base();
		translate([(thickness / 2) - (base_l / 2), 0, (wall_h / 2)])
			wall();
	}
}

module assembly()
{
	union()
	{
		shelves();
		walls();
	}
}

module print()
{
	rotate([90, 0, 0])
		translate([0, 0, -wall_h / 2])
			color(color_print)
				assembly();
}

if (part == "assembly")
{
	assembly();
}
else if (part == "base")
{
	base();
}
else if (part == "print")
{
	print();
}
else if (part == "shelf")
{
	shelf();
}
else if (part == "wall")
{
	wall();
}
