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

* [penlight][penlight-home]
* [dkjson][dkjson-home]

**Already available as MoonScript dependencies**

* [LPeg][lpeg-home]
* [LuaFileSystem][lfs-home]

**Datetime**

* [date][date-home]
* [lua-tz][lua-tz-home]
* [luatz][luatz-home]


[lua-tests]: https://exercism.org/docs/tracks/lua/tests
[tdd]: https://exercism.org/docs/using/solving-exercises/tdd
[luarocks]: https://luarocks.org/
[penlight-home]: https://lunarmodules.github.io/Penlight/
[dkjson-home]: https://dkolf.de/dkjson-lua/
[lpeg-home]: https://www.inf.puc-rio.br/~roberto/lpeg/lpeg.html
[lfs-home]: https://lunarmodules.github.io/luafilesystem/
[date-home]: https://github.com/Tieske/date
[lua-tz-home]: https://github.com/anaef/lua-tz
[luatz-home]: https://github.com/daurnimator/luatz
