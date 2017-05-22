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

fizzbuzz(X, "", Buzz) when X rem 3 =:= 0 -> fizzbuzz(X, "fizz", Buzz);
fizzbuzz(X, Fizz, "") when X rem 5 =:= 0 -> fizzbuzz(X, Fizz, "buzz");
fizzbuzz(X, "", "") -> X;
fizzbuzz(_, Fizz, Buzz) -> Fizz ++ Buzz.
