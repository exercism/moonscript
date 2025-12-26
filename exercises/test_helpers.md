# Reusable stuff for spec generators

## Helper functions

Useful for generating pretty tables mostly.

- List of ints
    ```moonscript
    int_list = (list) -> "{#{table.concat list, ', '}}"
    ```

    Used in: all-your-base

- List of lists of ints
    ```moonscript
    int_lists = (lists, level) ->
      if #lists == 1
        "{#{int_list lists[1]}}"
      else
        rows = [indent int_list(row) .. ',', level + 1 for row in *lists]
        table.insert rows, 1, '{'
        table.insert rows, indent '}', level
        table.concat rows, '\n'
    ```
    
    Used in: saddle-points, spiral-matrix

- List of strings
    ```moonscript
    list_of_words = (list) ->
      "{#{table.concat [quote word for word in *list], ', '}}"
    ```
    The `quote` function is defined in bin/generate-spec

    Used in: anagram

- Indented multi-line list of strings
    ```moonscript
    instruction_list = (list, level) ->
      if #list <= 2
        "{#{table.concat [quote elem for elem in *list], ', '}}"
      else
        instrs = [indent quote(elem) .. ',', level + 1 for elem in *list]
        table.insert instrs, 1, '{'
        table.insert instrs, indent('}', level)
        table.concat instrs, '\n'
    ```
    The `indent` function is defined in bin/generate-spec

    This returns a multi-line string without the first line indented.
    The returned string will be added to another string in the test case body,
    and then that string (without regard to internal newlines) will later be indented.

    Used in: anagram, twelve-days

- Key-Value list

    ```moonscript
    kv_table = (tbl, level) ->
      lines = {'{'}
      for k, v in pairs tbl
        key = if k\match('^%a%w*$') then k else "[#{quote k}]"
        table.insert lines, indent "#{key}: #{v},", level + 1
      table.insert lines, indent '}', level
      table.concat lines, '\n'
    ```

    Used in: word-count

- Show strings with escapes, when you want to keep the `\t`, `\n` in the test case.

    ```moonscript
    json = require 'dkjson'
    -- and then
      "result = Bob.hey #{json.encode case.input.heyBob}",
    ```
    ```moonscript
    json = require 'dkjson'
    json_string = (s) -> json.encode s
    ```

    Used in: bob, matrix

- Table contains an element

    ```moonscript
    table_contains = (list, target) ->
      for elem in *list
        return true if elem == target
      false
    ````

    Used in: forth

- Wrapped list of ints

    sieve has a test with loads of numbers.
    This _should_ work fine on Mac or Linux ("Works For Me™)

    ```moonscript
    formatted = (list, level) ->
      joined = table.concat list, ', '
      cmd = "echo '#{joined}' | fold -s -w 76"
      fh = io.popen cmd, 'r'
      return "{#{joined}}" if not fh

      lines = [indent(line\gsub('%s+$', ''), level + 1) for line in fh\lines!]

      result = {fh\close!}
      lines = {joined} if not result[1]

      if #lines == 1
        "{#{lines[1]\gsub('^%s+', '')}}"
      else
        table.insert lines, 1, "{"
        table.insert lines, (indent "}", level)
        table.concat lines, '\n'

    ````


## Custom assertions

- dnd-character: `assert.between value, min, max`
- space-age: `assert.approx_equal #{case.expected}, result`
- word-count: `assert.has.same_kv table1, table2`:x

