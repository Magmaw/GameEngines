player = instance_nearest(x, y, obj_Player);

if (mouse_check_button_pressed(mb_left))
{
	if (hook_held_by_player)
	{
		hook_held_by_player = false;
		throw_direction = normalize(mouse_x - x, mouse_y - y);
		speed_due_to_gravity = throw_speed * throw_direction.y;
		velocity_x = throw_speed * throw_direction.x;
	}
	else
	{
		speed_due_to_gravity = 0;
		velocity_x = 0;
		hook_held_by_player = true;
		hook_attached = false;
	}
}

if (hook_held_by_player)
{
	x = player.hand_x;
	y = player.hand_y;
}
else if (!hook_attached)
{
	speed_due_to_gravity -= gravity_speed;
	if (speed_due_to_gravity > terminal_velocity)
	{
		speed_due_to_gravity = terminal_velocity;
	}
	
	velocity_x *= velocity_x_decay;
	if (abs(velocity_x) < 0.05)
	{
		velocity_x = 0.0;
	}
	
	y += speed_due_to_gravity;
	x += velocity_x;
	
}

var start_pos_x = player.hand_x;
var start_pos_y = player.hand_y;

var end_pos_x = x;
var end_pos_y = y;

for (var i = 1; i < num_segments; i++)
{
	delta_x = rope_segments[i].x_now - rope_segments[i].x_old;
	delta_y = rope_segments[i].y_now - rope_segments[i].y_old;
	
	rope_segments[i].x_old = rope_segments[i].x_now;
	rope_segments[i].y_old = rope_segments[i].y_now;
	
	rope_segments[i].x_now += delta_x;
	rope_segments[i].y_now += delta_y;
	
	rope_segments[i].y_now -= rope_gravity;
}

for (var k = 0; k < num_constraint_sims; k++)
{
	rope_segments[0].x_now = start_pos_x;
	rope_segments[0].y_now = start_pos_y;
	rope_segments[num_segments - 1].x_now = end_pos_x;
	rope_segments[num_segments - 1].y_now = end_pos_y;
	
	for (var j = 0; j < num_segments - 1; j++)
	{
		//var x_dist = rope_segments[j].x_now - rope_segments[j + 1].x_now;
		//var y_dist = rope_segments[j].y_now - rope_segments[j + 1].y_now;
		//var distance = sqrt(x_dist * x_dist + y_dist * y_dist);
		var distance = magnitude(rope_segments[j].x_now - rope_segments[j + 1].x_now, 
			rope_segments[j].y_now - rope_segments[j + 1].y_now);
		var error = distance - segment_length;
		if (error < 0)
		{
			error = -error;
		}
		
		var change_direction_x = 0;
		var change_direction_y = 0;
		
		if (distance > segment_length)
		{
			//change_direction_x = sqrt(x_dist * x_dist + y_dist * y_dist);
			//change_direction = normalize(rope_segments[j].x_now - rope_segments[j + 1].x_now, y_dist);
			change_direction_x = (rope_segments[j].x_now - rope_segments[j + 1].x_now) / distance;
			change_direction_y = (rope_segments[j].y_now - rope_segments[j + 1].y_now) / distance;
		}
		else if (distance > segment_length)
		{
			change_direction_x = (rope_segments[j + 1].x_now - rope_segments[j].x_now) / distance;
			change_direction_y = (rope_segments[j + 1].y_now - rope_segments[j].y_now) / distance;
		}
		
		var change_amount_x = change_direction_x * error;
		var change_amount_y = change_direction_y * error;
		
		if (j != 0)
		{
			rope_segments[j].x_now -= change_amount_x * 0.5;
			rope_segments[j].y_now -= change_amount_y * 0.5;
			
			rope_segments[j + 1].x_now += change_amount_x * 0.5;
			rope_segments[j + 1].y_now += change_amount_y * 0.5;
		}
		else
		{
			rope_segments[j + 1].x_now += change_amount_x;
			rope_segments[j + 1].y_now += change_amount_y;
		}
	}
}


if (!hook_held_by_player)
{
	rope_vel_x *= 0.6;
	rope_vel_y *= 0.6;
	
	current_vel_x = player.x - player.xprevious;
	current_vel_y = player.y - player.yprevious;
	extrapolated_pos_x = player.x + current_vel_x + rope_vel_x * 0.99;
	extrapolated_pos_y = player.y + current_vel_y + rope_vel_y * 0.99;
	
	distance_from_hook = magnitude(rope_segments[num_segments - 1].x_now - extrapolated_pos_x, rope_segments[num_segments - 1].y_now - extrapolated_pos_y);
	
	if (distance_from_hook > rope_length_invis)
	{
		test_pos = normalize(extrapolated_pos_x - rope_segments[num_segments - 1].x_now, extrapolated_pos_y - rope_segments[num_segments - 1].y_now);
		new_pos_x = test_pos.x * rope_length_invis + rope_segments[num_segments - 1].x_now;
		new_pos_y = test_pos.y * rope_length_invis + rope_segments[num_segments - 1].y_now;
		
		rope_vel_x += (new_pos_x - player.x) * 0.7;
		rope_vel_y += (new_pos_y - player.y) * 0.7;
		
		//draw_circle(new_pos_x, new_pos_y, 5, false);
		player.x = new_pos_x;
		player.y = new_pos_y;
	}
}




instance = collision_rectangle(x - 2, y, x + 2, y + 1, obj_Platform, true, false);
if (!hook_held_by_player && instance != noone && instance != obj_Player)
{
	hook_attached = true;
}