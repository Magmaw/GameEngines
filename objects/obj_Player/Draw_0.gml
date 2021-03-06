
//viewport_pos = y / room_height * 0.5 + x / room_width * 0.5;
//viewport_pos = y / room_height;
//viewport_color = merge_color(top_color, bottom_color, viewport_pos);
viewport_color = c_aqua;

draw_circle_color(x, y - 40, 10, viewport_color, viewport_color, false);
draw_ellipse_color(x - 5, y - 10, x + 5, y - 30, viewport_color, viewport_color, false);

draw_line_width_color(x - 4, y - 25, x - 21, y - 7, 2, viewport_color, viewport_color);

var arm_to_mouse = normalize(mouse_x - x, mouse_y - y);
hand_x = x + 4 + (24 * arm_to_mouse.x);
hand_y = y - 25 - (24 * -arm_to_mouse.y);
draw_line_width_color(x + 4, y - 25, hand_x, hand_y, 2, viewport_color, viewport_color);

draw_line_width_color(x - 3, y - 15, x - 3, y, 2, viewport_color, viewport_color);
draw_line_width_color(x + 3, y - 15, x + 3, y, 2, viewport_color, viewport_color);