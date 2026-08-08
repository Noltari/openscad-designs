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
		sparse_cuboid([c_l, c_w, c_h], maxang=sc_max_ang, max_bridge=sc_max_bridge, strut=sc_strut);
}
