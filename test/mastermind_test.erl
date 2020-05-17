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

%% COMPARE
compare(Guess, Secret) -> [exact_matches(Guess, Secret), matches(Guess, Secret)].

%% EXACT MATCHES
exact_matches(Guess, Secret) -> exact_matches(0, Guess, Secret).

exact_matches(Matches, [], []) -> Matches;
exact_matches(Matches, [Color | Guess], [Color | Secret]) -> exact_matches(Matches + 1, Guess, Secret);
exact_matches(Matches, [_ | Guess], [_ | Secret]) -> exact_matches(Matches, Guess, Secret).

%% MATCHES
matches(Guess, Secret) -> matches(0, Guess, Secret).

matches(_, [Color | _], [_ | Secret]) -> matchColor(Color, Secret).

matchColor(_, []) -> 0;
matchColor(Color, [Color | _]) -> 1;
matchColor(Color, [_ | Secret]) -> matchColor(Color, Secret).

