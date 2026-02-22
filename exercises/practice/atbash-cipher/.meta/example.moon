{
    encode: (phrase) ->
        clean = phrase\lower!\gsub "[^a-z0-9]", ""
        decoded = clean\gsub "[a-z]", (letter) ->
            string.char 219 - letter\byte!
        spaced = decoded\gsub(".....", "%0 ")
        spaced\match("^%s*(.-)%s*$") or spaced

    decode: (phrase) ->
        clean = phrase\lower!\gsub "[^a-z0-9]", ""
        clean\gsub "[a-z]", (letter) ->
            string.char 219 - letter\byte!
}
