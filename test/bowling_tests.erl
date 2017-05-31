%%%-------------------------------------------------------------------
%%% @author hadrienmp
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. mai 2017 19:35
%%%-------------------------------------------------------------------
-module(bowling_tests).
-author("hadrienmp").
-include_lib("eunit/include/eunit.hrl").

%% API
-export([]).

gutter_test() -> ?assertEqual(0, bowling:score(roll(20, 0))).
simple_test() -> ?assertEqual(23, bowling:score([2,3 | roll(18, 1)])).
spare_test() -> ?assertEqual(17, bowling:score([1,9,2,3 | roll(16, 0)])).
ten_between_frames_test() -> ?assertEqual(14, bowling:score([1,8,2,3 | roll(16, 0)])).
spare_in_last_frame_test() -> ?assertEqual(12, bowling:score(roll(18, 0) ++ [9, 1, 2])).
strike_test() -> ?assertEqual(19, bowling:score([10,1,2,3 | roll(15, 0)])).
strike_at_the_end_test() -> ?assertEqual(13, bowling:score(roll(18, 0) ++ [10, 1, 2])).
three_strike_at_the_end_test() -> ?assertEqual(30, bowling:score(roll(18, 0) ++ [10, 10, 10])).
perfect_game_test() -> ?assertEqual(300, bowling:score(roll(12, 10))).

roll(NumberOfRolls, Value) -> [Value || _X <- lists:seq(1, NumberOfRolls)].
