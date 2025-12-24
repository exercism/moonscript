raindrops = (num) ->
    result = ''
    result ..= 'Pling' if num % 3 == 0 else ''
    result ..= 'Plang' if num % 5 == 0 else ''
    result ..= 'Plong' if num % 7 == 0 else ''

    result == '' and (tostring num) or result

raindrops
