class Cell
  new: =>
    @val = nil
    @listeners = {}

  get_value: => @val

  store_value: (value) => @val = value

  add_listener: (listener) =>
    table.insert @listeners, listener

  recompute_listeners: =>
    listener\recompute! for listener in *@listeners

  fire_listener_callbacks: =>
    listener\fire_callbacks! for listener in *@listeners


class InputCell extends Cell
  new: (value) =>
    super!
    @val = value

  set_value: (value) =>
    @store_value value
    @recompute_listeners!
    @fire_listener_callbacks!


class ComputeCell extends Cell
  new: (...) =>
    super!
    @inputs = {...}
    @formula = table.remove @inputs
    @callbacks = {}

    input\add_listener self for input in *@inputs
    @compute!
    @previous = @get_value!

  compute: =>
    values = [input\get_value! for input in *@inputs]
    -- note the odd parentheses: have to extract the formula from the instance *first*
    @store_value (@formula) table.unpack values

  recompute: =>
    @compute!
    @recompute_listeners!

  fire_callbacks: =>
    val = @get_value!
    return if val == @previous

    @previous = val
    cb val for cb in *@callbacks
    @fire_listener_callbacks!

  watch: (callback) =>
    table.insert @callbacks, callback

  unwatch: (callback) =>
    for i, cb in ipairs @callbacks
      if cb == callback
        table.remove @callbacks, i
        break


{ :InputCell, :ComputeCell }
