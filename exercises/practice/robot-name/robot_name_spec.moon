import p from require 'moon'

Robot = require 'robot_name'

-- ------------------------------------------------------------
table_size = (t) ->
  -- because `#t` is insufficient for non-sequence tables
  count = 0
  count += 1 for _ in pairs t
  count

match = (state, arguments) ->
  {str, patt} = arguments
  string.match str, patt

say = require 'say'
say\set 'assertion.match.positive', 'Expected %s to match pattern %s.'
say\set 'assertion.match.negative', 'Expected %s not to match pattern %s.'
assert\register 'assertion', 'match', match, 'assertion.match.positive', 'assertion.match.negative'
-- ------------------------------------------------------------

describe 'robot-name', ->
  describe 'one robot', ->
    it 'a robot has a name', ->
      robot = Robot!
      name = robot\name!
      assert.is.match name, '^[A-Z][A-Z][0-9][0-9][0-9]$'

    pending 'name does not change', ->
      robot = Robot!
      name1 = robot\name!
      name2 = robot\name!
      assert.are.equal name1, name2

    pending 'reset changes name', ->
      robot = Robot!
      name1 = robot\name!
      robot\reset!
      name2 = robot\name!
      assert.not.equal name1, name2

    pending 'reset before name called does not cause an error', ->
      f = ->
        robot = Robot!
        robot\reset!
        robot\name!
      assert.has_no.errors f
        
  describe 'two robots', ->
    pending 'different robots have different names', ->
      r1 = Robot!
      r2 = Robot!
      assert.not.equal r1\name!, r2\name!

    pending 'names must be random not consecutive', ->
      Robot\reset_names!
      n = 10
      diffs = {}
      for _ = 1, n
        n1 = Robot!\name!
        n2 = Robot!\name!
        -- a robot name is a valid base-36 number
        diff = math.abs(tonumber(n1, 36) - tonumber(n2, 36))
        diffs[diff] = (diffs[diff] or 0) + 1

      assert.not.equal 1, table_size diffs

  describe 'lots of robots', ->
    pending 'generate lots of robots', ->
      iterations = 100000
      seen = {}
      for i = 1, iterations
        name = Robot!\name!
        seen[name] = (seen[name] or 0) + 1
      distinct_names = [k for k,v in pairs seen when v == 1]
      assert.is.equal iterations, #distinct_names

    pending 'generate all the robots', ->
      Robot\reset_names!
      iterations = 26 * 26 * 1000
      seen = {}
      for i = 1, iterations
        name = Robot!\name!
        seen[name] = (seen[name] or 0) + 1
      distinct_names = [k for k,v in pairs seen when v == 1]
      assert.is.equal iterations, #distinct_names

      -- generate the 676,001st robot
      f = -> Robot!
      assert.has_error f, 'out of names'
