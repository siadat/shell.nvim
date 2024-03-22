# shell.nvim

Adds the :Shell command for running a non-interactive shell command in a temporary buffer.

[![asciicast](https://asciinema.org/a/QOXhP4cC2XejW90rnWX6OvlHf.svg)](https://asciinema.org/a/QOXhP4cC2XejW90rnWX6OvlHf)
[![asciicast](https://asciinema.org/a/dj4r53MzhokWa2pD86Zi91eTt.svg)](https://asciinema.org/a/dj4r53MzhokWa2pD86Zi91eTt)

## Usage
```
:Shell COMMAND
:Shell --no-follow COMMAND
:Shell --stop
```

## Example
```
:Shell ping -c 3 localhost
```

## Installation
```
require('lazy').setup({
  {
    "siadat/shell.nvim",
    opts = {},
  },
})
```

## Motivation
I wrote this because while the :term and :r! commands are quite nice, I found myself working in a slightly different way.

### Differences with the :term command:
- :Shell does not wrap lines. The output of :term is wrapped and difficult to work with (see https://github.com/neovim/neovim/issues/2514)
- :Shell uses a normal buffer, with no special terminal mode
- :Shell does not provide colors or interactivity because pty is disabled. This is to make sure lines are not wrapped. 
- :Shell process is stopped when the buffer window is closed
- :term and jobstart have a job where the process output is truncated (see https://github.com/neovim/neovim/issues/26543). :Shell provides a workaround by simply sleeping for 0.5s. This is good enough for most usecases until the bug is resolved unpstream. 

### Differences with the :r! command:
- :r! blocks until the process is completed, but :Shell is async and appends the output to the buffer as it is happening
- :Shell creates a new scratch buffer, instead of using the current buffer

