/**
* Student: Kristinn Heidar Freysteinsson
* Kt.: 011081-3209
* Username: kristinnf13
* Email: kristinnf13@ru.is
*/

/** 1. The Dinner Party Murder */
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

/** 2a. Number of elements in a list */
numElements(0,[]).
numElements(K,[_|L]) :- numElements(K1,L), K is K1 + 1.

/** 2b. Remove element from a list */