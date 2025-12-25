class ComplexNumber
  new: (@r, @i = 0) =>

  real: => @r
  imaginary: => @i

  conjugate: => @@ @r, -@i

  abs: => math.sqrt(@r^2 + @i^2)

  __add: (other) =>
    @@ (@r + other.r), (@i + other.i)

  __sub: (other) =>
    @@ (@r - other.r), (@i - other.i)

  __mul: (other) =>
    a = @r * other.r - @i * other.i
    b = @i * other.r + @r * other.i
    @@ a, b

  reciprocal: =>
    denom = @r^2 + @i^2
    @@ @r / denom, -@i / denom

  __div: (other) => self * other\reciprocal!

  exp: =>
    factor = math.exp(@r)
    @@ factor * math.cos(@i), factor * math.sin(@i)

  __eq: (other) =>
    approx_equal = (a, b) -> math.abs(a - b) <= 1e-15
    approx_equal(@r, other.r) and approx_equal(@i, other.i)


tocomplex = (a) -> if type(a) == 'number' then ComplexNumber a else a

add = (a, b) -> tocomplex(a) + tocomplex(b)
sub = (a, b) -> tocomplex(a) - tocomplex(b)
mul = (a, b) -> tocomplex(a) * tocomplex(b)
div = (a, b) -> tocomplex(a) / tocomplex(b)

{ :ComplexNumber, :add, :sub, :mul, :div }
