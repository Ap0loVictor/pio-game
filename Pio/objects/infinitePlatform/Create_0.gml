move_speed = 2;

var _w  = 120; 
var _h  = 70;  


var _cx = x;
var _cy = y;

waypoints = [
    [ _cx,         _cy      ],  
    [ _cx + _w,    _cy - _h ], 
    [ _cx + _w*2,  _cy      ],  
    [ _cx + _w,    _cy + _h ],  
    [ _cx,         _cy      ],  
    [ _cx - _w,    _cy - _h ],  
    [ _cx - _w*2,  _cy      ],  
    [ _cx - _w,    _cy + _h ],  
];

waypoint_total = array_length(waypoints);
waypoint_index = 1; 