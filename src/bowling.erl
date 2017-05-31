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

-define(STRIKE, 10).
-define(is_spare(First, Second), First + Second == ?STRIKE).

score(Rolls) -> frame_score(Rolls) + bonus(Rolls) + tail_score(Rolls).

frame_score([?STRIKE | _]) -> ?STRIKE;
frame_score([First, Second | _]) -> First + Second.

bonus([?STRIKE, FirstBonus, SecondBonus | _]) -> FirstBonus + SecondBonus;
bonus([First , Second, Bonus | _]) when ?is_spare(First, Second) -> Bonus;
bonus(_) -> 0.

tail_score([_, _]) -> 0;
tail_score([_, _, _]) -> 0;
tail_score([?STRIKE | Tail]) -> score(Tail);
tail_score([_ , _ | Tail]) -> score(Tail).
