%%%-------------------------------------------------------------------
%%% @author hadrienmp
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. mai 2017 15:27
%%%-------------------------------------------------------------------
-module(utils).
-author("hadrienmp").

%% API
-export([time/2]).

time(Func, Arguments) ->
  Start = erlang:monotonic_time(),
  Result = Func(Arguments),
  Stop = erlang:monotonic_time(),
  {Result, Stop - Start}.