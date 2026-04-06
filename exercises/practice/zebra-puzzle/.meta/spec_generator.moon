{
  module_imports: {'drinksWater', 'ownsZebra'},

  generate_test: (case, level) ->
    lines = {
      "assert.are.equal #{quote case.expected}, #{case.property}!"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
