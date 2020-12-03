solveP1(A, B) :-
  member(X, A),
  member(Y, A),
  2020 #= X + Y,
  B is X * Y.

solveP2(A, B) :-
  member(X, A),
  member(Y, A),
  member(Z, A),
  2020 #= X + Y + Z,
  B is X * Y * Z.

read_nums(F, [H | T]) :-
  read_token(F, H),
  \+ at_end_of_stream(F),
  read_nums(F, T).
read_nums(_, []).

main :-
  open('../day1.txt', read, Str),
  read_nums(Str, Nums),
  solveP1(Nums, R1), !, print(R1), nl,
  solveP2(Nums, R2), !, print(R2), nl.

:- initialization(main).
