# About MoonScript

MoonScript was created by [Leaf Corcoran][leafo] as a more streamlined and "friendlier" alternative to [Lua][lua], a popular scripting language known for its speed and embeddability.
Often described as "CoffeeScript for Lua," MoonScript's design philosophy centers on readability and ease of use, aiming to reduce the verbosity of Lua while retaining its core strengths.
It achieves this by transpiling its code directly into standard Lua, meaning it can run on any platform that supports a Lua interpreter.

The primary function of MoonScript is to provide a more elegant and developer-friendly syntax for writing code that ultimately runs as Lua.
It introduces features not native to Lua, such as classes, list comprehensions, and a more intuitive syntax for table manipulation.
By compiling to Lua, it allows developers to leverage the vast ecosystem of existing Lua libraries and frameworks without modification, offering the best of both worlds: a modern, expressive syntax with the performance and portability of a well-established language.

Due to its nature as a Lua preprocessor, MoonScript finds its home in many of the same domains as Lua itself.
It is particularly popular in game development, especially within game engines that use Lua for scripting, such as LÖVE 2D and Defold.
Its concise syntax allows for faster development and easier maintenance of game logic.
Beyond gaming, it is also used in web development, with frameworks like Lapis (which was also created by the author of MoonScript) and OpenResty, and for general-purpose scripting and application development.

To learn more about MoonScript, the official website at [moonscript.org][moon] is the best starting point.
The community, while smaller than that of more mainstream languages, is active on platforms like [GitHub][github] and [Discord][discord].
For those familiar with Lua, the transition is often smooth, as MoonScript's syntax is designed to be intuitive and easy to pick up.

[leafo]: https://leafo.net
[lua]: https://exercism.org/tracks/lua/about
[moon]: https://moonscript.org
[github]: https://github.com/leafo/moonscript
[discord]: https://discord.gg/Y75ZXrD
