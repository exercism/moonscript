class LinkedList
  new: (@head = nil, @tail = nil) =>

  push: (value) =>
    node = {:value, next: nil, prev: nil}
    if @tail
      @tail.next = node
      node.prev = @tail
    else
      @head = node
    @tail = node

  unshift: (value) =>
    node = {:value, next: nil, prev: nil}
    if @head
      @head.prev = node
      node.next = @head
    else
      @tail = node
    @head = node

  pop: =>
    return unless @tail
    value = @tail.value
    if @head == @tail
      @head, @tail = nil, nil
    else
      @tail.prev.next = nil
      @tail = @tail.prev
    value

  shift: =>
    return unless @head
    value = @head.value
    if @head == @tail
      @head, @tail = nil, nil
    else
      @head.next.prev = nil
      @head = @head.next
    value

  count: =>
    n = 0
    node = @head
    while node != nil
      n += 1
      node = node.next
    n

  delete: (value) =>
    node = @head
    while node != nil
      if node.value == value
        if node.prev and node.next
          node.prev.next = node.next
          node.next.prev = node.prev
          node = nil
        elseif node.next
          -- this is the head
          @shift!
        elseif node.prev
          -- this is the tail
          @pop!
        else
          @head, @tail = nil, nil
        break
      -- end if
      node = node.next
