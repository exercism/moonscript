CustomSet = require 'custom_set'

describe 'custom-set', ->
  describe 'Returns true if the set contains no elements', ->
    it 'sets with no elements are empty', ->
      set = CustomSet {}
      assert.is.true, set\is_empty!

    pending 'sets with elements are not empty', ->
      set = CustomSet {1}
      assert.is.false, set\is_empty!

  describe 'Sets can report if they contain an element', ->
    pending 'nothing is contained in an empty set', ->
      set = CustomSet {}
      assert.is.false, set\contains 1

    pending 'when the element is in the set', ->
      set = CustomSet {1, 2, 3}
      assert.is.true, set\contains 1

    pending 'when the element is not in the set', ->
      set = CustomSet {1, 2, 3}
      assert.is.false, set\contains 4

  describe 'A set is a subset if all of its elements are contained in the other set', ->
    pending 'empty set is a subset of another empty set', ->
      set1 = CustomSet {}
      set2 = CustomSet {}
      assert.is.true, set1\is_subset set2

    pending 'empty set is a subset of non-empty set', ->
      set1 = CustomSet {}
      set2 = CustomSet {1}
      assert.is.true, set1\is_subset set2

    pending 'non-empty set is not a subset of empty set', ->
      set1 = CustomSet {1}
      set2 = CustomSet {}
      assert.is.false, set1\is_subset set2

    pending 'set is a subset of set with exact same elements', ->
      set1 = CustomSet {1, 2, 3}
      set2 = CustomSet {1, 2, 3}
      assert.is.true, set1\is_subset set2

    pending 'set is a subset of larger set with same elements', ->
      set1 = CustomSet {1, 2, 3}
      set2 = CustomSet {4, 1, 2, 3}
      assert.is.true, set1\is_subset set2

    pending 'set is not a subset of set that does not contain its elements', ->
      set1 = CustomSet {1, 2, 3}
      set2 = CustomSet {4, 1, 3}
      assert.is.false, set1\is_subset set2

  describe 'Sets are disjoint if they share no elements', ->
    pending 'the empty set is disjoint with itself', ->
      set1 = CustomSet {}
      set2 = CustomSet {}
      assert.is.true, set1\is_disjoint set2

    pending 'empty set is disjoint with non-empty set', ->
      set1 = CustomSet {}
      set2 = CustomSet {1}
      assert.is.true, set1\is_disjoint set2

    pending 'non-empty set is disjoint with empty set', ->
      set1 = CustomSet {1}
      set2 = CustomSet {}
      assert.is.true, set1\is_disjoint set2

    pending 'sets are not disjoint if they share an element', ->
      set1 = CustomSet {1, 2}
      set2 = CustomSet {2, 3}
      assert.is.false, set1\is_disjoint set2

    pending 'sets are disjoint if they share no elements', ->
      set1 = CustomSet {1, 2}
      set2 = CustomSet {3, 4}
      assert.is.true, set1\is_disjoint set2

  describe 'Sets with the same elements are equal', ->
    pending 'empty sets are equal', ->
      set1 = CustomSet {}
      set2 = CustomSet {}
      assert.is.true, set1\is_equal set2

    pending 'empty set is not equal to non-empty set', ->
      set1 = CustomSet {}
      set2 = CustomSet {1, 2, 3}
      assert.is.false, set1\is_equal set2

    pending 'non-empty set is not equal to empty set', ->
      set1 = CustomSet {1, 2, 3}
      set2 = CustomSet {}
      assert.is.false, set1\is_equal set2

    pending 'sets with the same elements are equal', ->
      set1 = CustomSet {1, 2}
      set2 = CustomSet {2, 1}
      assert.is.true, set1\is_equal set2

    pending 'sets with different elements are not equal', ->
      set1 = CustomSet {1, 2, 3}
      set2 = CustomSet {1, 2, 4}
      assert.is.false, set1\is_equal set2

    pending 'set is not equal to larger set with same elements', ->
      set1 = CustomSet {1, 2, 3}
      set2 = CustomSet {1, 2, 3, 4}
      assert.is.false, set1\is_equal set2

    pending 'set is equal to a set constructed from an array with duplicates', ->
      set1 = CustomSet {1}
      set2 = CustomSet {1, 1}
      assert.is.true, set1\is_equal set2

  describe 'Unique elements can be added to a set', ->
    pending 'add to empty set', ->
      set = CustomSet {}
      set\add 3
      expected = CustomSet {3}
      assert.is.true set\is_equal expected

    pending 'add to non-empty set', ->
      set = CustomSet {1, 2, 4}
      set\add 3
      expected = CustomSet {1, 2, 3, 4}
      assert.is.true set\is_equal expected

    pending 'adding an existing element does not change the set', ->
      set = CustomSet {1, 2, 3}
      set\add 3
      expected = CustomSet {1, 2, 3}
      assert.is.true set\is_equal expected

  describe 'Intersection returns a set of all shared elements', ->
    pending 'intersection of two empty sets is an empty set', ->
      set1 = CustomSet {}
      set2 = CustomSet {}
      result = set1\intersection set2
      expected = CustomSet {}
      assert.is.true result\is_equal expected

    pending 'intersection of an empty set and non-empty set is an empty set', ->
      set1 = CustomSet {}
      set2 = CustomSet {3, 2, 5}
      result = set1\intersection set2
      expected = CustomSet {}
      assert.is.true result\is_equal expected

    pending 'intersection of a non-empty set and an empty set is an empty set', ->
      set1 = CustomSet {1, 2, 3, 4}
      set2 = CustomSet {}
      result = set1\intersection set2
      expected = CustomSet {}
      assert.is.true result\is_equal expected

    pending 'intersection of two sets with no shared elements is an empty set', ->
      set1 = CustomSet {1, 2, 3}
      set2 = CustomSet {4, 5, 6}
      result = set1\intersection set2
      expected = CustomSet {}
      assert.is.true result\is_equal expected

    pending 'intersection of two sets with shared elements is a set of the shared elements', ->
      set1 = CustomSet {1, 2, 3, 4}
      set2 = CustomSet {3, 2, 5}
      result = set1\intersection set2
      expected = CustomSet {2, 3}
      assert.is.true result\is_equal expected

  describe 'Difference (or Complement) of a set is a set of all elements that are only in the first set', ->
    pending 'difference of two empty sets is an empty set', ->
      set1 = CustomSet {}
      set2 = CustomSet {}
      result = set1\difference set2
      expected = CustomSet {}
      assert.is.true result\is_equal expected

    pending 'difference of empty set and non-empty set is an empty set', ->
      set1 = CustomSet {}
      set2 = CustomSet {3, 2, 5}
      result = set1\difference set2
      expected = CustomSet {}
      assert.is.true result\is_equal expected

    pending 'difference of a non-empty set and an empty set is the non-empty set', ->
      set1 = CustomSet {1, 2, 3, 4}
      set2 = CustomSet {}
      result = set1\difference set2
      expected = CustomSet {1, 2, 3, 4}
      assert.is.true result\is_equal expected

    pending 'difference of two non-empty sets is a set of elements that are only in the first set', ->
      set1 = CustomSet {3, 2, 1}
      set2 = CustomSet {2, 4}
      result = set1\difference set2
      expected = CustomSet {1, 3}
      assert.is.true result\is_equal expected

    pending 'difference removes all duplicates in the first set', ->
      set1 = CustomSet {1, 1}
      set2 = CustomSet {1}
      result = set1\difference set2
      expected = CustomSet {}
      assert.is.true result\is_equal expected

  describe 'Union returns a set of all elements in either set', ->
    pending 'union of empty sets is an empty set', ->
      set1 = CustomSet {}
      set2 = CustomSet {}
      result = set1\union set2
      expected = CustomSet {}
      assert.is.true result\is_equal expected

    pending 'union of an empty set and non-empty set is the non-empty set', ->
      set1 = CustomSet {}
      set2 = CustomSet {2}
      result = set1\union set2
      expected = CustomSet {2}
      assert.is.true result\is_equal expected

    pending 'union of a non-empty set and empty set is the non-empty set', ->
      set1 = CustomSet {1, 3}
      set2 = CustomSet {}
      result = set1\union set2
      expected = CustomSet {1, 3}
      assert.is.true result\is_equal expected

    pending 'union of non-empty sets contains all unique elements', ->
      set1 = CustomSet {1, 3}
      set2 = CustomSet {2, 3}
      result = set1\union set2
      expected = CustomSet {3, 2, 1}
      assert.is.true result\is_equal expected

  -- The next tests are optional.
  -- Set the environment variable BONUS_TESTS to run them:
  -- For example, in bash run:  BONUS_TESTS=true busted

  if os.getenv('BONUS_TESTS') == 'true'
    describe 'Bonus tests', ->
      pending 'use the equal operator, are equal', ->
        set1 = CustomSet {1, 2, 3, 4}
        set2 = CustomSet {4, 3, 1, 2}
        assert.is.true set1 == set2

      pending 'use the equal operator, not equal', ->
        set1 = CustomSet {1, 2, 3, 4}
        set2 = CustomSet {4, 3, 1, 20}
        assert.is.true set1 != set2
