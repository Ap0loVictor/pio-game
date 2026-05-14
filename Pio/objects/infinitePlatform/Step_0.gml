var _tx  = waypoints[waypoint_index][0];
var _ty  =  waypoints[waypoint_index][1];
var _dist = point_distance(x, y, _tx, _ty);

var _delta_x = 0;
var _delta_y = 0;

if (_dist <= move_speed) {
    _delta_x  = _tx - x;
    _delta_y  = _ty - y;
    waypoint_index = (waypoint_index + 1) mod waypoint_total;
} else {
    var _dir = point_direction(x, y, _tx, _ty);
    _delta_x = lengthdir_x(move_speed, _dir);
    _delta_y = lengthdir_y(move_speed, _dir);
}

var _tol_y  = abs(_delta_y) + 3;
var _on_top = false;
var _wall   = noone;

with (Pio) {

    _on_top = (bbox_bottom >= other.bbox_top - 2)
           && (bbox_bottom <= other.bbox_top + _tol_y)
           && (bbox_right  >  other.bbox_left)
           && (bbox_left   <  other.bbox_right)
           && (yspeed >= -1);

    if (_on_top) {
        if (_delta_x != 0) {
            _wall = instance_place(x + _delta_x, y, Ground);
            if (_wall == noone || _wall == other) {
                x += _delta_x;
            }
        }
        if (_delta_y != 0) {
            y  += _delta_y;
            yspeed  = 0;
        }
    }
}

x += _delta_x;
y += _delta_y;