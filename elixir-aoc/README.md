# Advent of Code Elixir

A batteries included starter pack for participating in [Advent of Code](https://www.adventofcode.com) using Elixir!

### Boilerplate Generate Usage

```bash
$ mix generate all 2022 01
```

### Optional Automatic Input Retriever

This starter comes with a module that will automatically get your inputs so you
don't have to mess with copy/pasting. Don't worry, it automatically caches your
inputs to your machine so you don't have to worry about slamming the Advent of
Code server. You will need to configure it with your cookie and make sure to
enable it. You can do this by creating a `config/secrets.exs` file containing
the following:

```elixir
import Config

config :advent_of_code, AdventOfCode.Input,
  allow_network?: true,
  session_cookie: "..." # yours will be longer
```

After which, you can retrieve your inputs using the module:

```elixir
day = 1
year = 2022
AdventOfCode.Input.get!(day, year)
# or just have it auto-detect the current year
AdventOfCode.Input.get!(7)
# and if your input somehow gets mangled and you need a fresh one:
AdventOfCode.Input.delete!(7, 2019)
# and the next time you `get!` it will download a fresh one -- use this sparingly!
```
