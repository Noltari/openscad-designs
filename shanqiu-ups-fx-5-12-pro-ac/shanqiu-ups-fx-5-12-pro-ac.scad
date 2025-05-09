// Wall mount corner for Shanqiu UPS FX 5-12Pro-AC
// https://hgdups.com/product-13896-13942-36287.html

ups_depth = 32;
ups_height = 178;
ups_width = 121;

ups_depth_h = ups_depth / 2;
ups_height_h = ups_height / 2;
ups_width_h = ups_width / 2;

module shanqiu_ups(show, color="blue") {
	if (show) {
		color(color) cube([ups_height, ups_depth, ups_width], center=true);
	}
}
