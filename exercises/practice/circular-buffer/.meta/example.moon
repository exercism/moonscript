class CircularBuffer
  new: (@size) =>
    @buff = [0 for _ = 1, @size]
    @idx = r: 1, w: 1
    @count = 0

  read: =>
    return nil, false if @count == 0
    item = @buff[@idx.r]
    @idx.r = @idx.r == @size and 1 or @idx.r + 1
    @count -= 1
    item, true

  write: (item) =>
    return false if @count == @size
    @buff[@idx.w] = item
    @idx.w = @idx.w == @size and 1 or @idx.w + 1
    @count += 1
    true

  clear: =>
    @count = 0
    @idx.r = @idx.w

  overwrite: (item) =>
    @read! if @count == @size
    @write item


CircularBuffer
