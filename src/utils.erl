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
-export([time/2, to_digits/1]).

time(Func, Arguments) ->
  Start = erlang:monotonic_time(),
  Result = Func(Arguments),
  Stop = erlang:monotonic_time(),
  {Result, Stop - Start}.



to_digits(Number) -> to_digits(Number, []).
to_digits(0, Acc) -> Acc;
to_digits(Number, Acc) -> to_digits(Number div 10, [Number rem 10] ++ Acc).
