class SimpleLinkedList
  new: (items) =>
    items = items or {}
    @_head = nil
    @_count = 0
    @push item for item in *items

  count: => @_count

  pop: =>
    assert @_head, 'list is empty'
    item = @_head.value
    @_head = @_head.next
    @_count -= 1
    item

  push: (item) =>
    @_head = {value: item, next: @_head}
    @_count += 1

  peek: =>
    assert @_head, 'list is empty'
    @_head.value

  toList: =>
    list = {}
    node = @_head
    while node
      table.insert list, 1, node.value
      node = node.next
    list

  reverse: =>
    node, @_head, @_count = @_head, nil, 0
    while node
      @push node.value
      node = node.next
