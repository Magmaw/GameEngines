rope_segments = [];

rope_length = 300;
num_segments = 20;

rope_gravity = -2;
num_constraint_sims = 2;

segment_length = rope_length / num_segments;

for (var i = 0; i < num_segments; i++)
{
	rope_segments[i] = create_rope_segment(0, 0);
	rope_segments[i].x_now = 0;
	rope_segments[i].y_now = 0;
	rope_segments[i].x_old = 0;
	rope_segments[i].y_old = 0;
}