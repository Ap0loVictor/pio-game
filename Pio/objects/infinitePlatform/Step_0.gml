// --- Waypoint alvo atual ---
var _tx   = waypoints[waypoint_index][0];
var _ty   = waypoints[waypoint_index][1];
var _dist = point_distance(x, y, _tx, _ty);

// --- Calcula delta deste frame ---
var _delta_x = 0;
var _delta_y = 0;

if (_dist <= move_speed) {
    // Snap exato no waypoint e avança para o próximo
    _delta_x       = _tx - x;
    _delta_y       = _ty - y;
    waypoint_index = (waypoint_index + 1) mod waypoint_total;
} else {
    var _dir = point_direction(x, y, _tx, _ty);
    _delta_x = lengthdir_x(move_speed, _dir);
    _delta_y = lengthdir_y(move_speed, _dir);
}

// --- Carrega o Player ANTES de mover a plataforma ---
with (Pio) {

    // FIX 1: detecção por bbox — tolerante ao movimento diagonal
    // Checa se o fundo do player está próximo do topo da plataforma
    // e se estão sobrepostos horizontalmente
    var _tol_y  = abs(_delta_y) + 3; // margem de segurança vertical
    var _on_top = (bbox_bottom >= other.bbox_top - 2)
               && (bbox_bottom <= other.bbox_top + _tol_y)
               && (bbox_right  >  other.bbox_left)
               && (bbox_left   <  other.bbox_right)
               && (yspeed >= -1); // tolera leve impulso para cima

    if (_on_top) {

        // FIX 2: exclui a própria plataforma do check de parede
        // (ela é Ground, e antes bloqueava o arrasto horizontal)
        if (_delta_x != 0) {
            var _wall = instance_place(x + _delta_x, y, Ground);
            if (_wall == noone || _wall == other) {
                x += _delta_x;
            }
        }

        // Arrasto vertical — cancela gravidade acumulada
        if (_delta_y != 0) {
            y      += _delta_y;
            yspeed  = 0;
        }
    }
}

// --- Move a plataforma ---
x += _delta_x;
y += _delta_y;