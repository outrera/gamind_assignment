-module(main).
-export([start/0]).

start()
  -> {ok, C} = eredis:start_link() # open DB connection
   , eredis:q(C, ["SET", "document", "test_value"])
   , io:fwrite("done!\n")
   .

