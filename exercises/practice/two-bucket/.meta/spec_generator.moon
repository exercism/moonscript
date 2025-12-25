{
  module_imports: {'measure'},

  generate_test: (case, level) ->
    local lines
    cmd = "measure bucketOne: #{case.input.bucketOne}, bucketTwo: #{case.input.bucketTwo}, goal: #{case.input.goal}, startBucket: '#{case.input.startBucket}'"

    if case.expected.error
      lines = {
        "assert.has.errors -> #{cmd}"
      }
    else
      lines = {
        "result = #{cmd}",
        "expected = moves: #{case.expected.moves}, goalBucket: '#{case.expected.goalBucket}', otherBucket: #{case.expected.otherBucket}",
        "assert.are.same expected, result"
      }
    table.concat [indent line, level for line in *lines], '\n'
}
