include <config.scad>

module dovetail(length,
	depth,
	neck,
	head)
{
	rotate([-90, 0, 0])
		linear_extrude(height = length, convexity = 10)
			polygon(points = [
				[-neck / 2, 0],
				[-head / 2, depth],
				[ head / 2, depth],
				[ neck / 2, 0]
			]);
}
