% Autor:
% Datum: 13.06.2017

%Aufgabe 1

%postfix(Xs,Ys):-Ys endet mit der Liste Xs
postfix1([],_).
postfix1(Xs,Ys) :- rev(Xs,X1s), rev(Ys,Y1s),praefix(X1s,Y1s).

postfix2(Xs,Ys):-app(_,Xs,Ys).

rev([],[]).
rev([X|Xs],Ys):-rev(Xs,T),app(T,[X],Ys).
app([],Xs,Xs).
app([X|X1s],Ys,[X|X2s]):-app(X1s,Ys,X2s).

praefix([],_).
praefix([X|Xs],[X|Ys]):-praefix(Xs,Ys).
%-------------------------------------------------------------------------------
%Aufgabe 2

bintree(e).
bintree(n(X,Lb,Rb)):- bintree(Lb), bintree(Rb).

%mem(X,Xb):- Baum Xb enthaelt Eintrag X
mem(X,n(X,Lb,Rb)):-bintree(Lb),bintree(Rb).
mem(X,n(_,Lb,Rb)):-mem(X,Lb),bintree(Lb),bintree(Rb).
mem(X,n(_,Lb,Rb)):-mem(X,Rb),bintree(Lb),bintree(Rb).

%-------------------------------------------------------------------------------
%Aufgabe 3

%preorder(Xb,Ys): Ys ist die Liste der Knotenbeschriftungen
%des Binärbaumes Xb in Preorder
preorder(e,[]).
preorder(n(X, Lb, Rb),Xs):- preorder(Lb,Ls),preorder(Rb,Rs),app([X|Ls],Rs,Xs).

%postorder(Xb,Ys): Ys ist die LIste der Knotenbeschriftungen
%des Binärbaumes Xb in Postorder
postorder(e,[]).
postorder(n(X,Lb,Rb),Xs):- postoder(Lb,Ls), postorder(Rb,Rs),
                           app(Ls,Rs,X1s),app(X1s,[X],Xs).

%roots(Xbs,Ys):-Xbs ist eine Liste von Binaerbaeumen.
%Die Liste Ys ist die Liste der Wurzelbeschriftungen
%der Binaerbaeume in Xbs in richtiger Reihenfolge
roots([],[]).
roots([e|Xbs],Ys):-roots(Xbs,Ys).
roots([n(X,_,_)|Xbs],[X|Ls]):-roots(Xbs,Ls).

%-------------------------------------------------------------------------------
%Moegliche Zusatzaufgaben

mirror(e,e).
mirror(n(X,Lb1,Rb1),node(X,Lb2,Rb2)):-mirror(Lb1,Rb2),mirror(Rb1,Lb2),
                                      bintree(Rb1),bintree(Lb1),bintree(Rb2),
                                      bintree(Lb2).

