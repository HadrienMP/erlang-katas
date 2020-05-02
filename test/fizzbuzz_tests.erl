%%%-------------------------------------------------------------------
%%% @author hadrienmp
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. mai 2017 11:57
%%%-------------------------------------------------------------------
-module(fizzbuzz_tests).
-author("hadrienmp").
-include_lib("eunit/include/eunit.hrl").

%% API
-export([]).

return_1_for_1_test() -> ?assertEqual("1", fizzbuzz:fizzbuzz(1)).
return_2_for_2_test() -> ?assertEqual("2", fizzbuzz:fizzbuzz(2)).
return_fizz_for_3_test() -> ?assertEqual("fizz", fizzbuzz:fizzbuzz(3)).
return_fizz_for_6_test() -> ?assertEqual("fizz", fizzbuzz:fizzbuzz(6)).
return_buzz_for_5_test() -> ?assertEqual("buzz", fizzbuzz:fizzbuzz(5)).
return_buzz_for_10_test() -> ?assertEqual("buzz", fizzbuzz:fizzbuzz(10)).
return_fizzbuzz_for_15_test() -> ?assertEqual("fizzbuzz", fizzbuzz:fizzbuzz(3*5)).
return_fizzbuzz_for_30_test() -> ?assertEqual("fizzbuzz", fizzbuzz:fizzbuzz(2*3*5)).

performance_test() ->
  Target = erlang:trunc(math:pow(3,9)*math:pow(5,9)*2),
  {_, Time} = utils:time(fun fizzbuzz:fizzbuzz/1, Target),
  io:fwrite("Time spent : ~w~n", [Time]),
  ?assert(Time < 3000).