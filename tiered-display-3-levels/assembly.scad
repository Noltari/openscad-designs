include <config.scad>
include <shelf.scad>
include <wall.scad>

module assembly()
{
	// TODO: assembly
}

module print()
{
	// TODO: print
}

if (part == "assembly")
	assembly();
else if (part == "print")
	print();
else if (part == "shelf")
	shelf();
else if (part == "wall")
	wall();
