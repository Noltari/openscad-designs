// Tiered 3 level display for Funkos

eps = 0.1;

shelf_d = 80;
shelf_w = 240;
shelf_h = 6;
shelf_h_sep = 80;

wall_d = shelf_d;
wall_w = 8;
wall_cut = 25;

stand_w = shelf_h;

module shelf()
{
	st_l = shelf_d;
	st_w = shelf_w;
	st_h = shelf_h;

	cube([st_l, st_w, st_h], center=true);
}

module wall(wall_h)
{
	wall_l = wall_d;

	top_x = wall_l / 2 + eps;
	top_y = wall_h / 2 - shelf_h + eps;

	difference() {
		cube([wall_l, wall_w, wall_h], center=true);

		rotate([90, 0, 0])
			linear_extrude(
				height = wall_w + 2 * eps,
				center = true
			)
				polygon(points = [
					[top_x, top_y],
					[wall_l / 2 - wall_cut, wall_h / 2 - shelf_h_sep - eps],
					[top_x, wall_h / 2 - shelf_h_sep]
				]);
	}
}

module shelves()
{
	s1_off_l = (shelf_d / 2);
	s1_off_w = (shelf_w / 2);
	s1_off_h = -(shelf_h / 2) + (shelf_h_sep * 3);

	s2_off_l = (shelf_d / 2) + shelf_d;
	s2_off_w = (shelf_w / 2);
	s2_off_h = -(shelf_h / 2) + (shelf_h_sep * 2);

	s3_off_l = (shelf_d / 2) + (shelf_d * 2);
	s3_off_w = (shelf_w / 2);
	s3_off_h = -(shelf_h / 2) + shelf_h_sep;

	union()
	{
		translate([s1_off_l, s1_off_w, s1_off_h])
			shelf();
		translate([s2_off_l, s2_off_w, s2_off_h])
			shelf();
		translate([s3_off_l, s3_off_w, s3_off_h])
			shelf();
	}
}

module wall_comb()
{
	w1_h = 240;
	w2_h = w1_h - shelf_h_sep;
	w3_h = w2_h - shelf_h_sep;

	w1_off_l = (wall_d / 2);
	w1_off_w = 0;
	w1_off_h = (w1_h / 2);

	w2_off_l = shelf_d + (wall_d / 2);
	w2_off_w = 0;
	w2_off_h = (w2_h / 2);

	w3_off_l = (shelf_d * 2) + (wall_d / 2);
	w3_off_w = 0;
	w3_off_h = (w3_h / 2);

	d1_off_l = wall_w;
	d1_off_w = -(wall_w / 2) - eps;
	d1_off_h = wall_w + (w1_h / 2) - (shelf_d / 2);

	d2_off_l = shelf_h_sep + wall_w;
	d2_off_w = -(wall_w / 2) - eps;
	d2_off_h = wall_w;

	d3_off_l = wall_w;
	d3_off_w = -(wall_w / 2) - eps;
	d3_off_h = wall_w;

    difference() {
        union()
        {
            translate([w1_off_l, w1_off_w, w1_off_h])
                wall(w1_h);
            translate([w2_off_l, w2_off_w, w2_off_h])
                wall(w2_h);
            translate([w3_off_l, w3_off_w, w3_off_h])
                wall(w3_h);
        }
    }
}

module wall_hole(hole_l, hole_h_add)
{
    rotate([90, 0, 0])
        linear_extrude(
            height = wall_w + 2 * eps,
            center = true
        )
            polygon(points = [
                [stand_w, shelf_h_sep - stand_w],
                [stand_w, stand_w - hole_h_add],
                [hole_l - stand_w - wall_cut, stand_w - hole_h_add],
                [hole_l - stand_w - shelf_h / 2, shelf_h_sep - stand_w]
            ]);
}

module wall_holes()
{
    h1_w = shelf_w;
    h2_w = h1_w - shelf_h_sep;
    h3_w = h2_w - shelf_h_sep;

    h1_off_h = 0;
    h2_off_h = shelf_h_sep;
    h3_off_h = shelf_h_sep * 2;

    difference()
    {
        wall_comb();

        translate([0, 0, 0])
            wall_hole(h1_w, 0);
        translate([0, 0, h2_off_h])
            wall_hole(h2_w, stand_w);
        translate([0, 0, h3_off_h])
            wall_hole(h3_w, stand_w);
    }
}

module walls()
{
	union()
	{
		translate([0, (wall_w / 2), 0])
			wall_holes();
		translate([0, shelf_w - (wall_w / 2), 0])
			wall_holes();
	}
}

module funko_display()
{
    translate([shelf_d * 3 / 2, -shelf_w / 2, 0])
        rotate([0, -90, 0])
            union()
            {
                shelves();
                walls();
            }
}

funko_display();
