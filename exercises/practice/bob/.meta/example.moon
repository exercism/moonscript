{
  hey: (input) ->
    trimmed = input\gsub('%s*$', '')

    return 'Fine. Be that way!' if #trimmed == 0

    yelling = trimmed\find('%u') and not trimmed\find('%l')
    asking = trimmed\sub(#trimmed) == '?'

    return "Calm down, I know what I'm doing!" if asking and yelling
    return 'Whoa, chill out!'                  if yelling
    return 'Sure.'                             if asking
    return 'Whatever.'
}
