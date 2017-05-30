%%%-------------------------------------------------------------------
%%% @author hadrienmp
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. mai 2017 20:56
%%%-------------------------------------------------------------------
-module(bowling).
-author("hadrienmp").

%% API
-export([score/1]).

score(Rolls) -> frame_score(Rolls) + bonus(Rolls) + tail_score(Rolls).

frame_score([10 | _]) -> 10;
frame_score([First | [Second | _]]) -> First + Second.

bonus([10 | Tail]) -> lists:nth(1, Tail) + lists:nth(2, Tail);
bonus([First | [Second | Tail]]) when First + Second == 10 -> lists:nth(1, Tail);
bonus(_) -> 0.

tail_score([_, _]) -> 0;
tail_score([_, _, _]) -> 0;
tail_score([10 | Tail]) -> score(Tail);
tail_score([_ | [_ | Tail]]) -> score(Tail).
