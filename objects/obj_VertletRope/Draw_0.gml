/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i < num_segments - 1; i++)
{
	draw_line_width_color(rope_segments[i].x_now, rope_segments[i].y_now, rope_segments[i + 1].x_now, 
	rope_segments[i + 1].y_now, rope_width, c_white, c_white);
}

draw_self();

///endpoint_angle = point_direction(rope_segments[0].x_now, rope_segments[0].y_now, rope_segments[num_segments - 1].x_now, rope_segments[num_segments - 1].y_now);


////draw_circle(rope_segments[0].x_now, rope_segments[0].y_now, rope_length, true);
//arctan2()
//draw_line(rope_segments[0].x_now, rope_segments[0].y_now, rope_segments[num_segments - 1].x_now, rope_segments[num_segments - 1].y_now);


//player = instance_nearest(x, y, obj_Player);

//current_vel_x = player.x - player.xprevious;
//current_vel_y = player.y - player.yprevious;
//extrapolated_pos_x = player.x + current_vel_x;
//extrapolated_pos_y = player.y + current_vel_y;

//distance_from_hook = magnitude(rope_segments[num_segments - 1].x_now - extrapolated_pos_x, rope_segments[num_segments - 1].y_now - extrapolated_pos_y);

//if (distance_from_hook > rope_length)
//{
	
//	test_pos = normalize(extrapolated_pos_x - rope_segments[num_segments - 1].x_now, extrapolated_pos_y - rope_segments[num_segments - 1].y_now);
//	new_pos_x = test_pos.x * rope_length + rope_segments[num_segments - 1].x_now;
//	new_pos_y = test_pos.y * rope_length + rope_segments[num_segments - 1].y_now;
	
//	draw_circle(new_pos_x, new_pos_y, 5, false);
//}