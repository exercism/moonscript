-- glennj: I used this to create the spec from the canonical data
-- but then I noticed that, by forcing an object to be created from
-- the diagram, the same object can be used to query each student.
-- So, we'll stick with the hand-mofified specs now.
return nil

json = require 'dkjson'
json_string = (s) -> json.encode s

list_of_words = (list) ->
  "{#{table.concat [quote word for word in *list], ', '}}"

{
  module_name: 'KindergartenGarden',

  generate_test: (case, level) ->
    lines = {
      "garden = KindergartenGarden #{json_string case.input.diagram}",
      "result = garden\\#{case.property} #{quote case.input.student}",
      "expected = #{list_of_words case.expected}",
      "assert.are.same expected, result"
    }
    table.concat [indent line, level for line in *lines], '\n'
}
