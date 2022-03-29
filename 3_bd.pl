% 7. В файле хранится таблица рейтинга спортсменов в виде: 
%       спортсмен(<фамилия>,<количество набранных баллов>). 
% Написать программу, позволяющую вводить результаты соревнований в виде: спортсмен – занятое место. Корректировать файл рейтинга спортсменов, учитывая, что за 20-е место дается 1 балл, за 19-е – 2 балла, …, за 1-е место – 20 баллов

:- dynamic sportsmen/2.

modify(Surname,Place):-
    number(Place), Balls1 is 21 - Place,
    ignore(retract(sportsmen(Surname, Balls))),
    assert(sportsmen(Surname, Balls1)).

?- reconsult('bd.pl'),
    write('Enter surname: '), read(Surname), 
    write('Enter place: '), read(Place1),
    number_string(Place1, Place),
    modify(Surname, Place1),
    telling(Old),
    tell('bd.pl'),
    nl,
    listing(sportsmen),
    told,
    tell(Old).
