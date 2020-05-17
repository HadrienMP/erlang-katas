-module(mastermind_test).

-include_lib("eunit/include/eunit.hrl").
%% API
-export([]).

single_color_exact_match_test() -> ?assertEqual([1,0], compare([blue], [blue])).
single_color_no_match_test() -> ?assertEqual([0,0], compare([red], [blue])).
exact_match_test() -> ?assertEqual([2,0], compare([blue, red], [blue, red])).

compare(Guess, Secret) -> [exact_matches(0, Guess, Secret),0].

exact_matches(Matches, [], []) -> Matches;
exact_matches(Matches, [Color | Guess], [Color | Secret]) -> exact_matches(Matches + 1, Guess, Secret);
exact_matches(Matches, [_ | Guess], [_ | Secret]) -> exact_matches(Matches, Guess, Secret).
