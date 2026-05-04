import indent, quote from require 'spec_helpers'

{
  module_name: 'RomanNumerals',

  generate_test: (case, level) ->
    indent "assert.are.equal #{quote case.expected}, RomanNumerals.to_roman #{case.input.number}", level
}
