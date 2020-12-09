speed_due_to_gravity -= gravity_speed;
if (speed_due_to_gravity > terminal_velocity)
{
	speed_due_to_gravity = terminal_velocity;
}

y += speed_due_to_gravity;

if (x > room_width)
{
	y = 864;
	x = 640;
	
	rope = instance_nearest(x, y, obj_VertletRope);
	if (!rope.hook_held_by_player)
	{
		rope.speed_due_to_gravity = 0;
		rope.velocity_x = 0;
		rope.hook_held_by_player = true;
		rope.hook_attached = false;
	}
}
else if (x < 0)
{
	y = 864;
	x = 640;
	
	rope = instance_nearest(x, y, obj_VertletRope);
	if (!rope.hook_held_by_player)
	{
		rope.speed_due_to_gravity = 0;
		rope.velocity_x = 0;
		rope.hook_held_by_player = true;
		rope.hook_attached = false;
	}
}

if (y > room_height)
{
	y = 864;
	x = 640;
	
	rope = instance_nearest(x, y, obj_VertletRope);
	if (!rope.hook_held_by_player)
	{
		rope.speed_due_to_gravity = 0;
		rope.velocity_x = 0;
		rope.hook_held_by_player = true;
		rope.hook_attached = false;
	}
}
else if (y < 0)
{
	y = 0;
}

//if (keyboard_check(ord("W")))
//{
//	y -= moveSpeed;
//}
//if (keyboard_check(ord("S")))
//{
//	y += moveSpeed;
//}

rope = instance_nearest(x, y, obj_VertletRope);

if (keyboard_check(ord("D")))
{
	x += moveSpeed;
	rope.rope_vel_y -= moveSpeed * 0.2;
}
if (keyboard_check(ord("A")))
{
	x -= moveSpeed;
	rope.rope_vel_y -= moveSpeed * 0.2;
}

//Collision check
instance = collision_rectangle(x - 2, y, x + 2, y + 1, obj_Platform, true, false);
var jumped = false;
if (instance != noone)
{
	
	if (instance.finish_plate)
	{
		room_goto_next();
	}
	//Jump
	else if (keyboard_check_pressed(vk_space))
	{
		speed_due_to_gravity = -jump_speed;
		jumped = true;
	}
	//Reset velocity
	else
	{	
		y = yprevious;
		speed_due_to_gravity = 0;
	}
}

if (!jumped && keyboard_check_pressed(vk_space) && !rope.hook_held_by_player)
{
	speed_due_to_gravity = -jump_speed;
	velocity_x = (x - xprevious) * 1.4;
	
	rope.speed_due_to_gravity = 0;
	rope.velocity_x = 0;
	rope.hook_held_by_player = true;
	rope.hook_attached = false;
}

velocity_x *= velocity_x_decay;
if (abs(velocity_x) < 0.2)
{
	velocity_x = 0.0;
}
 
x += velocity_x;