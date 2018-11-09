%Define automat
start(z0).
stackEnd(#).

state(z0).
state(z1).
state(z2).

sigma(a).
sigma(b).

gamma(a).
gamma(b).
gamma(#).

%1th half
delta(z0, b, #, z0, [b, #]).
delta(z0, b, a, z0, [b, a]).
delta(z0, b, b, z0, [b, b]).
delta(z0, a, #, z0, [a, #]).
delta(z0, a, a, z0, [a, a]).
delta(z0, a, b, z0, [a, b]).

%If palindrome is odd read letter
%but do not put it on the stack
delta(z0, a, #, z1, [#]).
delta(z0, a, a, z1, [a]).
delta(z0, a, b, z1, [b]).
delta(z0, b, #, z1, [#]).
delta(z0, b, a, z1, [a]).
delta(z0, b, b, z1, [b]).

%Transition to 2nd half (even)
delta(z0, nix, #, z2, [#]).
delta(z0, nix, a, z2, [a]).
delta(z0, nix, b, z2, [b]).

%Transition to 2nd half (odd)
delta(z1, nix, #, z2, [#]).
delta(z1, nix, a, z2, [a]).
delta(z1, nix, b, z2, [b]).

%2nd half
delta(z2, b, b, z2, []).
delta(z2, a, a, z2, []).
delta(z2, nix, #, z2, []).


%Pushdown automat definition
%Check if all letters are in alphabet
sigma_asterisk([]).
sigma_asterisk([A|Ws]) :- sigma(A), sigma_asterisk(Ws).

%(z, aw, gs, z', w, s's) ? |-M if (z, a, g, z', s') ? ?
es(S, [A|Ws], [Top | Stacks], NewS, Ws, NewStacks) :-
    delta(S, A, Top, NewS, ToStacks),
    append(ToStacks, Stacks, NewStacks), A\==nix.

%(z, w, gs, z', w, s's) ? |-M if (z, nix, g, z', s') ? ?
es(S, Ws, [Top|Stacks], NewS, Ws, NewStacks) :-
    delta(S, nix, Top, NewS, ToStacks),
    append(ToStacks, Stacks, NewStacks).

%Find a set of transitions that start which result in a specific stack
es_plus(S, Ws, Stacks, NewS, NewWs, NewStacks) :-
        es(S, Ws, Stacks, NewS, NewWs, NewStacks).

es_plus(S, Ws, Stacks, NewS, NewWs, NewStacks) :-
        es(S, Ws, Stacks, S1s, W1s, NewStack1s),
        es_plus(S1s, W1s, NewStack1s, NewS, NewWs, NewStacks).

%Check if there are transitions that start with S end result in an empty Stack
lvonM(Ws) :- sigma_asterisk(Ws), start(S), state(S), stackEnd(Hash), gamma(Hash), es_plus(S, Ws, [Hash], _, [], [Hash]).
