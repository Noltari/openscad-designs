include <config.scad>

wall_l = thickness;
wall_w = shelf_w;
wall_h = shelf_h_sep * 3;

module wall(height)
{
	hp_w = wall_w;
	hp_h = wall_h;
	hp_t = wall_l;

	rotate([90, 0, 90])
		color(color_wall)
			hex_panel([hp_w, hp_h, hp_t], strut=hp_strut, spacing=hp_spacing, frame=hp_frame);
}
