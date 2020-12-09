rope_segments = [];

rope_length = 200;
rope_length_invis = 260;
num_segments = 16;

rope_gravity = -2;
num_constraint_sims = 18;

segment_length = rope_length / num_segments;
//segment_length = 12;

rope_width = 6;

for (var i = 0; i < num_segments; i++)
{
	rope_segments[i] = create_rope_segment(0, 0);
	rope_segments[i].x_now = 0;
	rope_segments[i].y_now = 0;
	rope_segments[i].x_old = 0;
	rope_segments[i].y_old = 0;
}

hook_held_by_player = true;
hook_attached = false;

speed_due_to_gravity = 0.0;
gravity_speed = -0.2;
velocity_x = 0.0;
velocity_x_decay = 0.985;
throw_speed = 16;
terminal_velocity = 10;

rope_vel_x = 0;
rope_vel_y = 0;

rope_vel_x = 0;
rope_vel_y = 0;