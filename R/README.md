# R

`.Rprofile` is automatically loaded in every new R session. If you use this file, 
**change devtools.name and devtools.desc.author!** 

Be thoughtful about which packages
and functions you choose to include, as any code you share may not set up the same 
R environment as your `.Rprofile`, making your code unreproducible! With this in mind, my `.Rprofile` 
only loads [devtools](https://github.com/hadley/devtools), configures its options, 
and defines `.quit()` which exits the R session without saving the current workspace.
