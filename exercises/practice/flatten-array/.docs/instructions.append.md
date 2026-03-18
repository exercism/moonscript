# dummy

## Moonscript-specific instructions

Lua, and Moonscript, cannot store the value `nil` in a table.
Lua's concept of `nil` is the _absence_ of a value.
Lua uses the assignment of `nil` to a table key to delete that key from the table.

In this exercise, you'll exclude the **string** `"null"` from the flattened array.
