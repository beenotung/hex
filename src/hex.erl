-module(hex).
%% source: https://necrobious.blogspot.hk/2008/03/binary-to-hex-string-back-to-binary-in.html

-export([bin_to_str/1, str_to_bin/1]).

bin_to_str(Bin) ->
  lists:flatten([io_lib:format("~2.16.0B", [X]) ||
    X <- binary_to_list(Bin)]).

str_to_bin(S) ->
  str_to_bin(S, []).
str_to_bin([], Acc) ->
  list_to_binary(lists:reverse(Acc));
str_to_bin([X, Y | T], Acc) ->
  {ok, [V], []} = io_lib:fread("~16u", [X, Y]),
  str_to_bin(T, [V | Acc]).
