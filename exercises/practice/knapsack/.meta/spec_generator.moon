import table_list from require 'test_helpers'

{
  module_imports: {'maximumValue'},

  generate_test: (case, level) ->
    lines = {
      "items = #{table_list case.input.items, level}",
      "maxWeight = #{case.input.maximumWeight}",
      "result = maximumValue maxWeight, items",
      "assert.are.equal #{case.expected}, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
