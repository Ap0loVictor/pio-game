if (fase == 0) {
    draw_set_colour(c_orange);
    draw_line(x0, y0, x1, y1);
} 
else if (fase == 1) {
	
    draw_set_colour(#FF5C40);
    draw_line_width(x0, y0, x1, y1, 4);
    
    var hit = collision_line(x0, y0, x1, y1, Pio, false, false);
    if (hit != noone) {

    }
}


draw_set_colour(c_white);