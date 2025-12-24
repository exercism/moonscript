import is_equilateral, is_isosceles, is_scalene from require 'triangle'

describe 'triangle', ->
  describe 'equilateral triangle', ->
    it 'all sides are equal', ->
      assert.is_true is_equilateral(2, 2, 2)

    pending 'any side is unequal', ->
      assert.is_false is_equilateral(2, 3, 2)

    pending 'no sides are equal', ->
      assert.is_false is_equilateral(5, 4, 6)

    pending 'all zero sides is not a triangle', ->
      assert.is_false is_equilateral(0, 0, 0)

    pending 'sides may be floats', ->
      assert.is_true is_equilateral(0.5, 0.5, 0.5)

  describe 'isosceles triangle', ->
    pending 'last two sides are equal', ->
      assert.is_true is_isosceles(3, 4, 4)

    pending 'first two sides are equal', ->
      assert.is_true is_isosceles(4, 4, 3)

    pending 'first and last sides are equal', ->
      assert.is_true is_isosceles(4, 3, 4)

    pending 'equilateral triangles are also isosceles', ->
      assert.is_true is_isosceles(4, 4, 4)

    pending 'no sides are equal', ->
      assert.is_false is_isosceles(2, 3, 4)

    pending 'first triangle inequality violation', ->
      assert.is_false is_isosceles(1, 1, 3)

    pending 'second triangle inequality violation', ->
      assert.is_false is_isosceles(1, 3, 1)

    pending 'third triangle inequality violation', ->
      assert.is_false is_isosceles(3, 1, 1)

    pending 'sides may be floats', ->
      assert.is_true is_isosceles(0.5, 0.4, 0.5)

  describe 'scalene triangle', ->
    pending 'no sides are equal', ->
      assert.is_true is_scalene(5, 4, 6)

    pending 'all sides are equal', ->
      assert.is_false is_scalene(4, 4, 4)

    pending 'first and second sides are equal', ->
      assert.is_false is_scalene(4, 4, 3)

    pending 'first and third sides are equal', ->
      assert.is_false is_scalene(3, 4, 3)

    pending 'second and third sides are equal', ->
      assert.is_false is_scalene(4, 3, 3)

    pending 'may not violate triangle inequality', ->
      assert.is_false is_scalene(7, 3, 2)

    pending 'sides may be floats', ->
      assert.is_true is_scalene(0.5, 0.4, 0.6)
