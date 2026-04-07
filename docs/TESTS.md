# Testing on the MoonScript Track

Testing on the MoonScript track is exactly like [testing on the Lua track][lua-tests].
From an exercise directory, enter:

```console
$ busted
```

## Pending tests

This track follows Exercism's [Test-Driven Development][tdd] methodology.
You are given a complete test suite, but only the first test is "active".

To enable the tests, change a test's command from `pending` to `it`.

For those of you that like to run all the tests all the time, you can use a command-line tool to change them all at once.
Here's an example using perl (which is installed just about everywhere):

```console
$ perl -i -pe 's/^\s+\Kpending\b/it/' two_fer_spec.moon
```

When you are working in the online editor, the test runner will automatically run all the tests.

## Using LuaRocks

Lua by itself is a very small language.
[LuaRocks][luarocks] is the package manager for Lua modules.

You are free to use any module in your solutions, but not all of them will be available in the online test-runner.
The test-runner provides these:

**Already available as `busted` dependencies**

* [penlight][penlight] ([home][penlight-home])

  > Penlight is a set of pure Lua libraries for making it easier to work with common tasks like iterating over directories, reading configuration files and the like. Provides functional operations on tables and sequences.

* [dkjson][dkjson] ([home][dkjson-home])

  > dkjson is a module for encoding and decoding JSON data. 

**Already available as MoonScript dependencies**

* [LPeg][lpeg] ([home][lpeg-home])

  > LPeg is a new pattern-matching library for Lua, based on Parsing Expression Grammars (PEGs). 

* [LuaFileSystem][lfs] ([home][lfs-home])

  > LuaFileSystem offers a portable way to access the underlying directory structure and file attributes.

**Datetime**

* [date][date] ([github][date-home])

  > Date and Time string parsing; Time addition and subtraction; Time span calculation; Supports ISO 8601 Dates. 

* [lua-tz][lua-tz] ([github][lua-tz-home])

  > Lua TZ provides date and time functions with support for time zones. The core functions have an interface similar to the standard functions os.date and os.time, but additionally accept a time zone argument.

* [luatz][luatz] ([github][luatz-home])

  > A lua library for time and date manipulation.


[lua-tests]: https://exercism.org/docs/tracks/lua/tests
[tdd]: https://exercism.org/docs/using/solving-exercises/tdd
[luarocks]: https://luarocks.org/
[penlight]: https://luarocks.org/modules/tieske/penlight
[penlight-home]: https://lunarmodules.github.io/Penlight/
[dkjson]: https://luarocks.org/modules/dhkolf/dkjson
[dkjson-home]: https://dkolf.de/dkjson-lua/
[lpeg]: https://luarocks.org/modules/gvvaughan/lpeg
[lpeg-home]: https://www.inf.puc-rio.br/~roberto/lpeg/lpeg.html
[lfs]: https://luarocks.org/modules/hisham/luafilesystem
[lfs-home]: https://lunarmodules.github.io/luafilesystem/
[date]: https://luarocks.org/modules/tieske/date
[date-home]: https://github.com/Tieske/date
[lua-tz]: https://luarocks.org/modules/anaef/lua-tz
[lua-tz-home]: https://github.com/anaef/lua-tz
[luatz]: https://luarocks.org/modules/daurnimator/luatz
[luatz-home]: https://github.com/daurnimator/luatz
