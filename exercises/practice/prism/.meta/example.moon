math = require "math"

{
  findSequence: (start, prisms) ->
    { :x, :y, :angle } = start
    sequence = {}

    while true
      rad = angle * math.pi / 180
      dirX = math.cos rad
      dirY = math.sin rad

      nearest = nil
      nearestDist = math.huge

      for prism in *prisms
        dx = prism.x - x
        dy = prism.y - y

        dist = dx * dirX + dy * dirY
        -- ignore prisms behind or at the start
        if dist > 1e-6
          crossSq = (dx - dist * dirX) ^ 2 + (dy - dist * dirY) ^ 2

          -- Bail if outside relative tolerance (more wiggle room for further prisms)
          if crossSq < 1e-6 * math.max(1, dist * dist)
            if dist < nearestDist
              nearestDist = dist
              nearest = prism

      if not nearest
        break

      table.insert sequence, nearest.id
      x = nearest.x
      y = nearest.y
      angle = (angle + nearest.angle) % 360

    sequence
}
