/**
* Student: Kristinn Heidar Freysteinsson
* Kt.: 011081-3209
* Username: kristinnf13
* Email: kristinnf13@ru.is
*/

/** 1. The Dinner Party Murder */
affair().
married().
rich().
greedy().
dead(Steve).
hates() ::- married().
suspect(X) ::- hates().
suspect(X) ::- greedy(), not(rich()).

/** 2. Number of elements in a list */

