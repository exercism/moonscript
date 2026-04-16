lpeg = require "lpeg"
import P, V, R, S, C, Ct, Cg from lpeg

-- Learning references:
--   https://www.inf.puc-rio.br/~roberto/lpeg/lpeg.html
--   http://lua-users.org/wiki/LpegTutorial

-- Define some "atomic" patterns that we'll use in the grammar.
escaped_newlines = P"\\\n" / ""
escaped_tabs = P"\\\t" / " "
escaped = P"\\" / "" * C P 1
plain = C 1 - S"]"
-- SGF specifies that tabs and other whitespace characters are converted to spaces, but newlines are preserved.
whitespace = S" \t\r\f\v" / " "

prop_value = P"[" * (Ct((escaped_newlines + escaped_tabs + escaped + whitespace + plain)^0) / table.concat) * P"]"

-- The Grammar
sgf = P {
  "GameTree"

  -- A GameTree is '(' Sequence ')'
  GameTree: P"(" * V"Sequence" * P")"

  -- In Exercism, ;A;B means B is a child of A.
  -- We nest the remainder of the sequence into the 'children' key.
  Sequence: Ct(
    P";" * Cg(V"PropMap", "properties") * Cg(Ct((V"Sequence" + V"Children")^-1), "children")
  )

  -- Maps tags like 'A' to a list of values ['x', 'y']
  PropMap: Ct V"Property"^0
  
  -- A property is a PropIdent followed by one or more PropValues.
  -- We allow zero PropValues here to catch the case of properties without delimiters,
  -- which is invalid but would otherwise be hard to detect.
  Property: Cg C(V"PropIdent") * Ct(V"PropValue"^0)

  -- Variations: Multiple GameTrees inside a node's children list
  Children: V"GameTree"^1

  -- PropIdent is a sequence of uppercase letters, but we allow lowercase letters here to catch
  -- the case of properties containing lowercase, which is invalid but would otherwise be hard to detect.
  PropIdent: (R"AZ" + R"az")^1
  PropValue: prop_value
}

-- The LPEG parser can only capture properties as a sequence of name-value pairs,
-- so we need to remap them into a key-value table.
-- Plus, we have a couple of extra validations to perform.
remap_properties = (tree) ->
  if tree.properties
    props = {}
    for i = 1, #tree.properties, 2
      name, value = tree.properties[i], tree.properties[i + 1]
      assert name\match('^%u+$'), 'property must be in uppercase'
      assert #value > 0, 'properties without delimiter'
      props[name] = value
    tree.properties = props

  if tree.children
    for child in *tree.children
      remap_properties child

{
  parse: (input) ->
    result = sgf\match input
    if not result
      -- The LPEG parser will fail if the input doesn't match the grammar, 
      -- but it won't give us any information about what went wrong.
      -- Add some basic checks to provide more helpful error messages.
      assert #input > 0 and input\match('^%(.*%)$'), 'tree missing'
      assert input\find(';'), 'tree with no nodes'
      error "unspecified parse error"
    
    remap_properties result
    result
}