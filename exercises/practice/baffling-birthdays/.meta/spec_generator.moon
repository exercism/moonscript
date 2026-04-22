tablex = require 'pl.tablex'

int_list = (list) -> "{#{table.concat list, ', '}}"

string_list = (list) ->
  "{#{table.concat [quote word for word in *list], ', '}}"

{
  module_name: 'BafflingBirthdays',

  generate_test: (case, level) ->
    local lines
    switch case.property
      when 'sharedBirthday'
        lines = {
          "birthdates = #{string_list case.input.birthdates}",
          "assert.is.#{case.expected} BafflingBirthdays.#{case.property} birthdates",
        }
      when 'estimatedProbabilityOfSharedBirthday'
        lines = {
          "result = BafflingBirthdays.#{case.property} #{case.input.groupSize}",
          "assert.is.approx_equal #{case.expected}, result"
        }
      when 'randomBirthdates'
        switch case.description
          when "generate requested number of birthdates"
            lines = {
              "result = true",
              "for n = 1, 100",
              "  birthdates = BafflingBirthdays.randomBirthdates n",
              "  result = result and (#birthdates == n)",
              "assert.is.true result"
            }
          when "years are not leap years"
            lines = {
              "result = true",
              "for birthdate in *BafflingBirthdays.randomBirthdates(100)",
              "  year = birthdate\\sub 1, 4"
              "  result = result and not isLeapYear tonumber(year)",
              "assert.is.true result"
            }
          when "months are random"
            lines = {
              "months = tablex.new 12, 0",
              "for birthdate in *BafflingBirthdays.randomBirthdates(100)",
              "  month = tonumber birthdate\\sub 6, 7"
              "  assert.is.true 1 <= month and month <= 12",
              "  months[month] += 1",
              "notSeen = [month for month,count in pairs months when count == 0]",
              "assert.is.equal 0, #notSeen"
            }
          when "days are random"
            lines = {
              "days = tablex.new 31, 0",
              "for birthdate in *BafflingBirthdays.randomBirthdates(300)",
              "  day = tonumber birthdate\\sub 9, 10"
              "  assert.is.true 1 <= day and day <= 31",
              "  days[day] += 1",
              "notSeen = [day for day,count in pairs days when count == 0]",
              "assert.is.equal 0, #notSeen"
            }
    table.concat [indent line, level for line in *lines], '\n'


  test_helpers: [[
  -- ----------------------------------------
  -- https://lunarmodules.github.io/Penlight/libraries/pl.tablex.html
  tablex = require 'pl.tablex'

  --
  epsilon = 0.5
  is_close_to = (state, arguments) ->
    {a, b} = arguments
    math.abs(a - b) <= epsilon

  say = require 'say'
  say\set 'assertion.approx_equal.positive', "Expected %s and %s to be within #{epsilon}"
  say\set 'assertion.approx_equal.negative', "Expected %s and %s not to be within #{epsilon}"
  assert\register 'assertion', 'approx_equal', is_close_to, 'assertion.approx_equal.positive', 'assertion.approx_equal.negative'

  --
  isLeapYear = (year) -> year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)
  -- ----------------------------------------
]]
}
