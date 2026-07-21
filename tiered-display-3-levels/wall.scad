include <config.scad>

module wall()
{
	st_l = shelf_d;
	st_w = shelf_w;
	st_h = shelf_h;

	cube([st_l, st_w, st_h], center=true);
}
