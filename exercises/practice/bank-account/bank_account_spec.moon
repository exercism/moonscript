BankAccount = require('bank_account')

describe 'bank_account', ->

  it "Newly opened account has zero balance", ->
    acct = BankAccount!
    acct\open!
    result = acct\balance!
    assert.are.equal 0, result

  pending "Single deposit", ->
    acct = BankAccount!
    acct\open!
    acct\deposit 100
    result = acct\balance!
    assert.are.equal 100, result

  pending "Multiple deposits", ->
    acct = BankAccount!
    acct\open!
    acct\deposit 100
    acct\deposit 50
    result = acct\balance!
    assert.are.equal 150, result

  pending "Withdraw once", ->
    acct = BankAccount!
    acct\open!
    acct\deposit 100
    acct\withdraw 75
    result = acct\balance!
    assert.are.equal 25, result

  pending "Withdraw twice", ->
    acct = BankAccount!
    acct\open!
    acct\deposit 100
    acct\withdraw 80
    acct\withdraw 20
    result = acct\balance!
    assert.are.equal 0, result

  pending "Can do multiple operations sequentially", ->
    acct = BankAccount!
    acct\open!
    acct\deposit 100
    acct\deposit 110
    acct\withdraw 200
    acct\deposit 60
    acct\withdraw 50
    result = acct\balance!
    assert.are.equal 20, result

  pending "Cannot check balance of closed account", ->
    acct = BankAccount!
    acct\open!
    acct\close!
    assert.has.errors acct\balance, "account not open"

  pending "Cannot deposit into closed account", ->
    acct = BankAccount!
    acct\open!
    acct\close!
    assert.has.errors (-> acct\deposit 50), "account not open"

  pending "Cannot deposit into unopened account", ->
    acct = BankAccount!
    assert.has.errors (-> acct\deposit 50), "account not open"

  pending "Cannot withdraw from closed account", ->
    acct = BankAccount!
    acct\open!
    acct\close!
    assert.has.errors (-> acct\withdraw 50), "account not open"

  pending "Cannot close an account that was not opened", ->
    acct = BankAccount!
    assert.has.errors acct\close, "account not open"

  pending "Cannot open an already opened account", ->
    acct = BankAccount!
    acct\open!
    assert.has.errors acct\open, "account already open"

  pending "Reopened account does not retain balance", ->
    acct = BankAccount!
    acct\open!
    acct\deposit 50
    acct\close!
    acct\open!
    result = acct\balance!
    assert.are.equal 0, result

  pending "Cannot withdraw more than deposited", ->
    acct = BankAccount!
    acct\open!
    acct\deposit 25
    assert.has.errors (-> acct\withdraw 50), "amount must be less than balance"

  pending "Cannot withdraw negative", ->
    acct = BankAccount!
    acct\open!
    acct\deposit 100
    assert.has.errors (-> acct\withdraw -50), "amount must be greater than 0"

  pending "Cannot deposit negative", ->
    acct = BankAccount!
    acct\open!
    assert.has.errors (-> acct\deposit -50), "amount must be greater than 0"
