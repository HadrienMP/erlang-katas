%%%-------------------------------------------------------------------
%%% @author hadrienmp
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. mai 2017 13:58
%%%-------------------------------------------------------------------
-module(utils_tests).
-author("hadrienmp").
-include_lib("eunit/include/eunit.hrl").

%% API
-export([]).

to_digits_1_digit_test() -> ?assertEqual([1], utils:to_digits(1)).
to_digits_2_digits_test() -> ?assertEqual([1,2], utils:to_digits(12)).
to_digits_3_digits_test() -> ?assertEqual([1,2,3], utils:to_digits(123)).