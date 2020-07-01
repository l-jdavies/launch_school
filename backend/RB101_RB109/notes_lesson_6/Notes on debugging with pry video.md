# Notes on debugging with pry video

## Pry as REPL

`pry` can be used as a REPL (read evaluate print loop) instead of `irb` . It has several advantages over `irb` such as the ability to `cd` into an object, such as an Array. Within the object `ls` shows a list of methods available on that object. `cd /` returns to the main scope. `show-doc <method>` shows the documentation for the method called in the command.

## Debugging with pry

`binding.pry` pauses the execution of a program to enable debugging. `binding` is something that contains references to any variables that were in scope at the time the binding was created. `pry` interrupts program execution and *pries* open the binding for examination.

It's important to take care with the placement of `binding.pry` in code. For example, if you place it on the last line of a block, `binding.pry` will be the last command executed and the return value of `binding.pry` is `nil`.

`whereami` shows the current location within a program. You can pass in an argument, such as `whereami 20` to show 20 lines of code before and after the `binding.pry` step. 

## `pry-byebug`

This is an extension of `pry`. It contains the commands:

`next` - move to the next step within the code

`step` - step into a process, such as a method

`continue` - move to the next iteration