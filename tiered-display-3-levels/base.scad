include <config.scad>

base_l = shelf_d * 3;
base_w = shelf_w;
base_h = thickness;

module base()
{
	color(color_base)
		cube([base_l, base_w, base_h], center=true);
}
