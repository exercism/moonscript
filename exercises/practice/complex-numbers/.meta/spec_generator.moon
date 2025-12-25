op = add: '+', sub: '-', mul: '*', div: '/'

cn = (z) ->
  switch type(z)
    when 'number' then z
    when 'table'  then "ComplexNumber(#{z[1]}, #{z[2]})"


require 'moon.all'
{
  module_imports: {'ComplexNumber', 'add', 'sub', 'mul', 'div'},

  test_helpers: [[
  pi = math.pi
  e  = math.exp(1)
  ln = math.log
]]

  generate_test: (case, level) ->
    local lines
    switch case.property
      when 'real', 'imaginary', 'abs'
        lines = {
          "c = #{cn case.input.z}",
          "result = c\\#{case.property}!",
          "assert.are.equal #{case.expected}, result"
        }
      when 'add', 'sub', 'mul', 'div'
        if type(case.input.z1) == 'number' or type(case.input.z2) == 'number'
          lines = {
            "result = #{case.property} #{cn case.input.z1}, #{cn case.input.z2}",
            "expected = #{cn case.expected}",
            "assert.are.equal expected, result"
          }
        else
          lines = {
            "c1 = #{cn case.input.z1}",
            "c2 = #{cn case.input.z2}",
            "result = c1 #{op[case.property]} c2",
            "expected = #{cn case.expected}",
            "assert.are.equal expected, result"
          }
      when 'conjugate', 'exp'
        lines = {
          "c = #{cn case.input.z}",
          "result = c\\#{case.property}!",
          "expected = #{cn case.expected}",
          "assert.are.equal expected, result"
        }

    table.concat [indent line, level for line in *lines], '\n'
}
