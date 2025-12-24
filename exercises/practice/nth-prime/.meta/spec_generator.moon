{
  module_imports: {'prime'},

  generate_test: (case, level) ->
    if type(case.expected) == 'number'
      indent "assert.are.equal #{case.expected}, prime #{case.input.number}", level
    else
      indent "assert.has.errors (-> prime #{case.input.number}), #{quote case.expected.error}", level
}
