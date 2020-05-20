-module(mastermind_test).

-include_lib("eunit/include/eunit.hrl").

%% API
-export([]).

'an exact match is the right color at the right place_test'() ->
    [
     ?assertMatch([1,_], compare([blue, green ,red], [yellow, green, purple])),
     ?assertMatch([2,_], compare([blue, red], [blue, red])),
     ?assertMatch([1,_], compare([blue], [blue])),
     ?assertMatch([0,_], compare([blue, green], [red, yellow]))
    ].

'right colors at the right place do not count as a match_test'() ->
    ?assertEqual([1,0], compare([blue], [blue])).

'the first color counts as a match if it exists in the secret_test'() -> 
    [
     ?assertMatch([_, 1], compare([red, green, purple, blue], [yellow, orange, teal, red])),
     ?assertMatch([_, 1], compare([red, green, purple], [yellow, teal, red])),
     ?assertMatch([_, 1], compare([red, green, purple], [yellow, red, teal])),
     ?assertMatch([_, 1], compare([red, green], [yellow, red]))
    ].

'second color_test'() -> 
    [
     ?assertMatch([_, 1], compare([red, green], [green, yellow])),
     ?assertMatch([_, 1], compare([red, green, teal], [green, yellow, orange])),
     ?assertMatch([_, 1], compare([red, green, teal], [orange, yellow, green]))
    ].
%'third color_test'() -> 
%    [
%     ?assertMatch([_, 1], compare([red, teal, green], [green, orange, yellow]))
%    ].

%% COMPARE
compare(Guess, Secret) -> [rightPlace(Guess, Secret), countWrongPlaces(Guess, Secret)].

%% EXACT MATCHES
rightPlace(Guess, Secret) -> rightPlace(0, Guess, Secret).

rightPlace(Matches, [], []) -> Matches;
rightPlace(Matches, [Color | Guess], [Color | Secret]) -> rightPlace(Matches + 1, Guess, Secret);
rightPlace(Matches, [_ | Guess], [_ | Secret]) -> rightPlace(Matches, Guess, Secret).

%% MATCHES
countWrongPlaces(Guess, Secret) -> 
    Indexs = lists:seq(0, length(Guess) - 1),
    FoldFunc = fun(Index, Acc) -> Acc + countWrongPlaces(Index, Guess, Secret) end,
    lists:foldr(FoldFunc, 0, Indexs).

countWrongPlaces(Index, Guess, Secret) -> 
    matchColor(colorAt(Index, Guess), remove(Index, Secret)).

matchColor(_, []) -> 0;
matchColor(Color, [Color | _]) -> 1;
matchColor(Color, [_ | Secret]) -> matchColor(Color, Secret).

colorAt(Index, Colors) -> lists:nth(Index + 1, Colors).

%% REMOVE FROM LIST
remove(Index, List) -> remove(Index, 0, [], List).

remove(Index, Index, Beginning, [_ | End]) -> Beginning ++ End;
remove(Index, CurrIndex, Beginning, [CurrEl | End]) -> 
    remove(Index, CurrIndex + 1, Beginning ++ [CurrEl], End).
