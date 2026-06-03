import indent, int_list, int_lists, table_dump from require 'spec_helpers'

{
  module_name: 'ListOps',

  generate_test: (case, level) ->
    lines = switch case.property
      when 'append'
        {
          "result = ListOps.append #{int_list case.input.list1}, #{int_list case.input.list2}",
          "expected = #{int_list case.expected}",
          "assert.are.same expected, result"
        }
      when 'concat'
        input = table_dump case.input.lists, level
        {
          "result = ListOps.concat #{input}",
          "expected = #{table_dump case.expected, level}",
          "assert.are.same expected, result"
        }
      when 'filter'
        func = case.input.function\gsub 'modulo', '%%'
        {
          "result = ListOps.filter #{int_list case.input.list}, #{func}",
          "expected = #{int_list case.expected}",
          "assert.are.same expected, result"
        }
      when 'length'
        {
          "result = ListOps.length #{int_list case.input.list}",
          "expected = #{case.expected}",
          "assert.are.equal expected, result"
        }
      when 'map'
        {
          "result = ListOps.map #{int_list case.input.list}, #{case.input.function}",
          "expected = #{int_list case.expected}",
          "assert.are.same expected, result"
        }
      when 'foldl'
        func = case.input.function
        {
          "result = ListOps.foldl #{int_list case.input.list}, #{case.input.initial}, #{func}",
          "expected = #{case.expected}",
          "assert.are.equal expected, result"
        }
      when 'foldr'
        func = case.input.function
        {
          "result = ListOps.foldr #{int_list case.input.list}, #{case.input.initial}, #{func}",
          "expected = #{case.expected}",
          "assert.are.equal expected, result"
        }
      when 'reverse'
        {
          "result = ListOps.reverse #{table_dump case.input.list, level}",
          "expected = #{table_dump case.expected, level}",
          "assert.are.same expected, result"
        }

    table.concat [indent line, level for line in *lines], '\n'
}
