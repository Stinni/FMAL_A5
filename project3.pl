affair(Steve, Jane).
affair(Jane, Steve).
affair(Mary, Steve).
affair(Steve, Mary).
married(Tom, Jane).
married(Jane, Tom).
rich(Steve).
dead(Steve).
greedy(John).

hates(X, Y) :- married(X,_), affair(_,Y).
suspect(X) :- hates(X,_), dead(_).
suspect(X) :- greedy(X), not(rich(X)), dead(_), rich(_).
