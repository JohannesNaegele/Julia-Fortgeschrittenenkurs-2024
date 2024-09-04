using PkgTemplates

t = Template(;
    user="JohannesNaegele",
    authors=["Johannes Nägele"],
    plugins=[
        Git(),
        GitHubActions(),
        Codecov()
    ],
    dir="~/Documents/GitHub/" # my prefered path
)

t("MyFirstPackage.jl")