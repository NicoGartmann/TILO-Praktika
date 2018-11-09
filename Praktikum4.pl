%Anzahl 1sen gerade und 0en ungerade (Aufgabe 51 der �bungsaufgaben)

%Zust�nde (Z)
z(z0).
z(z1).
z(z2).
z(z3).

%Alphabet (Sigma)
sigma('0').
sigma('1').

%Anfangszustand (Z0)
start(z0).

%Endzustand (E)
end(z3).

%Transitionen (Delta)
%z0
delta(z0,'1',z1).
delta(z0,'0',z3).
%z1
delta(z1,'1',z0).
delta(z1,'0',z2).
%z2
delta(z2,'1',z3).
delta(z2,'0',z1).
%z3
delta(z3,'1',z2).
delta(z3,'0',z0).

%################## Der andere Kram ##################
%############Dieser Teil ist immer gleich ############

%�berpr�fen ob das Wort in sigma_stern drin ist
%#####################################################
sigma_stern([]).
sigma_stern([X|Xs]) :- sigma(X), sigma_stern(Xs).
%Def_1: Wenn Liste Leer ist, dann bist du fertig
%Def_2: Spalte die Liste in Variable und Restliste auf
        %Regel1: Pr�fe ob Variable in Sigma ist
        %Regel2: �bergebe Restliste wieder sigma_stern
%#####################################################


%�berpr�fen der Wege von Delta um ein Wort zu erhalten
%#####################################################
delta_stern(S, [], S).
delta_stern(S, [A|Ws], Sn) :-
                  delta(S, A, D),
                  delta_stern(D, Ws, Sn).
%Def_1: Wenn das Wort leer ist und Startzustand und Endzustand gleich, dann true
%Def_2: S f�r Start | Tele die Liste in die Element und Restliste | Sn f�r Ende
       %Regel1: Nehme das Startelement und Pr�fe mit dem Listenelement
       %Regel2: �berpr�fe mit dem delta-Element D als Start das Wort bis zum Ende Sn
%#####################################################


%�berpr�fen der Wege von Delta um ein Wort zu erhalten
%#####################################################
lvonN(Ws) :-
          sigma_stern(Ws),
          start(S),
          end(E),
          delta_stern(S, Ws, E).
%Def: �bergabe des Wortes
      %Regel1: Alphabet des Wortes �berpr�fen
      %Regel2: Startzustand als variable S
      %Regel3: Endzustand als variable E
      %Regel4: delta_stern mit Startzustand und Wort bis Endzustand
%#####################################################

%Beispiele
%lvonN(['1','1','0']).
%lvonN(['1','1','0','1']).