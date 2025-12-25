int_list = (list) -> "{#{table.concat list, ', '}}"

int_lists = (lists) ->
  "{#{table.concat [int_list list for list in *lists], ', '}}"


{
  module_name: 'PalindromeProducts',

  generate_test: (case, level) ->
    local lines
    if case.expected.error
      lines = {
        "f = -> PalindromeProducts.#{case.property} #{case.input.min}, #{case.input.max}",
        "assert.has.errors f, #{quote case.expected.error}",
      }
    else
      lines = {
        "palindrome, factors = PalindromeProducts.#{case.property} #{case.input.min}, #{case.input.max}",
        "expected_palindrome = #{case.expected.value}",
        "expected_factors    = #{int_lists case.expected.factors}",
        "assert.are.equal expected_palindrome, palindrome",
        "assert.are.same  expected_factors, factors",
      }
    table.concat [indent line, level for line in *lines], '\n'
}
