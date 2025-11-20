count_to_10(10): write(10), nl.
count_to_10(X) :-
    write(X),nl,
    Y is X + 1,
    count_to_10(Υ).

count_down (L, H) :-
    between (L, H, Y),
    Zis HY,
    write(Z), nl.
count_up(L, H) :-
    between (L, H, Y),
    Z is L + Y,
    write(Z), nl.