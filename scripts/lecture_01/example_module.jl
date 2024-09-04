module MyModule

export bar, sin

foo() = println("foo")
bar() = println("bar")
sin(x) = x # conflict!

end

baz() = println("baz")