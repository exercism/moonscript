{
  format: (name, number) ->
    ones, tens = number % 10, number % 100

    suffix = switch ones
               when 1 then if tens == 11 then 'th' else 'st'
               when 2 then if tens == 12 then 'th' else 'nd'
               when 3 then if tens == 13 then 'th' else 'rd'
               else 'th'

    "#{name}, you are the #{number}#{suffix} customer we serve today. Thank you!"
}
