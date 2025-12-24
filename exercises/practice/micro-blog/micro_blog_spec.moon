MicroBlog = require 'micro_blog'

describe 'micro-blog', ->
  it 'English language short', ->
    result = MicroBlog.truncate 'Hi'
    assert.are.equal 'Hi', result

  pending 'English language long', ->
    result = MicroBlog.truncate 'Hello there'
    assert.are.equal 'Hello', result

  pending 'German language short (broth)', ->
    result = MicroBlog.truncate 'brühe'
    assert.are.equal 'brühe', result

  pending 'German language long (bear carpet → beards)', ->
    result = MicroBlog.truncate 'Bärteppich'
    assert.are.equal 'Bärte', result

  pending 'Bulgarian language short (good)', ->
    result = MicroBlog.truncate 'Добър'
    assert.are.equal 'Добър', result

  pending 'Greek language short (health)', ->
    result = MicroBlog.truncate 'υγειά'
    assert.are.equal 'υγειά', result

  pending 'Maths short', ->
    result = MicroBlog.truncate 'a=πr²'
    assert.are.equal 'a=πr²', result

  pending 'Maths long', ->
    result = MicroBlog.truncate '∅⊊ℕ⊊ℤ⊊ℚ⊊ℝ⊊ℂ'
    assert.are.equal '∅⊊ℕ⊊ℤ', result

  pending 'English and emoji short', ->
    result = MicroBlog.truncate 'Fly 🛫'
    assert.are.equal 'Fly 🛫', result

  pending 'Emoji short', ->
    result = MicroBlog.truncate '💇'
    assert.are.equal '💇', result

  pending 'Emoji long', ->
    result = MicroBlog.truncate '❄🌡🤧🤒🏥🕰😀'
    assert.are.equal '❄🌡🤧🤒🏥', result

  pending 'Royal Flush?', ->
    result = MicroBlog.truncate '🃎🂸🃅🃋🃍🃁🃊'
    assert.are.equal '🃎🂸🃅🃋🃍', result
