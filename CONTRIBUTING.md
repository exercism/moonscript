# How to contribute to the Exercism MoonScript track

## **Do you want to report a bug?**

- **Ensure the bug was not already reported** by searching the [forum][forum].

- If you're unable to find an open conversation addressing the problem, [open a new one][forum-new-topic].
  Be sure to include a **title and clear description**, as much relevant information as possible, and (when possible) a **code sample**.

## **Do you want to fix a bug?**

- **Ensure that the bug is reported (see above)**.
  Only start fixing the bug when there is agreement on whether (and how) it should be fixed.

- Fix the bug and [submit a Pull Request][pr-guide] to this repository.

- Ensure the PR description clearly describes the problem and solution.
  Include a link to the bug's corresponding forum conversation.

- Before submitting, please read the [Contributors Pull Request Guide][pr-guide] and [Pull Request Guide][pr-other-guide].

## **Do you intend to add a new feature or change an existing one?**

- **Ensure that the feature or change is discussed on the [forum][forum].**
  Only start adding the feature or change when there is agreement on whether (and how) it should be added or changed.

- Fork the exercism/moonscript repo, add the feature or change in your clone, and [submit a Pull Request][pr-guide] to this repository.

- Ensure the PR description clearly describes the problem and solution.
  Include a link to the bug's corresponding forum conversation.

- Before submitting, please read the [Contributors Pull Request Guide][pr-guide] and [Pull Request Guide][pr-other-guide].

## **Do you want to add an exercise?**

- **Ensure that someone else isn't already adding it** 
    - start with the [Practice exercises to implement][exercise-list] issue.
    - also search the [forum][forum] and the repository's [issues][gh-issues] and [pull requests][gh-pulls].

- If nobody is yet adding the exercise, [open a conversation][forum] and indicate you'd like to add the exercise.

### Creating a new Practice Exercise

1. Run

    ```sh
    bin/add-practice-exercise ${slug_name}
    ```

    This creates the scaffolding for the new exercise:

    - The test, stub and example files are empty.
    - The canonical data from problem-specifications gets added into your local `canonical-data` directory.
    - A test generator template is created: `exercises/practice/${slug_name}/.meta/generator.tmpl`

1. Review the canonical data and decide if there are any tests cases to exclude.

   If there are, add `include = false` properties in the exercise's `.meta/tests.toml` file.

1. Considering the canonical data, decide if this exercise makes sense to use a test generator.

    - If no:
        - delete the stubbed .meta/generator.tmpl and create the test suite manually.
        - Use the file `canonical-data/${slug_name}.json` to create the tests.
        - Remember, this track uses TDD, so the first test uses `it` and all the rest use `pending`.

    - If yes:

        1. Edit `.meta/generator.tmpl` -- see below for more details.

        2. Run the generator script and review the new test suite.

            ```sh
            bin/generate-spec ${slug_name}
            ```

            Loop back to the previous step as needed.

1. Create the example solution: `.meta/example.moon`

   * follow the [style guide][style].

1. Test it with

    ```sh
    bin/verify-exercises ${slug_name}
    ```

1. When you're satisfied with the solution, create the stub file `${slug_name}.moon`.
   Provide a stub for every function being tested.
   For classes, provide stubs for the constructor and each method.
   The stubbed function should emit an error.
   See what it looks like in other exercises.
   `complex-numbers` is a good one.

1. Revisit the exercise difficulty in config.json if the implementation was harder/easier than expected.

1. Run `bin/configlet lint` to ensure that the new exercise conforms to Exercism standards.

### The test generator template

The generator.tmpl file is an ERB style template.
We use the [`etlua`][etlua] module to render the template into the spec file.

It is located in `exercises/practice/${slug_name}/.meta/` directory.

#### Template syntax

This is a pretty simple templating engine.
There are 3 tags:

- `<% lua statements %>` allow you to add control structures into the template: looping and conditionals
- `<%= lua expression %>` replaces the tag with the result of the expression
- `<%- lua expression %>` is the same as above, except the result does _not_ undergo HTML entity replacements. Use this for anything with quoted strings.

And the end tag can be `-%>` in order to suppress a trailing newline following the tag.
Otherwise, there will be a lot of blank lines in the resulting file.

Note that **Lua** syntax is required here, not MoonScript syntax.
You need parentheses for function calls.
You need a `do` for each `for`, and a `then` for each `if` or `elseif`.
For loops, you'll need `ipairs` (or `pairs`) not MoonScript's `*` generator operator.

Because anything outside of a tag is literal text, we're stuck with mostly putting control statements at the start of lines with no indentation. 
This can make it tricky to ensure that you have an `end` statement for each `if` or `for`.
To mitigate this, add some indentation inside the tag:

```
<% for i, case in ipairs(data.cases) do -%>
  ...
<%   if case.property == 'foo' then -%>
    ...
<%   else if case.property == 'bar' then -%>
    ...
<%   end -%>
<% end -%>
```

#### Template environment

The spec file is generated like this:

```moonscript
tmpl = etlua.compile template_text
spec = tmpl {
  data: canonical_data,
  slug: {kebab: exercise_name, snake: snake_name, pascal: pascal_name},
  h: spec_helpers,
  :test_cmd,
}
```

- The canonical data is provided to the template as the `data` variable.
- The exercise slug is provided in three formats.
- `h` is the `spec_helpers` module table. See below.
- `test_cmd` is a function to return "it" or "pending" as appropriate.

If the template fails to compile, you'll see a message like

```
$ bin/generate-spec allergies
moon: bin/generate-spec:85: (77) compiled template is nil!
stack traceback:
        [C]: in function 'assert'
        bin/generate-spec:85: (77) in upvalue 'moonscript_chunk'
```

It's tricky to debug this. 
Look in the code tags to find a missing end-quote or end-bracket.
Ensure all your if's and for's and end's are in the right place.
Check the canonical data: do you have to deal with nested cases arrays?

#### Helper functions

We have a library of helper functions, useful for generating pretty tables mostly.

- to safely quote a word,
- to nicely format a list of words, or a list of strings over multiple lines,
- to recursively format nested tables.

**Look in [`lib/spec_helpers.moon`][spec-helpers].**

Example usage in the template (recall that `h` holds the spec_helpers table)

```etlua
<% for i, case in ipairs(data.cases) do -%>
  <%= test_cmd(i == 1) %> <%- h.quote(case.description) %>, ->
    result = <%= case.property %> <%= h.int_list(case.input.numbers) %>
    expected = <%= h.int_list(case.expected) %>
    assert.are.same expected, result

<% end -%>
```

Note the blank line before the "end" to separate tests.

#### Custom Assertions

Custom assertions are stored in in the generator template.
Currently there is only one:

- [`dnd-character`][dnd-character] -- `assert.is.between value, min, max`

I used to have some more, but the [luassert][luassert] library is quite complete:

- `assert.are.equal expected, actual` -- compare with `==`
- `assert.are.same expected, actual` -- deeply compare tables for same keys and values
- `assert.is.near expected, actual, epsilon` -- floats are approximately equal
- `assert.matches pattern, string [, init [, plain]]` -- pattern matching (with lua patterns)
    - see the lua [string.find][string-find] and [string.match][string-match] docs.
    - luassert uses string.match, or string.find if "plain" is true.

#### Comparing tables deeply

The `assert.are.same t1, t2` assertion is used to compare tables deeply.

However when they don't match, by default busted does not show the whole object, which makes it hard for the student to see the difference.

<details><summary>
Click this sentence to see an example:
</summary>

Consider this `busted` output where something is different in the `...more` sections, but we are not shown what the difference is.

```none
Failure → ./rest_api_spec.moon @ 251
rest-api iou lender owes borrower less than new loan
...uarocks/lib/luarocks/rocks-5.4/busted/2.3.0-1/bin/busted:7: Expected objects to be the same.
Passed in:
(table: 0x641e0548a540) {
 *[users] = {
    [1] = {
      [balance] = 1.0
      [name] = 'Adam'
      [owed_by] = { ... more }
      [owes] = { } }
   *[2] = {
      [balance] = -1.0
      [name] = 'Bob'
      [owed_by] = { }
     *[owes] = { ... more } } } }
Expected:
(table: 0x641e0548a620) {
 *[users] = {
    [1] = {
      [balance] = 1.0
      [name] = 'Adam'
      [owed_by] = { ... more }
      [owes] = { } }
   *[2] = {
      [balance] = -1.0
      [name] = 'Bob'
      [owed_by] = { }
     *[owes] = { ... more } } } }
```

---
</details>

The solution here is to configure the `assert` object,.
In the generator.tmpl file, add this in the preamble:

```none
assert\set_parameter "TableFormatLevel", 4
```

Here, the value `4` was chosen to reflect the max depth of the expected value:

```none
...1...2...3...4
{
    users: {
        {
            owed_by: {
                Bob: 3.0
            }
            balance: 3.0
            owes: {}
            name: "Adam"
        }, 
        ...
``` 


[forum]: https://forum.exercism.org/c/programming/moonscript
[forum-new-topic]: https://forum.exercism.org/new-topic?category=moonscript
[pr-guide]: https://exercism.org/docs/building/github/contributors-pull-request-guide
[pr-other-guide]: https://exercism.org/docs/community/being-a-good-community-member/pull-requests
[exercise-list]: https://github.com/exercism/moonscript/issues/102
[gh-issues]: https://github.com/exercism/moonscript/issues
[gh-pulls]: https://github.com/exercism/moonscript/pulls
[luassert]: https://github.com/lunarmodules/luassert/blob/master/src/assertions.lua
[string-find]: https://www.lua.org/manual/5.4/manual.html#pdf-string.find
[string-match]: https://www.lua.org/manual/5.4/manual.html#pdf-string.match
[style]: ./STYLE.md
[spec-helpers]: ./lib/spec_helpers.moon
[assertions]: ./lib/spec_helpers/assertions.moon
[dnd-character]: ./exercises/practice/dnd-character/dnd_character_spec.moon
[etlua]: https://luarocks.org/modules/leafo/etlua
