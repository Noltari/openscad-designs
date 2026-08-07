include <config.scad>

wall_l = thickness;
wall_w = shelf_w;
wall_h = shelf_h_sep * 3;

module wall(height)
{
	sw_l = wall_w;
	sw_h = wall_h;
	sw_thick = wall_l;

	rotate([0, 0, 0])
		color(color_wall)
			sparse_wall(h=sw_h, l=sw_l, thick=sw_thick, strut=sw_strut, maxang=sw_max_ang, max_bridge=sw_max_bridge, frame=[true, false]);
}
