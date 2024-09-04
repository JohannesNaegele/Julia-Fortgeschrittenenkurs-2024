module MyModule

export bar, sin

foo() = println("foo")
bar() = println("bar")
sin(x) = x # conflict!

end

# Not in the module, but in the global scope
baz() = println("baz")