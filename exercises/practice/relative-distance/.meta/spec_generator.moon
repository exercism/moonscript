import indent, quote, is_json_null, table_dump from require 'spec_helpers'

{
  module_imports: {'degreeOfSeparation'},

  generate_test: (case, level) ->
    local lines
    -- you may want to "switch case.property" here
    lines = {
      "familyTree = #{table_dump case.input.familyTree, level}",
      "result = #{case.property} familyTree, #{quote case.input.personA}, #{quote case.input.personB}",
      "expected = #{if is_json_null case.expected then nil else case.expected}",
      "assert.are.equal expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
