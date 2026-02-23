// Wall mount tray for Banana Pi BPI-R4
// https://docs.banana-pi.org/en/BPI-R4

include <bpi-r4-board.scad>

$fn = 100;
diff_margin = 0.1;
fan_off = 20;
print_margin = 0.2;

case_h = 10;

/*
translate([bpi_r4_l / 2, bpi_r4_w / 2, bpi_r4_h / 2])
	bpi_r4_board($preview);
*/

function hex_R(af) = af / sqrt(3);

module hex_prism(af, h)
{
	R = hex_R(af);
	cylinder(h=h, r=R, $fn=6, center=true);
}

module nut_M2p5()
{
	across_flats = 5;
	thickness = 2;

	hex_prism(across_flats, thickness);
}

module nut_M4()
{
	across_flats = 7;
	thickness = 4;

	hex_prism(across_flats, thickness);
}

module screw_wall(screw_h)
{
	in_d = 9 + print_margin;
	in_h = screw_h + diff_margin;

	out_d = 14;
	out_h = screw_h;

	difference()
	{
		cylinder(h=out_h, d=out_d, center=true);
		cylinder(h=in_h, d=in_d, center=true);
	}
}

module screw_stand(screw_h)
{
	in_d = 2.3 + print_margin;
	in_h = screw_h + diff_margin;

	out_d = 7;
	out_h = screw_h;

	difference()
	{
		cylinder(h=out_h, d=out_d, center=true);
		cylinder(h=in_h, d=in_d, center=true);
	}
}

module tray_basic()
{
	out_ext = 10;

	in_l = bpi_r4_l + print_margin;
	in_w = bpi_r4_w + print_margin;
	in_h = bpi_r4_pcie_h + print_margin;

	out_l = bpi_r4_l + out_ext;
	out_w = bpi_r4_w + out_ext;
	out_h = case_h;

	s_h = out_h - bpi_r4_h;

	screw_d = 2.3 + print_margin;
	screw_h = s_h + diff_margin;

	stand_h = s_h;

	n_off_h = case_h - 2 / 2 + diff_margin / 2;
	s_off_h = screw_h / 2 + bpi_r4_h - diff_margin / 2;

	s1_off_l = 3.5;
	s1_off_w = bpi_r4_w - 73 - 3.5;

	s2_off_l = bpi_r4_l - 3.5;
	s2_off_w = bpi_r4_w - 73 - 3.5;

	s3_off_l = 3.5;
	s3_off_w = bpi_r4_w - 3.5;

	s4_off_l = bpi_r4_l - 3.5;
	s4_off_w = bpi_r4_w - 3.5;

	difference()
	{
		union()
		{
			difference()
			{
				translate([bpi_r4_l / 2, bpi_r4_w / 2, 0])
					difference()
					{
						translate([0, 0, out_h / 2])
							cube([out_l, out_w, out_h], center=true);
						translate([0, 0, in_h / 2 - diff_margin])
							cube([in_l, in_w, in_h], center=true);
					}

				translate([s1_off_l, s1_off_w, s_off_h])
					cylinder(h=screw_h, d=screw_d, center=true);
				translate([s2_off_l, s2_off_w, s_off_h])
					cylinder(h=screw_h, d=screw_d, center=true);
				translate([s3_off_l, s3_off_w, s_off_h])
					cylinder(h=screw_h, d=screw_d, center=true);
				translate([s4_off_l, s4_off_w, s_off_h])
					cylinder(h=screw_h, d=screw_d, center=true);
			}

			translate([s1_off_l, s1_off_w, s_off_h])
				screw_stand(stand_h);
			translate([s2_off_l, s2_off_w, s_off_h])
				screw_stand(stand_h);
			translate([s3_off_l, s3_off_w, s_off_h])
				screw_stand(stand_h);
			translate([s4_off_l, s4_off_w, s_off_h])
				screw_stand(stand_h);
		}

		translate([s1_off_l, s1_off_w, n_off_h])
			nut_M2p5();
		translate([s2_off_l, s2_off_w, n_off_h])
			nut_M2p5();
		translate([s3_off_l, s3_off_w, n_off_h])
			nut_M2p5();
		translate([s4_off_l, s4_off_w, n_off_h])
			nut_M2p5();
	}
}

module m2_hole()
{
	l_off = 7;
	w_off = 11.5;

	m2_l = 23 + print_margin;
	m2_w = 81 + print_margin;
	m2_h = bpi_r4_pcie_h + diff_margin;

	m2_off_l = l_off + m2_l / 2;
	m2_off_w = w_off + m2_w / 2;
	m2_off_h = m2_h;

	translate([m2_off_l, m2_off_w, m2_off_h])
		cube([m2_l, m2_w, m2_h], center=true);
}

module mpcie_hole()
{
	l_off = 87.5;
	w_off = 27;

	mpcie_l = 49 + print_margin;
	mpcie_w = 64.5 + print_margin;
	mpcie_h = bpi_r4_pcie_h + diff_margin;

	mpcie_off_l = l_off + mpcie_l / 2;
	mpcie_off_w = w_off + mpcie_w / 2;
	mpcie_off_h = mpcie_h;

	mpcie_ant_l = 1.25;
	mpcie_ant_w = 2.75;
	mpcie_ant_h = bpi_r4_pcie_h + print_margin;

	mpcie_ant_off_l = bpi_r4_l + mpcie_ant_l / 2;
	mpcie_ant_off_w = w_off + mpcie_w / 2;
	mpcie_ant_off_h = mpcie_h - mpcie_ant_h / 2;

	union()
	{
		translate([mpcie_off_l, mpcie_off_w, mpcie_off_h])
			cube([mpcie_l, mpcie_w, mpcie_h], center=true);

		translate([mpcie_ant_off_l, mpcie_ant_off_w, mpcie_ant_off_h])
			cube([mpcie_ant_l, mpcie_ant_w, mpcie_ant_h], center=true);
	}
}

module tray_holes()
{
	union()
	{
		m2_hole();
		mpcie_hole();
	}
}

module tray()
{
	union()
	{
		difference()
		{
			tray_basic();
			tray_holes();
		}

		swu_h = 5;
		swu_pad = 20;
		swu_off_l = bpi_r4_l + 9.75;
		swu_off_h = case_h - swu_h / 2;
		swu1_off_w = bpi_r4_w / 2;
		swu2_off_w = bpi_r4_w / 2 + swu_pad;
		swu3_off_w = bpi_r4_w / 2 - swu_pad;

		translate([swu_off_l, swu1_off_w, swu_off_h])
			screw_wall(swu_h);
		translate([swu_off_l, swu2_off_w, swu_off_h])
			screw_wall(swu_h);
		translate([swu_off_l, swu3_off_w, swu_off_h])
			screw_wall(swu_h);
	}
}

module fan_tray()
{
	fan_d = 37;
	fan_lw = 40;
	fan_h = 10;
	out_ext = 5;

	in_l = fan_lw + print_margin;
	in_w = fan_lw + print_margin;
	in_h = fan_h + print_margin;

	out_l = fan_lw + out_ext;
	out_w = fan_lw + out_ext;
	out_h = fan_h + out_ext;

	cyl_d = fan_d;
	cyl_h = out_h + diff_margin;

	screw_d = 3.8;
	screw_lw = 16;
	screw_h = cyl_h;

	nut_off_h =  screw_h - 1;

	translate([0, 0, -out_h])
		difference()
		{
			translate([0, 0, out_h / 2])
				cube([out_l, out_w, out_h], center=true);

			translate([0, 0, in_h / 2 - diff_margin])
				cube([in_l, in_w, in_h], center=true);

			translate([0, 0, cyl_h / 2])
				cylinder(h=cyl_h, d=cyl_d, center=true);

			translate([screw_lw, screw_lw, screw_h / 2])
				cylinder(h=screw_h, d=screw_d, center=true);
			translate([-screw_lw, screw_lw, screw_h / 2])
				cylinder(h=screw_h, d=screw_d, center=true);
			translate([screw_lw, -screw_lw, screw_h / 2])
				cylinder(h=screw_h, d=screw_d, center=true);

			translate([screw_lw, screw_lw, nut_off_h])
				nut_M4();
			translate([-screw_lw, screw_lw, nut_off_h])
				nut_M4();
			translate([screw_lw, -screw_lw, nut_off_h])
				nut_M4();

			wire_l = 2.5;
			wire_w = 3;
			wire_h = 5;

			wire_off_l = -fan_lw / 2 - wire_l / 2 - diff_margin / 2;
			wire_off_w = -fan_lw / 2 + 8;
			wire_off_h = wire_h / 2 - diff_margin;

			translate([wire_off_l, wire_off_w, wire_off_h])
				cube([wire_l, wire_w, wire_h], center=true);
		}
}

module fan_stands()
{
	vs1_l = 5 - diff_margin;
	vs1_w = 5;
	vs1_h = fan_off + 15 + 10;
	vs1_off_l = bpi_r4_l + vs1_l / 2 + diff_margin;
	vs1_off_h = 10 - (vs1_h / 2);
	vs1_off_w = 28.5 + vs1_w / 2;

	hs1_l = 20 - 1.6;
	hs1_w = vs1_w;
	hs1_h = 15;
	hs1_off_l = bpi_r4_l - hs1_l / 2 + 5;
	hs1_off_h = -(hs1_h / 2 + fan_off);
	hs1_off_w = vs1_off_w;

	vs2_l = 10;
	vs2_w = 5 - diff_margin;
	vs2_h = fan_off + 5 + 10 - diff_margin;
	vs2_off_l = 91;
	vs2_off_h = 10 - (vs2_h / 2);
	vs2_off_w = -(vs2_w / 2 + diff_margin);

	vs3_l = 8.4;
	vs3_w = 5 - diff_margin;
	vs3_h = fan_off + 15 + 10;
	vs3_off_l = 86 + vs3_l / 2;
	vs3_off_h = 10 - (vs3_h / 2);
	vs3_off_w = -(vs2_w / 2 + diff_margin);

	vs4_l = 5;
	vs4_w = 5 - diff_margin;
	vs4_h = fan_off + 15 + 10;
	vs4_off_l = 112.5;
	vs4_off_h = 10 - (vs4_h / 2);
	vs4_off_w = bpi_r4_w + (vs4_w / 2) + diff_margin;

	hs2_l = vs4_l;
	hs2_w = 69.4;
	hs2_h = 15;
	hs2_off_l = vs4_off_l;
	hs2_off_h = -(hs2_h / 2 + fan_off);
	hs2_off_w = bpi_r4_w - hs2_w / 2 + vs4_w + diff_margin;

	ant_h = 5 + diff_margin;
	ant_d = 6.2;
	ant_pad = 12.5;

	ant1_off_l = hs2_off_l;
	ant1_off_w = hs2_off_w + ant_pad;
	ant1_off_h = hs2_off_h;

	ant2_off_l = hs2_off_l;
	ant2_off_w = hs2_off_w - ant_pad;
	ant2_off_h = hs2_off_h;

	difference()
	{
		union()
		{
			translate([vs1_off_l, vs1_off_w, vs1_off_h])
				cube([vs1_l, vs1_w, vs1_h], center=true);
			translate([hs1_off_l, hs1_off_w, hs1_off_h])
				cube([hs1_l, hs1_w, hs1_h], center=true);

			translate([vs2_off_l, vs2_off_w, vs2_off_h])
				cube([vs2_l, vs2_w, vs2_h], center=true);
			translate([vs3_off_l, vs3_off_w, vs3_off_h])
				cube([vs3_l, vs3_w, vs3_h], center=true);

			translate([vs4_off_l, vs4_off_w, vs4_off_h])
				cube([vs4_l, vs4_w, vs4_h], center=true);
			translate([hs2_off_l, hs2_off_w, hs2_off_h])
				cube([hs2_l, hs2_w, hs2_h], center=true);


		}

		translate([ant1_off_l, ant1_off_w, ant1_off_h])
			rotate([0, 90, 0])
				cylinder(h=ant_h, d=ant_d, center=true);
		translate([ant2_off_l, ant2_off_w, ant2_off_h])
			rotate([0, 90, 0])
				cylinder(h=ant_h, d=ant_d, center=true);
	}
}

module fan()
{
	union()
	{
		l_off = 114.5;
		w_off = 16;
		h_off = fan_off;

		translate([l_off, w_off, - h_off])
			fan_tray();
		fan_stands();
	}
}

module tray_fan()
{
	union()
	{
		tray();
		fan();
	}
}

tray_fan();
