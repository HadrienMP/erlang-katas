%%%-------------------------------------------------------------------
%%% @author hadrienmp
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. mai 2020 22:19
%%%-------------------------------------------------------------------
-module(balanced_parenthesis_tests).
-author("hadrienmp").

-include_lib("eunit/include/eunit.hrl").

single_parenthesis_group_test() -> ?assert(balanced("()")).
nested_parenthesis_group_test() -> ?assert(balanced("(())")).
double_nested_parenthesis_group_test() -> ?assert(balanced("((()))")).
succession_of_parenthesis_groups_test() -> ?assert(balanced("()()")).
complex_balanced_test() -> ?assert(balanced("(){[()[]]}([])")).
complex_unbalanced_test() -> ?assertNot(balanced("({[()[]]}([])")).
single_parenthesis_open_test() -> ?assertNot(balanced("(")).
single_parenthesis_close_test() -> ?assertNot(balanced(")")).
one_closed_group_and_too_many_opened_test() -> ?assertNot(balanced("()(")).

balanced([]) -> true;
balanced(Expression) -> balanced([], Expression).

balanced(_, "") ->  false;
balanced(Head, [$(, $) | Tail]) -> balanced(Head ++ Tail);
balanced(Head, [${, $} | Tail]) -> balanced(Head ++ Tail);
balanced(Head, [$[, $] | Tail]) -> balanced(Head ++ Tail);
balanced(Head, [Head2 | Tail]) -> balanced(Head ++ [Head2], Tail).