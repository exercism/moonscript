stringx = require 'pl.stringx'
import dump from require 'moon'

bst = (t, level) ->
  dumped = dump t
  dumped = dumped\gsub('%[(.-)%] =', '%1:')
  lines = [indent line, level for line in *(stringx.splitlines dumped)]
  table.concat(lines, "\n")\gsub('{%s+}', 'nil')\gsub('^%s+', '')

string_list = (list) ->
  "{#{table.concat [quote word for word in *list], ', '}}"


{
  module_name: 'BinarySearchTree',

  generate_test: (case, level) ->
    local lines
    switch case.property
      when 'data'
        lines = {
          "tree = BinarySearchTree #{string_list case.input.treeData}"
          "result = tree\\data!"
          "expected = #{bst case.expected, level}",
          "assert.are.same expected, result"
        }
      when 'sortedData'
        lines = {
          "tree = BinarySearchTree #{string_list case.input.treeData}"
          "result = tree\\sorted!"
          "expected = #{string_list case.expected}",
          "assert.are.same expected, result"
        }
    table.concat [indent line, level for line in *lines], '\n'
}
