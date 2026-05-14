if(draw_warning == true){
	draw_set_colour(c_orange)
	draw_line(x0pre, y0pre, x1pre, y1pre)
}else if(draw_final == true){
	draw_set_colour(#FF5C40)
	draw_line_width(x0pre, y0pre, x1pre, y1pre, 4)
} 