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

- Add the feature or change and [submit a Pull Request][pr-guide] to this repository.

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
    - A stub test generator is created: `exercises/practice/${slug_name}/.meta/spec_generator.moon`

1. Review the canonical data and decide if there are any tests cases to exclude.

   If there are, add `include = false` properties in the exercise's `.meta/tests.toml` file.

   If there are whole test groups to exclude, add an "exclusions" property to the spec_generator module (see below).

1. Considering the canonical data, decide if this exercise makes sense to use a test generator.

    - If no:
        - **delete the stubbed .meta/spec_generator** and create the test suite manually.
        - Use the file `canonical-data/${slug_name}.json` to create the tests.
        - Remember, this track uses TDD, so the first test uses `it` and all the rest use `pending`.

    - If yes:

        1. Edit the spec_generator -- see below for more details.

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

### The spec_generator

The spec_generator.moon file is a MoonScript module containing the functions necessary to generate the test suite for practice exercises.

It is located in `exercises/practice/${slug_name}/.meta/` directory.

It's a module that returns a table.

#### Elements of returned table

- (required) _one_ of the following
    - `module_name`: (string) this is the left-hand side of `${module_name} = require '${slug_name}'` in the test file
    - `module_imports`: (list of strings) this is the list of names that appear in `import ${names} from require '${slug_name}'` in the test file
- (required) `generate_test`: this is a function that creates the body of each test case. It takes 2 parameters:
    - `case` is the Lua object for one test case taken from the canonical data.
    - `level`, default value 2, is the indentation level of the body.
      MoonScript is a whitespace-sensitive language, so we need to be careful about indenting the test functions properly.
- (optional) `test_helpers`: (string) a block of code that gets added at the top of the top-level `describe` block.
  This might include required modules used in the tests, or helper functions, or (more interstingly) custom assertions, or even just helpful comments for students.
- (optional) `exclusions`: (list of tables) identifies things from the canonical data to exclude.
  Normally, setting `include = false` in the tests.toml file is the preferred way to exclude individual tests, but sometimes you want to exclude a whole block of tests.
    - Examples: [`simple-linked-list`][simple-linked-list], [`gigasecond`][gigasecond]
- (optional) `bonus`: (string) bonus tests to add to the spec file as extra challenge for the students.
  These tests are not executed by the test runner.
    - Examples: [`robot-name`][robot-name], [`custom-set`][custom-set]

##### Examples of custom assertions

- [`dnd-character`][dnd-character] -- `assert.between value, min, max`
- [`space-age`][space-age] -- `assert.approx_equal #{case.expected}, result`
- [`alphametics`][alphametics] -- `assert.has.same_kv result, expected`

#### Helper functions for formatting test cases

##### Functions in bin/generate-spec

These functions are exported from [`bin/generate-spec`][generate-spec-exported] for use in spec_generator modules

- `indent(text, level)` -- provide leading whitespace to the appropriate level.
- `quote(str)` -- add quotation marks to the string, single or double as appropriate.
- `is_empty(tbl)` -- predicate: is the table empty
- `is_json_null(value)` -- predicate: is the value `json.null` from dkjson
- `contains(tbl, value)` -- predicate: does the table contain the value (uses `==`)

##### Helper functions

We have a library of helper functions, useful for generating pretty tables mostly.

For example, to nicely format a list of words, or a list of strings over multiple lines, or to recursively format nested tables.

**Look in [`lib/test_helpers.moon`][test-helpers].**

Example:

```moonscript
import int_list, string_list from require 'test_helpers'
...
{
  generate_test: (case, level) ->
    lines = {
      "input = #{int_list case.input.numbers}"
      "expected = #{string_list case.expected, level}"
      ...
```

##### Comparing tables deeply

The `assert.are.same t1, t2` assertion is used to compare tables deeply.

<details><summary>
However when they don't match, by default busted does not show the whole object, which makes it hard for the student to see the difference.
</summary>

Consider this `busted` output where something is different in the `...more` sections.

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
</details>

The solution here is to configure the `assert` object,.
In the spec_generator.moon module, add this:

```none
  -- we have deep tables to compare, display it all when not the same
  test_helpers: [[
  assert\set_parameter "TableFormatLevel", 4
]]
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
[style]: ./STYLE.md
[generate-spec-exported]: ./bin/generate-spec#L51
[test-helpers]: ./lib/test_helpers.moon
[space-age]: ./exercises/practice/space-age/.meta/spec_generator.moon
[alphametics]: ./exercises/practice/alphametics/.meta/spec_generator.moon
[dnd-character]: ./exercises/practice/dnd-character/.meta/spec_generator.moon
[gigasecond]: ./exercises/practice/gigasecond/.meta/spec_generator.moon
[simple-linked-list]: ./exercises/practice/simple-linked-list/.meta/spec_generator.moon
[custom-set]: ./exercises/practice/custom-set/.meta/spec_generator.moon#L42
[robot-name]: ./exercises/practice/robot-name/robot_name_spec.moon#L59
