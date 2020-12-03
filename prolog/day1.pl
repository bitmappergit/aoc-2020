:- use_module(library(clpfd)).

solveP1(A, B) :-
  member(X, A),
  member(Y, A),
  2020 #= X + Y, !,
  B #= X * Y.

solveP2(A, B) :-
  member(X, A),
  member(Y, A),
  member(Z, A),
  2020 #= X + Y + Z, !,
  B #= X * Y * Z.

read_nums(F, [H | T]) :-
  read_line_to_codes(F, A),
  A \= end_of_file, !,
  number_codes(H, A),
  read_nums(F, T).
read_nums(_, []).

main :-
  open('../day1.txt', read, Str),
  read_nums(Str, Nums),
  solveP1(Nums, R1), !, print(R1), nl,
  solveP2(Nums, R2), !, print(R2), nl.
