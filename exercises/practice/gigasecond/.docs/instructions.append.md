# dummy

## MoonScript-specific instructions

The input and expected datetime strings in the tests are expressed in the UTC timezone.
This is done to remove the effects of daylight saving time in your local timezone.

The key challenge in this exercise is to parse the input timestamp _as if you are in the UTC timezone_.
Lua's builtin `os.time` function simply can't do that.
It can only return the **local** time.
And it's not as simple as adjusting that local time with your timezone offset (in seconds) from UTC:
you need to know the offset _at the moment you are parsing_, not the _current_ offset.

Datetime arithmetic is a **very** complicated topic, and you don't want to have to re-invent that wheel: you want to be able to rely on a well-tested library to get the details right.

The `lua-tz` module works well for this exercise.
It provides `tz.time` and `tz.date` functions that are drop-in replacements for the builtin `os.time` and `os.date` functions, but allow you to provide a timezone name as an extra parameter.

We have provided some additional datetime modules to the MoonScript test runner, if you want to experiment with them.

* `lua-tz`: [luarocks info page][lua-tz-rock], [website][lua-tz-home], [documentation][lua-tz-doc]
* `date`: [luarocks info page][date-rock], [website][date-home], [documentation][date-doc]
* `luatz`: [luarocks info page][luatz-rock], [website][luatz-home], [documentation][luatz-doc]

[lua-tz-rock]: https://luarocks.org/modules/anaef/lua-tz
[lua-tz-home]: https://github.com/anaef/lua-tz#readme
[lua-tz-doc]: https://github.com/anaef/lua-tz/tree/master/doc#readme
[date-rock]: https://luarocks.org/modules/tieske/date
[date-home]: https://github.com/Tieske/date#readme
[date-doc]: https://tieske.github.io/date/
[luatz-rock]: https://luarocks.org/modules/daurnimator/luatz
[luatz-home]: https://github.com/daurnimator/luatz#readme
[luatz-doc]: https://daurnimator.github.io/luatz/
