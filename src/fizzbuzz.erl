%%%-------------------------------------------------------------------
%%% @author hadrienmp
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. mai 2017 12:02
%%%-------------------------------------------------------------------
-module(fizzbuzz).
-author("hadrienmp").

%% API
-export([fizzbuzz/1]).


fizzbuzz(X) -> fizzbuzz(X, "", "").

fizzbuzz(X, _, Buzz) when X rem 3 =:= 0 -> fizzbuzz(X div 3, "fizz", Buzz);
fizzbuzz(X, Fizz, _) when X rem 5 =:= 0 -> fizzbuzz(X div 5, Fizz, "buzz");
fizzbuzz(X, "", "") -> erlang:integer_to_list(X);
fizzbuzz(_, Fizz, Buzz) -> Fizz ++ Buzz.
