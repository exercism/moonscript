class CustomSet
  new: (items = {}) =>
    @data = {}
    @add item for item in *items

  add: (item) =>
    @data[item] = true

  is_empty: =>
    not next @data

  contains: (item) =>
    @data[item]

  is_subset: (other) =>
    for item, _ in pairs @data
      return false if not other\contains item
    true

  is_disjoint: (other) =>
    for item, _ in pairs @data
      return false if other\contains item
    true

  -- metamethods can just go into the class

  __eq: (other) =>
    @is_subset(other) and other\is_subset(@)

  __sub: (other) =>
    diff = @@!
    for item, _ in pairs @data
      if not other\contains item
        diff\add item
    diff

  __add: (other) => 
    union = @@!
    union\add item for item, _ in pairs @data
    union\add item for item, _ in pairs other.data
    union

  __band: (other) =>
    intersect = @@!
    for item, _ in pairs @data
      if other\contains item
        intersect\add item
    intersect

  -- methods implemented using metamethod

  is_equal: (other) =>
    @ == other

  intersection: (other) =>
    @ & other

  difference: (other) =>
    @ - other

  union: (other) =>
    @ + other
