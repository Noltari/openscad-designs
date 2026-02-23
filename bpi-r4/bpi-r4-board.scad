// Banana Pi BPI-R4 board
// https://docs.banana-pi.org/en/BPI-R4

bpi_r4_l = 148;
bpi_r4_w = 100.5;
bpi_r4_h = 1.4;

bpi_r4_pcie_h = bpi_r4_h + 5.4;

module bpi_r4_board(show, color="blue")
{
	if (show)
	{
		color(color)
			cube([bpi_r4_l, bpi_r4_w, bpi_r4_h], center=true);
	}
}
