class BinarySearchTree
  new: (items = {}) =>
    @add item for item in *items

  add: (item) =>
    if not @value
      @value = item
    elseif item <= @value
      if not @left then @left = @@!
      @left\add item
    else
      if not @right then @right = @@!
      @right\add item

  data: =>
    {
      data: @value
      left: @left and @left\data! or nil
      right: @right and @right\data! or nil
    }

  sorted: (list = {}) =>
    if @left then @left\sorted list
    table.insert list, @value
    if @right then @right\sorted list
    list
