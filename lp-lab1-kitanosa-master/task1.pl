% Реализация стандартных предикатов обработки списков

% Длина списка
% (список, длина)
my_length([], 0).
my_length([_|L], N):-my_length(L, M), N is M + 1.

% Принадлежность элемента списку
% (элемент, список)
my_member(X, [X|_]).
my_member(X, [_|T]):-my_member(X, T).

% Конкатeнация списков
% (список1, список2, список1+2)
my_append([], L, L).
my_append([X|L1], L2, [X|L3]):-my_append(L1, L2, L3).

% Удаление элемента из списка
% (элемент, список, список без элемента(изначально пусток)где [Y|Z] добавение в начало элемента Y в список Z 
my_remove(X, [X|T], T).
my_remove(X, [Y|T], [Y|Z]):-my_remove(X, T, Z).

% Перестановки элементов в списке
% (список, перестановка)
my_permute([], []).
my_permute(L, [X|T]):-my_remove(X, L, Y), my_permute(Y, T).

% Подсписки списка
% (подсписок, список)
my_sublist(S, L):-my_append(_, L1, L), my_append(S, _, L1).

% without_last_n([a, b, c, d, e, f], 4, New).
without_last_n(Old, N, New) :-
    my_length(Tail, N),
    my_append(New, Tail, Old).

%без стандартных предикатов
deleteN(List,N):-
    reverse(List,RevList),
    deleteFirstN(RevList,Y,N),
    reverse(Y,Res),
    write(Res),!.

reverse(List, ReverseList):-
   reverse(List, [], ReverseList). 

reverse([], Buffer, Buffer):-!.
reverse([Head|Tail], Buffer, ReverseList):-
   reverse(Tail, [Head|Buffer], ReverseList).

deleteFirstN(List,List,0):-!. % число N = 0 , то мы уже удалили первые символы , поэтому полчаем ответ 
deleteFirstN([_|List],Res,N):-
	N1 is N - 1,
	deleteFirstN(List,Res,N1).
    
%Вычисление позиции максимального элемента в списке
result([H|T]):- find_max([H|T], R), find_pos([H|T], R, 1).

find_max([X],X).
find_max([X,Y|T],Max):-X=<Y,find_max([Y|T],Max).
find_max([X,Y|T],Max):-X>=Y,find_max([X|T],Max).

find_pos([],_,1):-!.
find_pos([X|_],X,K):-write(K),!.
find_pos([_|T],X,K):- K1 is K+1,find_pos(T,X,K1).
%Вычисление позиции максимального элемента в списке
result([H|T]):- find_max([H|T], R), find_pos([H|T], R, 1).

find_max([A], A).
find_max([A, B|C], R) :- A < B, find_max([B|C], R), !.
find_max([A, _|B], R) :- find_max([A|B], R).

find_pos([],_,1):-!.
find_pos([X|_],X,K):-write(K),!.
find_pos([_|T],X,K):- K1 is K+1,find_pos(T,X,K1).
