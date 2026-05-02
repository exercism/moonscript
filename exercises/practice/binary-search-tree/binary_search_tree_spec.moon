BinarySearchTree = require 'binary_search_tree'

describe 'binary-search-tree:', ->
  it 'data is retained', ->
    tree = BinarySearchTree {'4'}
    result = tree\data!
    expected = {
        data: "4"
        right: nil
        left: nil
    }
    assert.are.same expected, result

  describe 'insert data at proper node:', ->
    pending 'smaller number at left node', ->
      tree = BinarySearchTree {'4', '2'}
      result = tree\data!
      expected = {
          data: "4"
          right: nil
          left: {
              data: "2"
              right: nil
              left: nil
          }
      }
      assert.are.same expected, result

    pending 'same number at left node', ->
      tree = BinarySearchTree {'4', '4'}
      result = tree\data!
      expected = {
          data: "4"
          right: nil
          left: {
              data: "4"
              right: nil
              left: nil
          }
      }
      assert.are.same expected, result

    pending 'greater number at right node', ->
      tree = BinarySearchTree {'4', '5'}
      result = tree\data!
      expected = {
          data: "4"
          right: {
              data: "5"
              right: nil
              left: nil
          }
          left: nil
      }
      assert.are.same expected, result

  pending 'can create complex tree', ->
    tree = BinarySearchTree {'4', '2', '6', '1', '3', '5', '7'}
    result = tree\data!
    expected = {
        data: "4"
        right: {
            data: "6"
            right: {
                data: "7"
                right: nil
                left: nil
            }
            left: {
                data: "5"
                right: nil
                left: nil
            }
        }
        left: {
            data: "2"
            right: {
                data: "3"
                right: nil
                left: nil
            }
            left: {
                data: "1"
                right: nil
                left: nil
            }
        }
    }
    assert.are.same expected, result

  describe 'can sort data:', ->
    pending 'can sort single number', ->
      tree = BinarySearchTree {'2'}
      result = tree\sorted!
      expected = {'2'}
      assert.are.same expected, result

    pending 'can sort if second number is smaller than first', ->
      tree = BinarySearchTree {'2', '1'}
      result = tree\sorted!
      expected = {'1', '2'}
      assert.are.same expected, result

    pending 'can sort if second number is same as first', ->
      tree = BinarySearchTree {'2', '2'}
      result = tree\sorted!
      expected = {'2', '2'}
      assert.are.same expected, result

    pending 'can sort if second number is greater than first', ->
      tree = BinarySearchTree {'2', '3'}
      result = tree\sorted!
      expected = {'2', '3'}
      assert.are.same expected, result

    pending 'can sort complex tree', ->
      tree = BinarySearchTree {'2', '1', '3', '6', '7', '5'}
      result = tree\sorted!
      expected = {'1', '2', '3', '5', '6', '7'}
      assert.are.same expected, result
