include <config.scad>

base_l = shelf_d * 3;
base_w = shelf_w;
base_h = thickness;

module base()
{
	color(color_base)
		sparse_cuboid([base_l, base_w, base_h], "Z", maxang=sc_max_ang, max_bridge=sc_max_bridge, strut=sc_strut);
}
