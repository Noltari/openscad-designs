include <config.scad>

module shelf()
{
	c_l = shelf_d;
	c_w = shelf_w;
	c_h = thickness;

	color(color_shelf)
		cube([c_l, c_w, c_h], center=true);
}

module shelf_stand()
{
	c_l = thickness;
	c_w = shelf_w;
	c_h = shelf_h_sep;

	color(color_stand)
		cube([c_l, c_w, c_h], center=true);
}
