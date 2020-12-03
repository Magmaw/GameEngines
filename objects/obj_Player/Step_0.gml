speed_due_to_gravity -= gravity_speed;
if (speed_due_to_gravity > terminal_velocity)
{
	speed_due_to_gravity = terminal_velocity;
}

y += speed_due_to_gravity;

if (x > room_width)
{
	x = room_width;
}
else if (x < 0)
{
	x = 0;
}

if (y > room_height)
{
	y = room_height;
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

if (keyboard_check(ord("D")))
{
	x += moveSpeed;
}
if (keyboard_check(ord("A")))
{
	x -= moveSpeed;
}

//Collision check
instance = collision_rectangle(x - 2, y, x + 2, y + 1, obj_Platform, true, false);
var jumped = false;
if (instance != noone)
{
	//Jump
	if (keyboard_check_pressed(vk_space))
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

rope = instance_nearest(x, y, obj_VertletRope);

if (!jumped && keyboard_check_pressed(vk_space) && !rope.hook_held_by_player)
{
	speed_due_to_gravity = -jump_speed;
	
	rope.speed_due_to_gravity = 0;
	rope.velocity_x = 0;
	rope.hook_held_by_player = true;
	rope.hook_attached = false;
}