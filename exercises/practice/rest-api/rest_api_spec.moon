RestApi = require 'rest_api'

describe 'rest-api:', ->
  assert\set_parameter "TableFormatLevel", 4

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
        user: "Adam"
      }
      result = api\POST '/add', payload
      expected = {
        balance: 0.0
        owes: {}
        owed_by: {}
        name: "Adam"
      }
      assert.are.same expected, result

    pending 'get single user', ->
      database = {
        users: {{
            balance: 0.0
            owes: {}
            owed_by: {}
            name: "Adam"
          }, {
            balance: 0.0
            owes: {}
            owed_by: {}
            name: "Bob"
          }}
      }
      api = RestApi database
      payload = {
        users: {"Bob"}
      }
      result = api\GET '/users', payload
      expected = {
        users: {{
            balance: 0.0
            owes: {}
            owed_by: {}
            name: "Bob"
          }}
      }
      assert.are.same expected, result

  describe 'iou:', ->
    pending 'both users have 0 balance', ->
      database = {
        users: {{
            balance: 0.0
            owes: {}
            owed_by: {}
            name: "Adam"
          }, {
            balance: 0.0
            owes: {}
            owed_by: {}
            name: "Bob"
          }}
      }
      api = RestApi database
      payload = {
        amount: 3.0
        borrower: "Bob"
        lender: "Adam"
      }
      result = api\POST '/iou', payload
      expected = {
        users: {{
            balance: 3.0
            owes: {}
            owed_by: {
              Bob: 3.0
            }
            name: "Adam"
          }, {
            balance: -3.0
            owes: {
              Adam: 3.0
            }
            owed_by: {}
            name: "Bob"
          }}
      }
      assert.are.same expected, result

    pending 'borrower has negative balance', ->
      database = {
        users: {{
            balance: 0.0
            owes: {}
            owed_by: {}
            name: "Adam"
          }, {
            balance: -3.0
            owes: {
              Chuck: 3.0
            }
            owed_by: {}
            name: "Bob"
          }, {
            balance: 3.0
            owes: {}
            owed_by: {
              Bob: 3.0
            }
            name: "Chuck"
          }}
      }
      api = RestApi database
      payload = {
        amount: 3.0
        borrower: "Bob"
        lender: "Adam"
      }
      result = api\POST '/iou', payload
      expected = {
        users: {{
            balance: 3.0
            owes: {}
            owed_by: {
              Bob: 3.0
            }
            name: "Adam"
          }, {
            balance: -6.0
            owes: {
              Chuck: 3.0
              Adam: 3.0
            }
            owed_by: {}
            name: "Bob"
          }}
      }
      assert.are.same expected, result

    pending 'lender has negative balance', ->
      database = {
        users: {{
            balance: 0.0
            owes: {}
            owed_by: {}
            name: "Adam"
          }, {
            balance: -3.0
            owes: {
              Chuck: 3.0
            }
            owed_by: {}
            name: "Bob"
          }, {
            balance: 3.0
            owes: {}
            owed_by: {
              Bob: 3.0
            }
            name: "Chuck"
          }}
      }
      api = RestApi database
      payload = {
        amount: 3.0
        borrower: "Adam"
        lender: "Bob"
      }
      result = api\POST '/iou', payload
      expected = {
        users: {{
            balance: -3.0
            owes: {
              Bob: 3.0
            }
            owed_by: {}
            name: "Adam"
          }, {
            balance: 0.0
            owes: {
              Chuck: 3.0
            }
            owed_by: {
              Adam: 3.0
            }
            name: "Bob"
          }}
      }
      assert.are.same expected, result

    pending 'lender owes borrower', ->
      database = {
        users: {{
            balance: -3.0
            owes: {
              Bob: 3.0
            }
            owed_by: {}
            name: "Adam"
          }, {
            balance: 3.0
            owes: {}
            owed_by: {
              Adam: 3.0
            }
            name: "Bob"
          }}
      }
      api = RestApi database
      payload = {
        amount: 2.0
        borrower: "Bob"
        lender: "Adam"
      }
      result = api\POST '/iou', payload
      expected = {
        users: {{
            balance: -1.0
            owes: {
              Bob: 1.0
            }
            owed_by: {}
            name: "Adam"
          }, {
            balance: 1.0
            owes: {}
            owed_by: {
              Adam: 1.0
            }
            name: "Bob"
          }}
      }
      assert.are.same expected, result

    pending 'lender owes borrower less than new loan', ->
      database = {
        users: {{
            balance: -3.0
            owes: {
              Bob: 3.0
            }
            owed_by: {}
            name: "Adam"
          }, {
            balance: 3.0
            owes: {}
            owed_by: {
              Adam: 3.0
            }
            name: "Bob"
          }}
      }
      api = RestApi database
      payload = {
        amount: 4.0
        borrower: "Bob"
        lender: "Adam"
      }
      result = api\POST '/iou', payload
      expected = {
        users: {{
            balance: 1.0
            owes: {}
            owed_by: {
              Bob: 1.0
            }
            name: "Adam"
          }, {
            balance: -1.0
            owes: {
              Adam: 1.0
            }
            owed_by: {}
            name: "Bob"
          }}
      }
      assert.are.same expected, result

    pending 'lender owes borrower same as new loan', ->
      database = {
        users: {{
            balance: -3.0
            owes: {
              Bob: 3.0
            }
            owed_by: {}
            name: "Adam"
          }, {
            balance: 3.0
            owes: {}
            owed_by: {
              Adam: 3.0
            }
            name: "Bob"
          }}
      }
      api = RestApi database
      payload = {
        amount: 3.0
        borrower: "Bob"
        lender: "Adam"
      }
      result = api\POST '/iou', payload
      expected = {
        users: {{
            balance: 0.0
            owes: {}
            owed_by: {}
            name: "Adam"
          }, {
            balance: 0.0
            owes: {}
            owed_by: {}
            name: "Bob"
          }}
      }
      assert.are.same expected, result
