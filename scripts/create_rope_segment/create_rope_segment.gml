// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_rope_segment(x, y)
{
	rope_segment = 
	{
		x_now: x,
		y_now: y,
		x_old: x,
		y_old: y
	};
	
	return rope_segment;
}

function copy_rope_segment(segment)
{
	rope_segment = segment;
	
	return rope_segment;
}