include <config.scad>

wall_l = thickness;
wall_w = shelf_w;
wall_h = shelf_h_sep * 3;

module wall(height)
{
	color(color_wall)
		sparse_cuboid([wall_l, wall_w, wall_h], maxang=sc_max_ang, max_bridge=sc_max_bridge, strut=sc_strut);
}
