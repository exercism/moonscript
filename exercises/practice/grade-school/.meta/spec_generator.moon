student_grade = (t) -> "{#{quote t[1]}, #{t[2]}}"

student_grade_list = (list) ->
  students = [student_grade e for e in *list]
  "{#{table.concat students, ', '}}"

string_list = (list) ->
  "{#{table.concat [quote word for word in *list], ', '}}"

bool_list = (list) ->
  "{#{table.concat [tostring b for b in *list], ', '}}"


{
  module_imports: {'roster', 'add', 'grade'}

  generate_test: (case, level) ->
    local lines
    switch case.property
      when 'roster'
        lines = {
          "result = roster #{student_grade_list case.input.students}"
          "expected = #{string_list case.expected}"
        }
      when 'add'
        lines = {
          "result = add #{student_grade_list case.input.students}"
          "expected = #{bool_list case.expected}"
        }
      when 'grade'
        lines = {
          "result = grade #{student_grade_list case.input.students}, #{case.input.desiredGrade}"
          "expected = #{string_list case.expected}"
        }

    table.insert lines, 'assert.are.same expected, result'
    table.concat [indent line, level for line in *lines], '\n'
}
