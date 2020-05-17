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

compare(Guess, Secret) -> [exact_matches(0, Guess, Secret), 0].

exact_matches(Matches, [], []) -> Matches;
exact_matches(Matches, [Color | Guess], [Color | Secret]) -> exact_matches(Matches + 1, Guess, Secret);
exact_matches(Matches, [_ | Guess], [_ | Secret]) -> exact_matches(Matches, Guess, Secret).
