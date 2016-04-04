father(terach, abraham).
father(terach, nachor).
father(terach, haran).
father(abraham, isaac).
father(haran, lot).
father(haran, milcah).
father(haran, yiscah).
mother(sarah, isaac).
man(terach).
man(abraham).
man(nachor).
man(haran).
man(isaac).
man(lot).
woman(sarah).
woman(milcah).
woman(yiscah).

parent(X, Y) :- father(X,Y).
parent(X, Y) :- mother(X,Y).

son(X, Y) :- father(Y,X), man(X).
