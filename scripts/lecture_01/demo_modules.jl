# Reminder: local vs. global Variables:
f(x) = (a = 3; return x * a) # local scope
f(3)
a

# Base library
parentmodule(sin)

# include another file
include("./example_module.jl")

import .MyModule # dot is necessary since the module is not in a package
import .MyModule as MM
using .MyModule
using .MyModule: bar
import .MyModule: sin as engineer_sin

baz()
sin(1)
MyModule.sin(1)
MM.sin(1)
engineer_sin(1)

foo()
bar()