% все наберут разное количество баллов
% Если Пешкин не 1 то Королев 4
% Если Королев 3 то Пешкин 4
% У Пешкина положение лучше чем у Слонова
% если Ладейников не 1 то Пешкин 3
% Если Королев 2 то Слонов не 4
% Если Королев 1 то Слонов 2
% Если Слонов не 2 то и Ладейников не 2

% 2 может быть Слонов пешкин Королев


solve(Peshkin,Ladeynikoff,Korolyov,Slonoff):-
    place(Peshkin),place(Ladeynikoff),place(Korolyov),
    place(Slonoff),
    
forecast(1,Peshkin,Ladeynikoff,Korolyov,Slonoff),
forecast(2,Peshkin,Ladeynikoff,Korolyov,Slonoff),
forecast(3,Peshkin,Ladeynikoff,Korolyov,Slonoff),
forecast(4,Peshkin,Ladeynikoff,Korolyov,Slonoff),!.
place(Place):- Place = 1;Place = 2;Place = 3;Place = 4.
forecast(1,Peshkin,_,Korolyov,_):- 
        Peshkin> 1,Korolyov = 4.

forecast(2,Peshkin,Ladeynikoff,Korolyov,Slonoff):-
        Korolyov=3,Peshkin=4;
        Peshkin<Slonoff.
forecast(3,Peshkin,Ladeynikoff,Korolyov,Slonoff):-
        Ladeynikoff>1,Peshkin=3;
        Korolyov\=2,Slonoff<4.
forecast(4,Peshkin,Ladeynikoff,Korolyov,Slonoff):-
        Korolyov=1,Slonoff=2;
        Slonoff\=2,Ladeynikoff\=2.
