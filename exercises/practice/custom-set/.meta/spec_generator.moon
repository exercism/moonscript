int_list = (list) -> "{#{table.concat list, ', '}}"

{
  module_name: 'CustomSet',

  generate_test: (case, level) ->
    local lines
    switch case.property
      when 'empty'
        lines = {
          "set = CustomSet #{int_list case.input.set}",
          "assert.is.#{case.expected}, set\\is_empty!"
        }
      when 'contains'
        lines = {
          "set = CustomSet #{int_list case.input.set}",
          "assert.is.#{case.expected}, set\\#{case.property} #{case.input.element}"
        }
      when 'subset', 'disjoint', 'equal'
        lines = {
          "set1 = CustomSet #{int_list case.input.set1}",
          "set2 = CustomSet #{int_list case.input.set2}",
          "assert.is.#{case.expected}, set1\\is_#{case.property} set2"
        }
      when 'add'
        lines = {
          "set = CustomSet #{int_list case.input.set}",
          "set\\#{case.property} #{case.input.element}"
          "expected = CustomSet #{int_list case.expected}"
          "assert.is.true set\\is_equal expected"
        }
      when 'intersection', 'difference', 'union'
        lines = {
          "set1 = CustomSet #{int_list case.input.set1}",
          "set2 = CustomSet #{int_list case.input.set2}",
          "result = set1\\#{case.property} set2"
          "expected = CustomSet #{int_list case.expected}"
          "assert.is.true result\\is_equal expected"
        }
    table.concat [indent line, level for line in *lines], '\n'

  -- bonus tests are a multiline string indented with 6 spaces
  bonus: [[
      pending 'use the equal operator, are equal', ->
        set1 = CustomSet {1, 2, 3, 4}
        set2 = CustomSet {4, 3, 1, 2}
        assert.is.true set1 == set2

      pending 'use the equal operator, not equal', ->
        set1 = CustomSet {1, 2, 3, 4}
        set2 = CustomSet {4, 3, 1, 20}
        assert.is.true set1 != set2
]]
}
