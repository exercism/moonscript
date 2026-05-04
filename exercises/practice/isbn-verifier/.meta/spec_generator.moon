import indent, quote from require 'spec_helpers'

{
  module_name: 'Isbn10',
  generate_test: (case, level) ->
    line = "assert.is_#{case.expected} Isbn10.is_valid #{quote case.input.isbn}"
    indent line, level
}
