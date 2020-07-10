-module(mastermind).
-import(mastermind_list, [remove/2, countOccurences/2]).
-export([compare/2]).

%% COMPARE
compare(Guess, Secret) -> [rightPlace(Guess, Secret), wrongPlaces(Guess, Secret)].

%% EXACT MATCHES
rightPlace(Guess, Secret) -> rightPlace(0, Guess, Secret).

rightPlace(Matches, [], []) -> Matches;
rightPlace(Matches, [Color | Guess], [Color | Secret]) -> rightPlace(Matches + 1, Guess, Secret);
rightPlace(Matches, [_ | Guess], [_ | Secret]) -> rightPlace(Matches, Guess, Secret).

%% MATCHES
wrongPlaces(Guess, Secret) -> 
    Indexs = lists:seq(0, length(Guess) - 1),
    FoldFunc = fun(Index, Acc) -> Acc + wrongPlaces(Index, Guess, Secret) end,
    lists:foldr(FoldFunc, 0, Indexs).

wrongPlaces(Index, Guess, Secret) -> 
    Color = colorAt(Index, Guess),
    countOccurences(Color, remove(Index, Secret)).

colorAt(Index, Colors) -> lists:nth(Index + 1, Colors).
