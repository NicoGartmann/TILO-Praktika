% Autor:
% Datum: 11.05.2017

%eltern(X,Y):- X ist vater/mutter von Y.
eltern(manfred,nico).
eltern(manfred,kiara).
eltern(alexandra,nico).
eltern(alexandra,kiara).
eltern(heinz,alexandra).
eltern(heinz,guido).
eltern(hannelore,alexandra).
eltern(hannelore,guido).
eltern(resi,manfred).
eltern(bueb,manfred).

%geschlecht
maennlich(heinz).
maennlich(bueb).
maennlich(manfred).
maennlich(guido).
maennlich(nico).
weiblich(hannelore).
weiblich(resi).
weiblich(alexandra).
weiblich(kiara).

%vater(X,Y):- X ist Vater von Y.
vater(X,Y):- maennlich(X),eltern(X,Y).

%mutter(X,Y):- X ist Mutter von Y.
mutter(X,Y):- weiblich(X),eltern(X,Y).


%sohn(X,Y):- X ist Sohn von Y.
sohn(X,Y):- vater(Y,X),maennlich(X).
sohn(X,Y):- mutter(Y,X),maennlich(X).

%tochter(X,Y):- X ist Tochter von Y.
tochter(X,Y):- vater(Y,X),weiblich(X).
tochter(X,Y):- mutter(Y,X),weiblich(X).

%bruder(X,Y):- X ist Bruder von Y.
bruder(X,Y):- vater(H1,X),vater(H1,Y),mutter(H2,X),mutter(H2,Y),maennlich(X),X\==Y.

%schwester(X,Y):- X ist Schwester von Y.
schwester(X,Y):- vater(H1,X),vater(H1,Y),mutter(H2,X),mutter(H2,Y),weiblich(X),X\==Y.

%grossvater(X,Y):- X ist Grossvater von Y.
grossvater(X,Y):-vater(X,H),vater(H,Y).
grossvater(X,Y):-vater(X,H),mutter(H,Y).

%grossmutter(X,Y):- X ist Grossmutter von Y.
grossmutter(X,Y):- mutter(X,H),mutter(H,Y).
grossmutter(X,Y):- mutter(X,H),vater(H,Y).

%onkel(X,Y):- X ist Onkel von Y.
onkel(X,Y):- mutter(H,Y),bruder(X,H).
onkel(X,Y):- vater(H,Y),bruder(X,H).