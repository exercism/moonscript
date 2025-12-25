# dummy

## MoonScript-specific instructions

This is an object-oriented exercise: you're implementing ComplexNumbers as a class.

The tests will be comparing two complex number instances for equality.
This means your class will have to implement the `__eq` [metamethod][metamethods].

The tests also perform arithmetic operations on complex numbers, so there are arithmetic metamethods to implement.

~~~~exercism/caution
Some of the complex number functions will be doing math with floating point numbers.
Your "equality" will have to deal with numbers being _approximately equal_.
~~~~

[metamethods]: https://www.lua.org/manual/5.4/manual.html#2.4
