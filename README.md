# simpler.vim

Vim's default behavior for registers is non-obvious, and **simpler.vim** aims
to simplify some of the behavior for ease of use.


## Register Behaviors

You should refer to the
[vim documentation](http://vimdoc.sourceforge.net/htmldoc/change.html#registers)
for a more comprehensive explanation, but I will attempt to give a brief
rundown on the default behavior.


#### Default

- The default register is `*`.
- Registers named `1-9` act like a stack, where `1` is on top.
- Yank (`y`, `Y`) and Delete (`c`, `C`, `d`, `D`, `s`, `S`, `x`, `X`) commands
  save to both `*` and `"` registers unless specified otherwise.
- Paste (`p`, `P`) uses the default register unless specified otherwise

Additionally:
- Yank also saves the text to register `0`.
- For Delete commands:
    - If deleted text is multi-line, saves text to the register stack.
    - If deleted text is within one line, saves text to register `-`.
        - Also saves to the register stack **only** if delete movement was one of:
        `%`, `(`, `)`, `` ` ``, `/`, `?`, `n`, `N`, `{`, `}`.


#### Changes in simpler.vim

- If the deleted text is one character long, it does not get saved to **any**
  register. This includes any character deleted with `x` or `X`, and empty
  lines deleted with `dd`.
- Otherwise, Yank and Delete commands will **always** save to the register
  stack in addition to their default behaviors


#### Side Effects

Due to **simpler.vim** manually manipulating the register stack, the `9`
register is not guaranteed to be usable. Registers `1-8` will work as normal.


## Installation

Install with your favorite package manager (vim-plug, vundle, etc.)


## License

MIT
