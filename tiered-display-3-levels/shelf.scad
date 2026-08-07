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
	sw_l = shelf_w;
	sw_h = shelf_h_sep;
	sw_thick = thickness;

	rotate([0, 0, 0])
		color(color_stand)
			sparse_wall(h=sw_h, l=sw_l, thick=sw_thick, strut=sw_strut, maxang=sw_max_ang, max_bridge=sw_max_bridge, frame=[true, false]);
}
