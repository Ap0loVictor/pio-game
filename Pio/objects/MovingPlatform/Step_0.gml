var _delta_x = vel_x;
var _delta_y = vel_y;

with (Pio) {
    var _on_top = place_meeting(x, y + 1, other)
               && !place_meeting(x, y, other)
               && yspeed >= 0;

    if (_on_top) {
        if (_delta_x != 0 && !place_meeting(x + _delta_x, y, Ground)) {
            x += _delta_x;
        }
        if (_delta_y != 0) {
            y += _delta_y;
            yspeed = 0;
        }
    }
}

x += vel_x;
y += vel_y;

if (vel_x != 0 && (x >= x_max || x <= x_min)) {
    vel_x = -vel_x;
    x = clamp(x, x_min, x_max);
}
if (vel_y != 0 && (y >= y_max || y <= y_min)) {
    vel_y = -vel_y;
    y = clamp(y, y_min, y_max);
}