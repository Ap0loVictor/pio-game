if (respawning) {
    respawn_timer--;

    if (respawn_timer <= 0) {
        breaking     = false;
        destroyed    = false;
        timer        = max_timer;
        x            = origin_x;
        shake_range  = 0;
        image_alpha  = 1;
        sprite_index = original_sprite;
        respawning   = false;
    }
    exit;
}

if (destroyed) exit;
var _on_top = false;
with (Pio) {
    if (place_meeting(x, y + 1, other) && !place_meeting(x, y, other)) {
        _on_top = true;
    }
}

if (_on_top && !breaking) {
    breaking = true;
}

if (breaking) {
    timer--;

    var _progress  = 1 - (timer / max_timer);
    shake_range    = lerp(0, 4, _progress);
    x              = origin_x + irandom_range(-shake_range, shake_range);

    if (timer < max_timer / 2) {
        image_alpha = 0.4 + 0.6 * ((timer mod 8) > 3);
    }

    if (timer <= 0) {
        destroyed    = true;
        x            = origin_x;
        sprite_index = -1;
        image_alpha  = 1;
        respawning   = true;
        respawn_timer = max_respawn_timer;
    }
}
if (respawning) {
    respawn_timer--;

    if (respawn_timer <= 0) {
        breaking     = false;
        destroyed    = false;
        timer        = max_timer;
        x            = origin_x;
        shake_range  = 0;
        image_alpha  = 1;
        sprite_index = original_sprite;
        respawning   = false;
    }
    exit;
}

if (destroyed) exit;
var _on_top = false;
with (Pio) {
    if (place_meeting(x, y + 1, other) && !place_meeting(x, y, other)) {
        _on_top = true;
    }
}

if (_on_top && !breaking) {
    breaking = true;
}

if (breaking) {
    timer--;

    var _progress  = 1 - (timer / max_timer);
    shake_range    = lerp(0, 4, _progress);
    x              = origin_x + irandom_range(-shake_range, shake_range);

    if (timer < max_timer / 2) {
        image_alpha = 0.4 + 0.6 * ((timer mod 8) > 3);
    }

    if (timer <= 0) {
        destroyed    = true;
        x            = origin_x;
        sprite_index = -1;
        image_alpha  = 1;
        respawning   = true;
        respawn_timer = max_respawn_timer;
    }
}