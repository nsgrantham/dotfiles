# LaTeX

LaTeX is a typesetting program for creating documents that benefit from explicit formatting rules and usually contain mathematical formulas. It can be a huge pain at times, but the results look great and it sure beats working in Microsoft Word. :)


[Latexmk](https://www.ctan.org/pkg/latexmk/) is a Perl program that automates the process behind generating a pdf document from tex and is included with most LaTeX installations. 
It can be [configured to interact with Skim](http://mg.readthedocs.io/latexmk.html#configuration-files), a pdf previewer for macOS, allowing the pdf to update automatically with saved changes to the tex file, and 
`.latexmkrc`.

I almost exclusively compile documents with XeLaTeX (rather than PDFLaTeX) because it accepts graphic formats like png without any fiddling. Thus,`.latexmkrc` forces latexmk to compile with XeLaTeX without the need to specify `latexmk --xelatex` every time.
