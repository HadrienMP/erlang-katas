%%%-------------------------------------------------------------------
%%% @author hadrienmp
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. mai 2017 21:14
%%%-------------------------------------------------------------------
-module(foobarqix).
-author("hadrienmp").

%% API
-export([]).

-export([foobarqix/1, multiple/1, contains/1]).

foobarqix(X) ->
  FooBarQix = multiple(X) ++ contains(X),
  if
    "" == FooBarQix -> erlang:integer_to_list(X);
    true -> FooBarQix
  end.

multiple(X) -> multiple(X, "", "", "").

multiple(X, "", Bar, Qix) when X rem 3 =:= 0 -> multiple(X, "foo", Bar, Qix);
multiple(X, Foo, "", Qix) when X rem 5 =:= 0 -> multiple(X, Foo, "bar", Qix);
multiple(X, Foo, Bar, "") when X rem 7 =:= 0 -> multiple(X, Foo, Bar, "qix");
multiple(_, Foo, Bar, Qix) -> Foo ++ Bar ++ Qix.


contains(X) -> contains(utils:to_digits(X), "", "", "").

contains([3|Tail], "", Bar, Qix) -> contains(Tail, "foo", Bar, Qix);
contains([5|Tail], Foo, "", Qix) -> contains(Tail, Foo, "bar", Qix);
contains([7|Tail], Foo, Bar, "") -> contains(Tail, Foo, Bar, "qix");
contains([_|Tail], Foo, Bar, Qix) -> contains(Tail, Foo, Bar, Qix);
contains([], Foo, Bar, Qix) -> Foo ++ Bar ++ Qix.