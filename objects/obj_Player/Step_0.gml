y -= gravity_speed;

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