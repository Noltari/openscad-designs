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
	hp_w = shelf_w;
	hp_h = shelf_h_sep;
	hp_t = thickness;

	rotate([90, 0, 90])
		color(color_stand)
			hex_panel([hp_w, hp_h, hp_t], strut=hp_strut, spacing=hp_spacing, frame=hp_frame);
}
