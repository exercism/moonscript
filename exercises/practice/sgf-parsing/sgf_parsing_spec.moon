SGFParser = require 'sgf_parsing'

describe 'sgf-parsing', ->
  assert\set_parameter "TableFormatLevel", 5

  it 'empty input', ->
    f = -> SGFParser.parse ""
    assert.has_error f, 'tree missing'

  pending 'tree with no nodes', ->
    f = -> SGFParser.parse "()"
    assert.has_error f, 'tree with no nodes'

  pending 'node without tree', ->
    f = -> SGFParser.parse ";"
    assert.has_error f, 'tree missing'

  pending 'node without properties', ->
    result = SGFParser.parse "(;)"
    expected = {
      children: {}
      properties: {}
    }
    assert.are.same expected, result

  pending 'single node tree', ->
    result = SGFParser.parse "(;A[B])"
    expected = {
      children: {}
      properties: {
        A: {"B"}
      }
    }
    assert.are.same expected, result

  pending 'multiple properties', ->
    result = SGFParser.parse "(;A[b]C[d])"
    expected = {
      children: {}
      properties: {
        C: {"d"}
        A: {"b"}
      }
    }
    assert.are.same expected, result

  pending 'properties without delimiter', ->
    f = -> SGFParser.parse "(;A)"
    assert.has_error f, 'properties without delimiter'

  pending 'all lowercase property', ->
    f = -> SGFParser.parse "(;a[b])"
    assert.has_error f, 'property must be in uppercase'

  pending 'upper and lowercase property', ->
    f = -> SGFParser.parse "(;Aa[b])"
    assert.has_error f, 'property must be in uppercase'

  pending 'two nodes', ->
    result = SGFParser.parse "(;A[B];B[C])"
    expected = {
      children: {{
          children: {}
          properties: {
            B: {"C"}
          }
        }}
      properties: {
        A: {"B"}
      }
    }
    assert.are.same expected, result

  pending 'two child trees', ->
    result = SGFParser.parse "(;A[B](;B[C])(;C[D]))"
    expected = {
      children: {{
          children: {}
          properties: {
            B: {"C"}
          }
        }, {
          children: {}
          properties: {
            C: {"D"}
          }
        }}
      properties: {
        A: {"B"}
      }
    }
    assert.are.same expected, result

  pending 'multiple property values', ->
    result = SGFParser.parse "(;A[b][c][d])"
    expected = {
      children: {}
      properties: {
        A: {"b", "c", "d"}
      }
    }
    assert.are.same expected, result

  pending 'within property values, whitespace characters such as tab are converted to spaces', ->
    result = SGFParser.parse "(;A[hello\t\tworld])"
    expected = {
      children: {}
      properties: {
        A: {"hello  world"}
      }
    }
    assert.are.same expected, result

  pending 'within property values, newlines remain as newlines', ->
    result = SGFParser.parse "(;A[hello\n\nworld])"
    expected = {
      children: {}
      properties: {
        A: {"hello\n\nworld"}
      }
    }
    assert.are.same expected, result

  pending 'escaped closing bracket within property value becomes just a closing bracket', ->
    result = SGFParser.parse "(;A[\\]])"
    expected = {
      children: {}
      properties: {
        A: {"]"}
      }
    }
    assert.are.same expected, result

  pending 'escaped backslash in property value becomes just a backslash', ->
    result = SGFParser.parse "(;A[\\\\])"
    expected = {
      children: {}
      properties: {
        A: {"\\"}
      }
    }
    assert.are.same expected, result

  pending "opening bracket within property value doesn't need to be escaped", ->
    result = SGFParser.parse "(;A[x[y\\]z][foo]B[bar];C[baz])"
    expected = {
      children: {{
          children: {}
          properties: {
            C: {"baz"}
          }
        }}
      properties: {
        B: {"bar"}
        A: {"x[y]z", "foo"}
      }
    }
    assert.are.same expected, result

  pending "semicolon in property value doesn't need to be escaped", ->
    result = SGFParser.parse "(;A[a;b][foo]B[bar];C[baz])"
    expected = {
      children: {{
          children: {}
          properties: {
            C: {"baz"}
          }
        }}
      properties: {
        B: {"bar"}
        A: {"a;b", "foo"}
      }
    }
    assert.are.same expected, result

  pending "parentheses in property value don't need to be escaped", ->
    result = SGFParser.parse "(;A[x(y)z][foo]B[bar];C[baz])"
    expected = {
      children: {{
          children: {}
          properties: {
            C: {"baz"}
          }
        }}
      properties: {
        B: {"bar"}
        A: {"x(y)z", "foo"}
      }
    }
    assert.are.same expected, result

  pending 'escaped tab in property value is converted to space', ->
    result = SGFParser.parse "(;A[hello\\\tworld])"
    expected = {
      children: {}
      properties: {
        A: {"hello world"}
      }
    }
    assert.are.same expected, result

  pending 'escaped newline in property value is converted to nothing at all', ->
    result = SGFParser.parse "(;A[hello\\\nworld])"
    expected = {
      children: {}
      properties: {
        A: {"helloworld"}
      }
    }
    assert.are.same expected, result

  pending 'escaped t and n in property value are just letters, not whitespace', ->
    result = SGFParser.parse "(;A[\\t = t and \\n = n])"
    expected = {
      children: {}
      properties: {
        A: {"t = t and n = n"}
      }
    }
    assert.are.same expected, result

  pending 'mixing various kinds of whitespace and escaped characters in property value', ->
    result = SGFParser.parse "(;A[\\]b\nc\\\nd\t\te\\\\ \\\n\\]])"
    expected = {
      children: {}
      properties: {
        A: {"]b\ncd  e\\ ]"}
      }
    }
    assert.are.same expected, result
