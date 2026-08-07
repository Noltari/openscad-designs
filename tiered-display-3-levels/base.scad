include <config.scad>

base_l = shelf_d * 3;
base_w = shelf_w;
base_h = thickness;

module base()
{
	sw_l = base_w;
	sw_h = base_l;
	sw_thick = base_h;

	rotate([0, 90, 0])
		color(color_base)
			sparse_wall(h=sw_h, l=sw_l, thick=sw_thick, strut=sw_strut, maxang=sw_max_ang, max_bridge=sw_max_bridge, frame=[true, false]);
}
