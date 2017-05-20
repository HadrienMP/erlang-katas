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


fizzbuzz(X) -> fizzbuzz(X, fizz(X) ++ buzz(X)).

fizzbuzz(X, "") -> erlang:integer_to_list(X);
fizzbuzz(_, Result) -> Result.

fizz(X) when X rem 3 =:= 0 -> "fizz";
fizz(_) -> "".

buzz(X) when X rem 5 =:= 0 -> "buzz";
buzz(_) -> "".