// Velocidade de deslocamento (px/frame)
move_speed = 2;

// Dimensões de cada pétala do ∞ — ajuste livremente
var _w  = 120;  // semi-largura de cada loop
var _h  = 70;   // semi-altura de cada loop

// Centro = posição inicial no editor
var _cx = x;
var _cy = y;

// Array de waypoints que formam o ∞ deitado
// Dois losangos que se cruzam no centro
waypoints = [
    [ _cx,         _cy      ],  // 0 — centro
    [ _cx + _w,    _cy - _h ],  // 1 — topo-direita
    [ _cx + _w*2,  _cy      ],  // 2 — direita
    [ _cx + _w,    _cy + _h ],  // 3 — baixo-direita
    [ _cx,         _cy      ],  // 4 — centro (crossover)
    [ _cx - _w,    _cy - _h ],  // 5 — topo-esquerda
    [ _cx - _w*2,  _cy      ],  // 6 — esquerda
    [ _cx - _w,    _cy + _h ],  // 7 — baixo-esquerda
                                 //  → volta ao 0, loop infinito
];

waypoint_total = array_length(waypoints);
waypoint_index = 1; // começa mirando no ponto 1 (já está no ponto 0)