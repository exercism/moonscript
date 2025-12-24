str_list = (list) ->
  "{#{table.concat [quote word for word in *list], ', '}}"

{
  module_name: 'Allergies',

  generate_test: (case, level) ->
    local lines
    switch case.property
      when 'allergicTo'
        lines = {
          "result = Allergies.allergic_to #{quote case.input.item}, #{case.input.score}",
          "assert.is_#{case.expected} result",
        }
      when 'list'
        lines = {
          "result = Allergies.list #{case.input.score}",
          "expected = #{str_list case.expected}",
          "assert.is.same expected, result",
        }
    table.concat [indent line, level for line in *lines], '\n'
}
