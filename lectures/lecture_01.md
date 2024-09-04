# Organisation

## Prüfungsleistung
Die zu erbringende Prüfungsleistung besteht einem Kolloquium von 20 Minuten; für die die Zulassung werden 50% der Übungsblattpunkte benötigt. Prüfungsfragen können sich nicht nur auf die Vorlesungsinhalte, sondern auch auf die individuellen Programmieraufgaben/-projekte beziehen.

Die Vorlesungsinhalte sind voraussichtlich:
- Wie entwickelt man ein Paket in Julia?
- Design Patterns bzw. dazu gehörige Beispielprobleme (anhand des Buches *Hands-On Design Patterns and Best Practices with Julia*)
- Beschleunigungsthemen, darunter Techniken wie Threading, GPU-Programmierung, SIMD, smarte Algorithmik, aber auch Julia spezifische Tricks.
- State-of-the-art und interessante neue Pakete und Ansätze (zu plotting, zu autodiff, Pluto.jl, JET.jl, DrWatson.jl, Documenter.jl, Dagger.jl)
- Typische Anwendungen wie Web crawler, Datenbanken, Datenanalyse oder GUI.

Es ist natürlich immer schön, wenn man Konzepte direkt an einem konkreten Projekt zeigen bzw. umsetzen kann. Im besten Fall können wir als Gruppe ein sinnvolles neues Paket schreiben, das nachher tatsächlich einen Mehrwert hat. Inwiefern sich das tatsächlich umsetzen lässt, ist noch nicht abschließend geklärt; Ideen dafür sind:
- Programmierung mit Multi-Armed Bandits. Diese gehen Richtung Reinforcement Learning, aber erfordern nicht allzuviel Vorwissen. Nichtsdestotrotz gibt es einige nette Beschleunigungsprobleme.
- Algorithmik aus der Genetik (Miraculix). Anwendung zu expliziter SIMD-Programmierung in Julia und/oder LLVM Interface
- Das Evergreen Matrixmultiplikation (ein erstaunlich nichttriviales Problem).
- Ein interessantes VWL-Problem (geht auch in Richtung Reinforcement Learning; Fragestellung: Warum hat Geld einen Wert? Wahrscheinlich aber zu schwer).

# Bücher und Materialien

- [Programmierkurs Julia](https://github.com/JohannesNaegele/Programmierkurs-Julia)
- [Julia Programming Projects](https://learning.oreilly.com/library/view/julia-programming-projects/9781788292740/)
- [Hands-On Design Patterns and Best Practices with Julia](https://learning.oreilly.com/library/view/hands-on-design-patterns/9781838648817/)

# Git

Für ordentliche Softwareentwicklung verwendet man quasi immer das Versionsverwaltungsystem Git. Am einfachsten geht Paketentwicklung wohl über GitHub.

[Einführung](https://www.geeksforgeeks.org/top-12-most-used-git-commands-for-developers/) für Anfänger.

# Module

1. Modules are separate namespaces, each introducing a new global scope. This is useful, because it
   allows the same name to be used for different functions or global variables without conflict, as long as they are in separate modules.

2. Modules have facilities for detailed namespace management: each defines a set of names it
   `export`s, and can import names from other modules with `using` and `import`.

3. Modules can be precompiled for faster loading, and may contain code for runtime initialization.

There are three important standard modules:

- Core contains all functionality "built into" the language.
- Base contains basic functionality that is useful in almost all cases.
- Main is the top-level module and the current module, when Julia is started.

## using

Possibly the most common way of loading a module is `using ModuleName`. This loads the code associated with `ModuleName`, and brings

1. the module name

2. and the elements of the export list into the surrounding global namespace.

Technically, the statement `using ModuleName` means that a module called `ModuleName` will be
available for resolving names as needed. When a global variable is encountered that has no
definition in the current module, the system will search for it among variables exported by `ModuleName`
and use it if it is found there. This means that all uses of that global within the current
module will resolve to the definition of that variable in `ModuleName`.

To load a module from a package, the statement using ModuleName can be used. To load a module from a locally defined module, a dot needs to be added before the module name like using .ModuleName.

Nice to know: Large modules can take several seconds to load because executing all of the statements in a module often involves compiling a large amount of code. Julia creates precompiled caches of the module to reduce this time.

## import

brings *only* the module name into scope. Users would need to use `NiceStuff.DOG`, `NiceStuff.Dog`, and `NiceStuff.nice` to access its contents. Usually, `import ModuleName` is used in contexts when the user wants to keep the namespace clean.
As we will see in the next section `import .NiceStuff` is equivalent to `using .NiceStuff: NiceStuff`.

# Pakete

Die offizielle (Kurz-)Anleitung findet sich [hier](https://julialang.org/contribute/developing_package/). Siehe auch [Doku](https://pkgdocs.julialang.org/v1/) zu Pkg.jl, [dieses](https://bjack205.github.io/JuliaTemplateRepo.jl/dev/index.html) Übersichtsrepository und [diesen](https://scientificcoder.com/automate-your-code-quality-in-julia) Artikel.

## CI, CodeCov, CompatHelper, JuliaRegistrator, TagBot

- CI: Allgemein Continuous Integration (vor allem automatisiertes Testen); wir benutzen GitHub Actions
- CodeCov: Gibt an, wieviel Prozent des Pakets wir mit Tests abgedeckt haben
- CompatHelper is a Julia package that helps you keep your `[compat]` entries up-to-date. Whenever one of your package's dependencies releases a new breaking version, CompatHelper opens a pull request on your repository that modifies your `[compat]` entry to reflect the newly released version.
- JuliaRegistrator: Wird verwendet, um Paket offiziell zu registrieren
- TagBot: Erstellt automatisch Tag und Release für offizielles Paket
- Alternativen zu GitHub Actions wären TravisCI, Jenkins usw.

## Docstrings

Siehe Demo.

## Modifikation von bestehenden Paketen

Wie das geht, wird [hier](https://kshyatt.github.io/post/firstjuliapr/) schön erklärt.

# Code formatting

https://github.com/domluna/JuliaFormatter.jl

Templates wie `style = "sciml"` sind ganz nett.

# Hausaufgabe:

Erste Aufgabe: SSH/HTTPS zu GitHub-Konto einrichten; vorliegendes Repository clonen und aktivieren (`Pkg.activate`).