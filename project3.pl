/**
* Student: Kristinn Heidar Freysteinsson
* Kt.: 011081-3209
* Username: kristinnf13
* Email: kristinnf13@ru.is
*/

/** 1a. The Dinner Party Murder */
affair('Steve', 'Jane').
affair('Jane', 'Steve').
affair('Mary', 'Steve').
affair('Steve', 'Mary').
married('Tom', 'Jane').
married('Jane', 'Tom').
rich('Steve').
dead('Steve').
greedy('John').

hates(X, Y) :- married(X,Z), affair(Z,Y).
suspect(X) :- hates(X,Y), dead(Y).
suspect(X) :- greedy(X), not(rich(X)), dead(Y), rich(Y).

/**
* 1b. The possible suspects are Tom and John.
* 1c. You can add that John is rich and then Tom becomes the only suspect.
*/

/** 2a. Number of elements in a list */
numElements(0,[]).
numElements(K,[_|L]) :- numElements(K1,L), K is K1 + 1.

/** 2b. Remove element from a list */
removeElement(X,[X|T],T).
removeElement(X,[H|T],[H|T1]) :- removeElement(X,T,T1).

/** 2c. Insert element into a list */
insertElementAt(E,L,1,[E|L]).
insertElementAt(E,[H|T],X,[H|T1]) :- insertElementAt(E,T,X1,T1), X is X1 + 1.

/** 2d. cut a list into segments */
segment([],_).
segment([X|Y],[X|T]) :- segment(Y,T), !.
