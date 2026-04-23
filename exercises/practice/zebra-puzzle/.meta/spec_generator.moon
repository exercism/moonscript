{
  module_imports: {'drinksWater', 'ownsZebra'},

  generate_test: (case, level) ->
    indent "assert.are.equal #{quote case.expected}, #{case.property}!", level
}
