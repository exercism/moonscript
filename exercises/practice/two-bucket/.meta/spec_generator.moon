import table_tostring_ordered from require 'test_helpers'

{
  module_imports: {'measure'},

  generate_test: (case, level) ->
    cmd = "measure bucketOne: #{case.input.bucketOne}, bucketTwo: #{case.input.bucketTwo}, goal: #{case.input.goal}, startBucket: '#{case.input.startBucket}'"
    lines = if case.expected.error
      { "assert.has.errors -> #{cmd}" }
    else
      {
        "result = #{cmd}",
        "expected = moves: #{case.expected.moves}, goalBucket: '#{case.expected.goalBucket}', otherBucket: #{case.expected.otherBucket}",
        "assert.are.same expected, result"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
