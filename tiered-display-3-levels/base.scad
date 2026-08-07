include <config.scad>

base_l = shelf_d * 3;
base_w = shelf_w;
base_h = thickness;

module base()
{
	hp_w = base_w;
	hp_h = base_l;
	hp_t = base_h;

	rotate([0, 0, 90])
		color(color_base)
			hex_panel([hp_w, hp_h, hp_t], strut=hp_strut, spacing=hp_spacing, frame=hp_frame);
}
