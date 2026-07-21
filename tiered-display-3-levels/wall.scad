include <config.scad>

wall_l = thickness;
wall_w = shelf_w;
wall_h = shelf_h_sep * 3;

module wall(height)
{
	color(color_wall)
		cube([wall_l, wall_w, wall_h], center=true);
}
