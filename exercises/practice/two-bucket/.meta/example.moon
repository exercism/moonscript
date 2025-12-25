class Bucket
  new: (@name, @size, @amount = 0) =>

  is_full:           => @amount == @size
  is_empty:          => @amount == 0
  fill:              => @amount = @size
  empty:             => @amount = 0
  capacity:          => @size - @amount
  pour_into: (other) =>
    qty = math.min @amount, other\capacity!
    @amount -= qty
    other.amount += qty


gcd = (a, b) ->
  while b != 0
    a, b = b, a % b
  return a


validate = (b1, b2, goal) ->
  assert (goal <= math.max b1, b2), 'goal impossible: too big'

  div = gcd b1, b2
  assert (div == 1 or goal % div == 0), 'goal impossible: unattainable'


{
  measure: (params) ->
    validate params.bucketOne, params.bucketTwo, params.goal

    goal = params.goal
    b1 = Bucket 'one', params.bucketOne
    b2 = Bucket 'two', params.bucketTwo
    b1, b2 = b2, b1 if params.startBucket == 'two'

    b1\fill!
    moves = 1

    if b2.size == goal and b1.size != goal
      b2\fill!
      moves += 1

    while true
      return {:moves, goalBucket: b1.name, otherBucket: b2.amount} if b1.amount == goal
      return {:moves, goalBucket: b2.name, otherBucket: b1.amount} if b2.amount == goal

      if     b1\is_empty! then b1\fill!
      elseif b2\is_full!  then b2\empty!
      else                     b1\pour_into b2
      moves += 1
}
