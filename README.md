# Zsh Alias Suggester

This is a small set of Zsh commands to use the right-hand prompt for suggesting a shorter
alternative for the command you just typed (if available). This is done by looking at the aliases
that are currently defined.

![](https://github.com/hilverd/zsh-alias-suggester/blob/master/example.png)

## Installation

Download [zsh-alias-suggester.sh](zsh-alias-suggester.sh) and source it from your `.zshrc`:

```
source /path/to/zsh-alias-suggester.sh
```

## Limitations

The current implementation could be made more sophisticated. For example, if you type `some-command
--foo --bar` and you have an alias

```
alias sc='some-command --bar'
```

set up, then `sc --foo` will *not* be suggested as a shorter alternative. In other words, the alias
suggester does not take all possible permutations of command-line options into account, even though
that could be appropriate in many cases.
