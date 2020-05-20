-module(mastermind_test).

-include_lib("eunit/include/eunit.hrl").
-import(mastermind, [compare/2]).

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
'third color_test'() -> 
    [
     ?assertMatch([_, 1], compare([red, teal, green], [green, orange, yellow]))
    ].
'color at mutliple wrong places_test'() ->
    ?assertMatch([_, 2], compare([red, teal, green], [teal, orange, teal])).

