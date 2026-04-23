stringx = require 'pl.stringx'
import dump from require 'moon'
import word_list from require 'test_helpers'

bst = (t, level) ->
  dumped = dump t
  dumped = dumped\gsub('%[(.-)%] =', '%1:')
  lines = [indent line, level for line in *(stringx.splitlines dumped)]
  table.concat(lines, "\n")\gsub('{%s+}', 'nil')\gsub('^%s+', '')

{
  module_name: 'BinarySearchTree',

  generate_test: (case, level) ->
    local lines
    switch case.property
      when 'data'
        lines = {
          "tree = BinarySearchTree #{word_list case.input.treeData}"
          "result = tree\\data!"
          "expected = #{bst case.expected, level}",
          "assert.are.same expected, result"
        }
      when 'sortedData'
        lines = {
          "tree = BinarySearchTree #{word_list case.input.treeData}"
          "result = tree\\sorted!"
          "expected = #{word_list case.expected}",
          "assert.are.same expected, result"
        }
    table.concat [indent line, level for line in *lines], '\n'
}
