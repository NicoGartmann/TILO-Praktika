% Autor:
% Datum: 09.05.2017

%linList zur Überprüfung einer Liste
linList(nil).
linList(list(X,Xs)):- linList(Xs).

%memb(X,Ys): X ist in Ys enthalten
memb(X,Ys):- list(X,Xs)=Ys.
memb(X,Ys):- list(T,Xs)=Ys,memb(X,Xs).

%infix Xs ist in der Liste Ys
infix(Xs,Ys):- app(_,Tmp,Ys), app(Xs,_,Tmp).

app(nil,Xs,Xs).
app(list(X,X1s),Ys,list(X,X2s)):- app(X1s,Ys,X2s).

%-----------------------------------------------------
%Binbaum Aufgaben
binbaum(e).
binbaum(n(X,Lb,Rb)):- binbaum(Lb),binbaum(Rb).

%construct(Root,Lb,Rb,Xneub):Xneub=Baum mit: Wurzel=Root, lTeilbaum=Lb, rTeilbaum=Rb
construct(Root,Lb,Rb,Xneub):- Xneub=n(Root,Lb,Rb).

%knotenanz(Xb,N): N Anzahl der Knoten des Baumes Xb
knotenanz(e,o).
knotenanz(Xb,s(N)):- Xb=n(X,Lb,Rb),knotenanz(Lb,Y),knotenanz(Rb,K),add(Y,K,N).

%add(X,Y,R):- X+Y=R
add(o,Y,Y).
add(s(X),Y,s(R)) :- add(X,Y,R).

%--------------------------------------------------------------------------

%rev(Xs,Ys): Ys=Xs rückwärts
rev(nil,nil).
rev(list(X,Xs),Ys):- rev(Xs,T),app(T,list(X,nil),Ys).

%palindrom(Xs):- Xs ist Palindrom
palindrom(nil).
palindrom(Xs):- rev(Xs,Xs).
