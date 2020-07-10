-module(mastermind_list).
-export([remove/2, countOccurences/2]).

%% REMOVE FROM LIST
remove(Index, List) -> remove(Index, 0, [], List).

remove(Index, Index, Beginning, [_ | End]) -> Beginning ++ End;
remove(Index, CurrIndex, Beginning, [CurrEl | End]) -> 
    remove(Index, CurrIndex + 1, Beginning ++ [CurrEl], End).

%% COUNT OCCURENCES
countOccurences(El, List) -> countOccurences(El, List, 0).
countOccurences(_, [], Occurences) -> Occurences;
countOccurences(El, [El | List], Occurences) -> 
    countOccurences(El, List, Occurences + 1);
countOccurences(El, [_ | List], Occurences) -> 
    countOccurences(El, List, Occurences).
