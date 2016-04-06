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

hates(X, Y) :- married(X, Z), affair(Z, Y).
suspect(X) :- hates(X, Y), dead(Y).
suspect(X) :- greedy(X), not(rich(X)), dead(Y), rich(Y).

/**
* 1b. The possible suspects are Tom and John.
* 1c. You can add that John is rich and then Tom becomes the only suspect.
*/

/** 2a. Number of elements in a list */
numElements(0, []).
numElements(K, [_|T]) :- numElements(K1, T), K is K1 + 1.

/** 2b. Remove element from a list */
removeElement(X, [X|T], T).
removeElement(X, [H|T], [H|T1]) :- removeElement(X, T, T1).

/** 2c. Insert element into a list */
insertElementAt(E, L, 1, [E|L]).
insertElementAt(E, [H|T], X, [H|T1]) :- insertElementAt(E, T, X1, T1), X is X1 + 1.

/** 2d. check if a list is a segment of another list */
segment([], _).
segment([X|T1], [X|T2]) :- seghelper(T1, T2), !.
segment(L, [_|T]) :- segment(L, T).
/** 2d helper function */
seghelper([], _).
seghelper([X|T1], [X|T2]) :- seghelper(T1, T2).

/** 2e. Add up all elements in a list up to the same position */
addUpList(L1, L2) :- addUpListHelper(L1, L2, 0).
/** 2e helper function */
addUpListHelper([], [], _).
addUpListHelper([H|T1], [Acc|T2], S) :- Acc is S + H, addUpListHelper(T1, T2, Acc).

/** 3a. Merge together two sorted lists into a sorted list */
mymerge(X, [], X).
mymerge([], Y, Y).
mymerge([X|T1], [Y|T2], [X|M]) :- X =< Y, mymerge(T1, [Y|T2], M).
mymerge([X|T1], [Y|T2], [Y|M]) :- X > Y, mymerge([X|T1], T2, M).

/** 3b. Split a list into two */
mysplit([], [], []).
mysplit([X], [X], []).
mysplit([X, Y|T], [X|S1], [Y|S2]) :- mysplit(T, S1, S2).

/** 3c. Mergesort: split and merge a list to sort it */
mysort([], []).
mysort([X], [X]).
mysort(X, M) :- mysplit(X, S1, S2), mysort(S1, Y), mysort(S2, Z), mymerge(Y , Z, M).

/** 4a. Binary Tree */
binaryTree(nil).
binaryTree(t(_,X,Y)) :- binaryTree(X), binaryTree(Y).

/** 4b. Binary Tree list of items after preorder traversal */
preorder(nil, []).
preorder(t(X, L, R), [X|Lis]) :- preorder(L, Llis), preorder(R, Rlis), append(Llis, Rlis, Lis).

/** 4c. Binary Tree list of values from leaf nodes */
leaves(nil, []).
leaves(t(X, nil, nil), [X]) :- !.
leaves(t(_, L, R), Lis) :- leaves(L, Llis), leaves(R, Rlis), append(Llis, Rlis, Lis).

/** 5. Context-Free Grammar */
factor([X]) :- number(X).
factor(X) :- append(['('|Y], [')'], X), expr(Y).
term(X) :- factor(X).
term(X) :- append(Y, [*|Z], X), factor(Y), term(Z).
expr(X) :- term(X).
expr(X) :- append(Y, [+|Z], X), term(Y), expr(Z).
