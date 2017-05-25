%%%-------------------------------------------------------------------
%%% @author hadrienmp
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. mai 2017 22:15
%%%-------------------------------------------------------------------
-module(learning_tests).
-author("hadrienmp").
-include_lib("eunit/include/eunit.hrl").

%% API
-export([]).

char_position_test() -> ?assertEqual(3, string:chr("321", $1)).
qdqsfd_test() -> ?assertEqual(0, string:chr("321", $e)).