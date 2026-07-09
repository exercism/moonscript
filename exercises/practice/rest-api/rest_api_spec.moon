RestApi = require 'rest_api'

assert\set_parameter "TableFormatLevel", 4

describe 'rest-api:', ->
  describe 'user management:', ->
  it 'no users', ->
    database = {
      users: {}
    }
    api = RestApi database
    
    result = api\GET '/users'
    expected = {
      users: {}
    }
    assert.are.same expected, result

  pending 'add user', ->
    database = {
      users: {}
    }
    api = RestApi database
    payload = {
      user: 'Adam'
    }
    result = api\POST '/add', payload
    expected = {
      balance: 0.0
      name: 'Adam'
      owed_by: {}
      owes: {}
    }
    assert.are.same expected, result

  pending 'get single user', ->
    database = {
      users: {{
          name: 'Adam'
          owed_by: {}
          balance: 0.0
          owes: {}
        }, {
          name: 'Bob'
          owed_by: {}
          balance: 0.0
          owes: {}
        }}
    }
    api = RestApi database
    payload = {
      users: {'Bob'}
    }
    result = api\GET '/users', payload
    expected = {
      users: {{
          name: 'Bob'
          owed_by: {}
          balance: 0.0
          owes: {}
        }}
    }
    assert.are.same expected, result

  describe 'iou:', ->
  pending 'both users have 0 balance', ->
    database = {
      users: {{
          name: 'Adam'
          owed_by: {}
          balance: 0.0
          owes: {}
        }, {
          name: 'Bob'
          owed_by: {}
          balance: 0.0
          owes: {}
        }}
    }
    api = RestApi database
    payload = {
      amount: 3.0
      borrower: 'Bob'
      lender: 'Adam'
    }
    result = api\POST '/iou', payload
    expected = {
      users: {{
          name: 'Adam'
          owed_by: {
            Bob: 3.0
          }
          balance: 3.0
          owes: {}
        }, {
          name: 'Bob'
          owed_by: {}
          balance: -3.0
          owes: {
            Adam: 3.0
          }
        }}
    }
    assert.are.same expected, result

  pending 'borrower has negative balance', ->
    database = {
      users: {{
          name: 'Adam'
          owed_by: {}
          balance: 0.0
          owes: {}
        }, {
          name: 'Bob'
          owed_by: {}
          balance: -3.0
          owes: {
            Chuck: 3.0
          }
        }, {
          name: 'Chuck'
          owed_by: {
            Bob: 3.0
          }
          balance: 3.0
          owes: {}
        }}
    }
    api = RestApi database
    payload = {
      amount: 3.0
      borrower: 'Bob'
      lender: 'Adam'
    }
    result = api\POST '/iou', payload
    expected = {
      users: {{
          name: 'Adam'
          owed_by: {
            Bob: 3.0
          }
          balance: 3.0
          owes: {}
        }, {
          name: 'Bob'
          owed_by: {}
          balance: -6.0
          owes: {
            Adam: 3.0
            Chuck: 3.0
          }
        }}
    }
    assert.are.same expected, result

  pending 'lender has negative balance', ->
    database = {
      users: {{
          name: 'Adam'
          owed_by: {}
          balance: 0.0
          owes: {}
        }, {
          name: 'Bob'
          owed_by: {}
          balance: -3.0
          owes: {
            Chuck: 3.0
          }
        }, {
          name: 'Chuck'
          owed_by: {
            Bob: 3.0
          }
          balance: 3.0
          owes: {}
        }}
    }
    api = RestApi database
    payload = {
      amount: 3.0
      borrower: 'Adam'
      lender: 'Bob'
    }
    result = api\POST '/iou', payload
    expected = {
      users: {{
          name: 'Adam'
          owed_by: {}
          balance: -3.0
          owes: {
            Bob: 3.0
          }
        }, {
          name: 'Bob'
          owed_by: {
            Adam: 3.0
          }
          balance: 0.0
          owes: {
            Chuck: 3.0
          }
        }}
    }
    assert.are.same expected, result

  pending 'lender owes borrower', ->
    database = {
      users: {{
          name: 'Adam'
          owed_by: {}
          balance: -3.0
          owes: {
            Bob: 3.0
          }
        }, {
          name: 'Bob'
          owed_by: {
            Adam: 3.0
          }
          balance: 3.0
          owes: {}
        }}
    }
    api = RestApi database
    payload = {
      amount: 2.0
      borrower: 'Bob'
      lender: 'Adam'
    }
    result = api\POST '/iou', payload
    expected = {
      users: {{
          name: 'Adam'
          owed_by: {}
          balance: -1.0
          owes: {
            Bob: 1.0
          }
        }, {
          name: 'Bob'
          owed_by: {
            Adam: 1.0
          }
          balance: 1.0
          owes: {}
        }}
    }
    assert.are.same expected, result

  pending 'lender owes borrower less than new loan', ->
    database = {
      users: {{
          name: 'Adam'
          owed_by: {}
          balance: -3.0
          owes: {
            Bob: 3.0
          }
        }, {
          name: 'Bob'
          owed_by: {
            Adam: 3.0
          }
          balance: 3.0
          owes: {}
        }}
    }
    api = RestApi database
    payload = {
      amount: 4.0
      borrower: 'Bob'
      lender: 'Adam'
    }
    result = api\POST '/iou', payload
    expected = {
      users: {{
          name: 'Adam'
          owed_by: {
            Bob: 1.0
          }
          balance: 1.0
          owes: {}
        }, {
          name: 'Bob'
          owed_by: {}
          balance: -1.0
          owes: {
            Adam: 1.0
          }
        }}
    }
    assert.are.same expected, result

  pending 'lender owes borrower same as new loan', ->
    database = {
      users: {{
          name: 'Adam'
          owed_by: {}
          balance: -3.0
          owes: {
            Bob: 3.0
          }
        }, {
          name: 'Bob'
          owed_by: {
            Adam: 3.0
          }
          balance: 3.0
          owes: {}
        }}
    }
    api = RestApi database
    payload = {
      amount: 3.0
      borrower: 'Bob'
      lender: 'Adam'
    }
    result = api\POST '/iou', payload
    expected = {
      users: {{
          name: 'Adam'
          owed_by: {}
          balance: 0.0
          owes: {}
        }, {
          name: 'Bob'
          owed_by: {}
          balance: 0.0
          owes: {}
        }}
    }
    assert.are.same expected, result

