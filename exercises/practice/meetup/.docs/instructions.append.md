# dummy

## MoonScript-specific instructions

You'll need to use Lua's builtin [`os.date`][lua-os-date] and [`os.time`][lua-os-time] functions in this exercise.

- `os.time(tbl)` converts a table containing a "date time specification" into an integer value.
  The argument is a table containing keys "year", "month", and "day"; and optionally "hour", "min", "sec", and "isdst".

- `os.date(format, time)` converts an integer time value into a formatted string.
  The format string is described in your [`strftime(3)`][strftime] man page.

[lua-os-date]: https://www.lua.org/manual/5.4/manual.html#pdf-os.date
[lua-os-time]: https://www.lua.org/manual/5.4/manual.html#pdf-os.time
[strftime]: https://manpage.me/index.cgi?apropos=0&q=strftime&sektion=3&manpath=Debian+8.1.0&arch=default&format=html
