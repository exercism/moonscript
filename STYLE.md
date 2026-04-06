# MoonScript Style Guide

There isn't "one true" style guide.
But as a language that inherits both from Lua and CoffeeScript, let's take inspiration from both.

Note that this guide is not comprehensive, it's just a starting point.

## Lua Style

Start with the [Lua Style Guide][lua-style] from the lua-users wiki.
Read it and note that it takes inspiration from other languages.

## CoffeeScript Style

Like Lua, there is no one single style guide.
I've been looking at [polarmobile/coffeescript-style-guide][coffeescript-style]

## Style Guide

### Significant Whitespace

* use spaces not tabs
* 2-space indentation
* no trailing whitespace on any line.

### Naming

* variable and function names should use either `snake_case` or `camelCase` _but not both_.
* variables intended to be constants can use `SCREAMING_SNAKE_CASE`.
* class names should use `PascalCase`.
* use underscore as a variable names for "throw-away" values, like:

    ```moonscript
    values = [v for _, v in pairs myDict]
    ```

### Return Value of Modules

This is particularly key to Exercism, as all MoonScript exercises are implemented with modules.
We don't have a convention in the implemented exercises.
Pick a style that you think is particularly readable for the module you're creating.

* a module that implements a class might look like this: it returns the class without using the `return` keyword.

  ```moonscript
  class MyClassName
    -- .. class definition here

  MyClassName
  ```

* a module that defines some functions can return the functions defined inside a table (note the colon after the function name):

  ```moonscript
  {
    func1: (args) -> -- ...
    func2: (args) -> -- ...
    -- etc
  }
  ```

* alternately, the functions can be defined locally in the module, and the return table uses the `:` prefix operator:

  ```moonscript
  func1 = (args) -> -- ...
  func2 = (args) -> --...
  -- etc

  { :func1, :func2 }
  ```

### Loops

* use the `*` operator, not `ipairs`

  ```moonscript
  -- Yes
  for elem in *array
  -- No
  for _, elem in ipairs array
  ```

* use list comprehensions where possible, unless a multi-line for loop is much more readable.

  ```moonscript
  -- Yes
  result = [v * 2 for v in *my_list when v % 2 == 0]

  -- No
  results = []
  for v in *my_list
    if v % 2 == 0
      table.insert results, v * 2

  -- Yes
  result = [fn i, j for i = 1, 100 for j = 1, 100]

  -- No
  results = []
  for i = 1, 100
    for j = 1, 100
      table.insert results, fn i, j
  ```

### `is_empty`

Given an arbitrary table, `#tbl == 0` is insufficient to determine if the table is empty.
The `#` length operator only "works" if the table is a _sequence_, with numeric indices starting at 1 with no gaps.

```moonscript
import p from require 'moon'

t = {1, 2, 3, 4}
p {len: #t, next: next(t)}       -- {len: 4, next: 1}

t = {[2]: 2, [3]: 3, [4]: 4}
p {len: #t, next: next(t)}       -- {len: 0, next: 3}
                                 -- non-sequence tables are unordered

t = {foo: 'bar', baz: 'qux'}
p {len: #t, next: next(t)}       -- {len: 0, next: "baz"}
```

The best way to check for emptiness is with the [`next`][lua-next] builtin function:

```moonscript
is_empty = (t) -> not next t

t = {}
p is_empty t    -- true

t = {1, 2, 3}
p is_empty t    -- false

t = {foo: 'bar', baz: 'qux'}
p is_empty t    -- false

```

### Other MoonScript Syntactic Sugar

* for no-argument function definitions, omit the arglist

  ```moonscript
  -- Yes
  f = -> ...
  -- No
  f = () -> ...
  ```

* for calling no-argument functions, prefer `func!` over `func()`
* for class methods, use `@` not `self`

  ```moonscript
  class MyClass
    aMethod: =>
      @instVar = 42
      @helperMethod!
  ```


[lua-style]: http://lua-users.org/wiki/LuaStyleGuide
[coffeescript-style]: https://github.com/polarmobile/coffeescript-style-guide
[lua-next]: https://www.lua.org/manual/5.4/manual.html#pdf-next
