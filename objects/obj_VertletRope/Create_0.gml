rope_segments = [];

rope_length = 500;
num_segments = 16;

rope_gravity = -2;
num_constraint_sims = 20;

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