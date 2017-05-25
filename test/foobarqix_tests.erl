%%%-------------------------------------------------------------------
%%% @author hadrienmp
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. mai 2017 21:10
%%%-------------------------------------------------------------------
-module(foobarqix_tests).
-author("hadrienmp").
-include_lib("eunit/include/eunit.hrl").

%% API
-export([]).

return_1_for_1_test() -> ?assertEqual("1", foobarqix:foobarqix(1)).
return_foo_for_13_test() -> ?assertEqual("foo", foobarqix:foobarqix(13)).
return_foo_for_3_test() -> ?assertEqual("foofoo", foobarqix:foobarqix(3)).
return_foo_for_15_test() -> ?assertEqual("foobarbar", foobarqix:foobarqix(15)).

multiple_return_empty_for_1_test() -> ?assertEqual("", foobarqix:multiple(1)).
multiple_return_empty_for_2_test() -> ?assertEqual("", foobarqix:multiple(2)).
multiple_return_foo_for_3_test() -> ?assertEqual("foo", foobarqix:multiple(3)).
multiple_return_foo_for_6_test() -> ?assertEqual("foo", foobarqix:multiple(6)).
multiple_return_bar_for_5_test() -> ?assertEqual("bar", foobarqix:multiple(5)).
multiple_return_bar_for_10_test() -> ?assertEqual("bar", foobarqix:multiple(10)).
multiple_return_foobar_for_15_test() -> ?assertEqual("foobar", foobarqix:multiple(3*5)).
multiple_return_foobar_for_30_test() -> ?assertEqual("foobar", foobarqix:multiple(2*3*5)).
multiple_return_qix_for_7_test() -> ?assertEqual("qix", foobarqix:multiple(7)).
multiple_return_qix_for_14_test() -> ?assertEqual("qix", foobarqix:multiple(2*7)).
multiple_return_fooqix_for_21_test() -> ?assertEqual("fooqix", foobarqix:multiple(3*7)).
multiple_return_barqix_for_35_test() -> ?assertEqual("barqix", foobarqix:multiple(5*7)).
multiple_return_foobarqix_for_35_test() -> ?assertEqual("foobarqix", foobarqix:multiple(3*5*7)).

contains_return_empty_for_1_test() -> ?assertEqual("", foobarqix:contains(1)).
contains_return_foo_for_3_test() -> ?assertEqual("foo", foobarqix:contains(3)).
contains_return_foo_for_30_test() -> ?assertEqual("foo", foobarqix:contains(30)).
contains_return_foo_for_13_test() -> ?assertEqual("foo", foobarqix:contains(13)).
contains_return_foo_for_33_test() -> ?assertEqual("foo", foobarqix:contains(33)).
contains_return_bar_for_5_test() -> ?assertEqual("bar", foobarqix:contains(5)).
contains_return_bar_for_50_test() -> ?assertEqual("bar", foobarqix:contains(50)).
contains_return_bar_for_15_test() -> ?assertEqual("bar", foobarqix:contains(15)).
contains_return_bar_for_55_test() -> ?assertEqual("bar", foobarqix:contains(55)).
contains_return_qix_for_77_test() -> ?assertEqual("qix", foobarqix:contains(77)).
contains_return_foobar_for_35_test() -> ?assertEqual("foobar", foobarqix:contains(35)).
contains_5335_test() -> ?assertEqual("foobar", foobarqix:contains(5335)).
contains_753735_test() -> ?assertEqual("foobarqix", foobarqix:contains(753735)).
