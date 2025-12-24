class BankAccount
  new: =>
    @is_open = false

  open: =>
    assert not @is_open, 'account already open'
    @is_open = true
    @amount = 0

  close: =>
    assert @is_open, 'account not open'
    @is_open = false

  balance: =>
    assert @is_open, 'account not open'
    return @amount

  deposit: (money) =>
    assert @is_open, 'account not open'
    assert money > 0, 'amount must be greater than 0'
    @amount += money

  withdraw: (money) =>
    assert @is_open, 'account not open'
    assert money <= @amount, 'amount must be less than balance'
    assert money > 0, 'amount must be greater than 0'
    @amount -= money
