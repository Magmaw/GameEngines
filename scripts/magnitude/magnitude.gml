// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function magnitude(x, y)
{
	x = abs(x);
	y = abs(y);
	return sqrt(x * x + y * y);
}

function normalize(x1, y1)
{
	mag = magnitude(x1, y1);
	return
	{
		x: x1 / mag,
		y: y1 / mag
	};
}