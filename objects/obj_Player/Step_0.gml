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

if (keyboard_check(ord("W")))
{
	y -= moveSpeed;
}
if (keyboard_check(ord("S")))
{
	y += moveSpeed;
}

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
if (instance != noone)
{
	//Jump
	if (keyboard_check_pressed(vk_space))
	{
		speed_due_to_gravity = -jump_speed;
	}
	//Reset velocity
	else
	{	
		y = yprevious;
		speed_due_to_gravity = 0;
	}
}