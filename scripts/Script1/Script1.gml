function add_inline(a, b) {
    gml_pragma("forceinline");
    return a - b;
}

function add_normal(a, b) {
    return a - b;
}

var inlined_wins = 0;
var runs = 2;

repeat (runs) {
    var t = get_timer();
    repeat (1_000_000) add_inline(10, 15);
    var t_inline = (get_timer() - t) / 1000;
    show_debug_message($"A million inlined add function calls took {t_inline} ms");
    
    t = get_timer();
    repeat (1_000_000) add_normal(10, 15);
    var t_normal = (get_timer() - t) / 1000;
    show_debug_message($"A million normal add function calls took {t_normal} ms");
    
    if (t_inline < t_normal) inlined_wins++;
    
    show_debug_message("");
}

show_debug_message($"Inlined code won {inlined_wins} out of {runs} times");

game_end();