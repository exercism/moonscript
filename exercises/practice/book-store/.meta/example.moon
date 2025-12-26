import fold from require 'moon'

BOOK_PRICE = 800
DISCOUNTED = {[0]: 1.0, 1.0, 0.95, 0.90, 0.80, 0.75}


contains = (list, item) ->
  for i, elem in ipairs list
    return i if elem == item
  nil


filter = (list, pred) ->
  fold {{}, table.unpack list}, (filtered, elem) ->
    table.insert filtered, elem if pred elem
    filtered


group = (basket) ->
  bundles = {{}}
  for book in *basket
    added = false
    for bundle in *bundles
      if not contains bundle, book
        table.insert bundle, book
        added = true
        break
    if not added
      table.insert bundles, {book}

  return bundles


optimize = (bundles) ->
  -- Two bundles of 4 are cheaper than a bundle of 5 plus a bundle of 3.
  -- Look for a book in a 5-bundle that can be moved into a 3-bundle.

  bundle5 = filter bundles, (bundle) -> #bundle == 5
  return bundles if #bundle5 == 0

  bundle3 = filter bundles, (bundle) -> #bundle == 3
  return bundles if #bundle3 == 0

  b5 = bundle5[1]
  b3 = bundle3[1]

  for book in *b5
    idx = contains b3, book
    if not idx
      table.insert b3, book
      table.remove b5, idx
      break

  return optimize bundles



total_price = (basket) ->
  bundles = optimize group basket

  fold {0, table.unpack bundles}, (price, bundle) ->
    price + #bundle * BOOK_PRICE * DISCOUNTED[#bundle]


{ total: total_price }
