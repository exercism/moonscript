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

[lua-tests]: https://exercism.org/docs/tracks/lua/tests
[tdd]: https://exercism.org/docs/using/solving-exercises/tdd
