PLANTS = C: 'clover', G: 'grass', R: 'radishes', V: 'violets'

STUDENTS = {
  'Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Fred'
  'Ginny', 'Harriet', 'Ileana', 'Joseph', 'Kincaid', 'Larry'
}

student_index = (student) ->
  for i, s in ipairs STUDENTS
    if s == student
      return i

class KindergartenGarden
  new: (diagram) =>
    @inits = [c for c in diagram\gmatch '[CGRV]']
    @width = #@inits // 2

  plants: (student) =>
    i = student_index student
    indices = {2*i - 1, 2*i, @width + 2*i - 1, @width + 2*i}
    [PLANTS[@inits[i]] for i in *indices]

KindergartenGarden
