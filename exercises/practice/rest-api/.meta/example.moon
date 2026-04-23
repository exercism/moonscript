contains = (list, elem) ->
  for item in *list
    return true if item == elem
  false

sort_users = (list) ->
  table.sort list, (a, b) -> a.name < b.name
  list

-- below, the tests do not require the payload to be validated

class RestApi
  new: (database) =>
    @db = {k,v for k,v in pairs database} -- clone it

  GET:  (url, payload) => @route 'GET', url, payload
  POST: (url, payload) => @route 'POST', url, payload

  route: (method, url, payload) =>
    subject = url\match '^/(%w+)'
    func = "#{subject}_#{method}"
    return {error: "Unknown function '#{func}'"} if not @[func]
    @[func] @, payload

  users_GET: (payload) =>
    users = @db.users or {}
    filter = if payload
      (user) -> contains payload.users, user.name
    else
      (user) -> true
    {users: sort_users [u for u in *users when filter u]}

  add_POST: (payload) =>
    user = {
      name: payload.user
      balance: 0
      owes: {}
      owed_by: {}
    }
    table.insert @db.users, user
    user

  iou_POST: (payload) =>
    {users: {lender}} = @users_GET {users: {payload.lender}}
    {users: {borrower}} = @users_GET {users: {payload.borrower}}
    borrower.balance -= payload.amount
    lender.balance += payload.amount

    debt = (lender.owes[borrower.name] or 0) - (lender.owed_by[borrower.name] or 0) - payload.amount

    lender.owes[borrower.name] = nil
    lender.owed_by[borrower.name] = nil
    borrower.owes[lender.name] = nil
    borrower.owed_by[lender.name] = nil

    if debt > 0
      lender.owes[borrower.name] = debt
      borrower.owed_by[lender.name] = debt
    elseif debt < 0
      lender.owed_by[borrower.name] = -debt
      borrower.owes[lender.name] = -debt

    {users: sort_users {lender, borrower}}
