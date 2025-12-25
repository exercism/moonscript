class ComplexNumber
  new: (...) => error 'Implement the constructor'

  real: => error 'Implement the real method'

  imaginary: => error 'Implement the imaginary method'

  conjugate: => error 'Implement the conjugate method'

  abs: => error 'Implement the abs method'

  exp: => error 'Implement the exp method'

  __eq: (other) => error 'Implement the __eq metamethod'

  -- Also implement metamethods for the arithmetic operations

-- For arithmetic operations between real and complex numbers
add = (a, b) -> error 'Implement the add function'
sub = (a, b) -> error 'Implement the sub function'
mul = (a, b) -> error 'Implement the mul function'
div = (a, b) -> error 'Implement the div function'

{ :ComplexNumber, :add, :sub, :mul, :div }
