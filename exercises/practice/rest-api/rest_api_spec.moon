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
        name: "Adam"
        owes: {}
        owed_by: {}
        balance: 0.0
      }
      assert.are.same expected, result

    pending 'get single user', ->
      database = {
        users: {{
            name: "Adam"
            owes: {}
            owed_by: {}
            balance: 0.0
          }, {
            name: "Bob"
            owes: {}
            owed_by: {}
            balance: 0.0
          }}
      }
      api = RestApi database
      payload = {
        users: {"Bob"}
      }
      result = api\GET '/users', payload
      expected = {
        users: {{
            name: "Bob"
            owes: {}
            owed_by: {}
            balance: 0.0
          }}
      }
      assert.are.same expected, result

  describe 'iou:', ->
    pending 'both users have 0 balance', ->
      database = {
        users: {{
            name: "Adam"
            owes: {}
            owed_by: {}
            balance: 0.0
          }, {
            name: "Bob"
            owes: {}
            owed_by: {}
            balance: 0.0
          }}
      }
      api = RestApi database
      payload = {
        borrower: "Bob"
        lender: "Adam"
        amount: 3.0
      }
      result = api\POST '/iou', payload
      expected = {
        users: {{
            name: "Adam"
            owes: {}
            owed_by: {
              Bob: 3.0
            }
            balance: 3.0
          }, {
            name: "Bob"
            owes: {
              Adam: 3.0
            }
            owed_by: {}
            balance: -3.0
          }}
      }
      assert.are.same expected, result

    pending 'borrower has negative balance', ->
      database = {
        users: {{
            name: "Adam"
            owes: {}
            owed_by: {}
            balance: 0.0
          }, {
            name: "Bob"
            owes: {
              Chuck: 3.0
            }
            owed_by: {}
            balance: -3.0
          }, {
            name: "Chuck"
            owes: {}
            owed_by: {
              Bob: 3.0
            }
            balance: 3.0
          }}
      }
      api = RestApi database
      payload = {
        borrower: "Bob"
        lender: "Adam"
        amount: 3.0
      }
      result = api\POST '/iou', payload
      expected = {
        users: {{
            name: "Adam"
            owes: {}
            owed_by: {
              Bob: 3.0
            }
            balance: 3.0
          }, {
            name: "Bob"
            owes: {
              Chuck: 3.0
              Adam: 3.0
            }
            owed_by: {}
            balance: -6.0
          }}
      }
      assert.are.same expected, result

    pending 'lender has negative balance', ->
      database = {
        users: {{
            name: "Adam"
            owes: {}
            owed_by: {}
            balance: 0.0
          }, {
            name: "Bob"
            owes: {
              Chuck: 3.0
            }
            owed_by: {}
            balance: -3.0
          }, {
            name: "Chuck"
            owes: {}
            owed_by: {
              Bob: 3.0
            }
            balance: 3.0
          }}
      }
      api = RestApi database
      payload = {
        borrower: "Adam"
        lender: "Bob"
        amount: 3.0
      }
      result = api\POST '/iou', payload
      expected = {
        users: {{
            name: "Adam"
            owes: {
              Bob: 3.0
            }
            owed_by: {}
            balance: -3.0
          }, {
            name: "Bob"
            owes: {
              Chuck: 3.0
            }
            owed_by: {
              Adam: 3.0
            }
            balance: 0.0
          }}
      }
      assert.are.same expected, result

    pending 'lender owes borrower', ->
      database = {
        users: {{
            name: "Adam"
            owes: {
              Bob: 3.0
            }
            owed_by: {}
            balance: -3.0
          }, {
            name: "Bob"
            owes: {}
            owed_by: {
              Adam: 3.0
            }
            balance: 3.0
          }}
      }
      api = RestApi database
      payload = {
        borrower: "Bob"
        lender: "Adam"
        amount: 2.0
      }
      result = api\POST '/iou', payload
      expected = {
        users: {{
            name: "Adam"
            owes: {
              Bob: 1.0
            }
            owed_by: {}
            balance: -1.0
          }, {
            name: "Bob"
            owes: {}
            owed_by: {
              Adam: 1.0
            }
            balance: 1.0
          }}
      }
      assert.are.same expected, result

    pending 'lender owes borrower less than new loan', ->
      database = {
        users: {{
            name: "Adam"
            owes: {
              Bob: 3.0
            }
            owed_by: {}
            balance: -3.0
          }, {
            name: "Bob"
            owes: {}
            owed_by: {
              Adam: 3.0
            }
            balance: 3.0
          }}
      }
      api = RestApi database
      payload = {
        borrower: "Bob"
        lender: "Adam"
        amount: 4.0
      }
      result = api\POST '/iou', payload
      expected = {
        users: {{
            name: "Adam"
            owes: {}
            owed_by: {
              Bob: 1.0
            }
            balance: 1.0
          }, {
            name: "Bob"
            owes: {
              Adam: 1.0
            }
            owed_by: {}
            balance: -1.0
          }}
      }
      assert.are.same expected, result

    pending 'lender owes borrower same as new loan', ->
      database = {
        users: {{
            name: "Adam"
            owes: {
              Bob: 3.0
            }
            owed_by: {}
            balance: -3.0
          }, {
            name: "Bob"
            owes: {}
            owed_by: {
              Adam: 3.0
            }
            balance: 3.0
          }}
      }
      api = RestApi database
      payload = {
        borrower: "Bob"
        lender: "Adam"
        amount: 3.0
      }
      result = api\POST '/iou', payload
      expected = {
        users: {{
            name: "Adam"
            owes: {}
            owed_by: {}
            balance: 0.0
          }, {
            name: "Bob"
            owes: {}
            owed_by: {}
            balance: 0.0
          }}
      }
      assert.are.same expected, result
