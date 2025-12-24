Turns = {
  north: {left: 'west',  right: 'east'},
  east:  {left: 'north', right: 'south'},
  south: {left: 'east',  right: 'west'},
  west:  {left: 'south', right: 'north'},
}


class Robot
  new: (params) =>
    @_x = params.x
    @_y = params.y
    @_dir = params.direction

  x: => @_x
  y: => @_y
  direction: => @_dir

  move: (instructions) =>
    for instruction in instructions\gmatch('[RLA]')
      switch instruction
        when 'R' then @_dir = Turns[@_dir].right
        when 'L' then @_dir = Turns[@_dir].left
        when 'A'
          switch @_dir
            when 'north' then @_y += 1
            when 'east'  then @_x += 1
            when 'south' then @_y -= 1
            when 'west'  then @_x -= 1
