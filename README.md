# URI Thesis

This repository was created for easy setup of a thesis or Dissertation at the University of Rhode Island. The setup requires the uri.cls file to adjust formating. 

## Setup

Start by selecting optional parameters to determine overall fromat. These values passed directly to the `\documentclass{}`

 1. Degree type
    - ms = Masters
    - phd = Doctorate
 2. Paper type
    - digitial = Electronic version
    - hardcopy = Print version
 3. Citation type
    - i3e = IEEE
    - apa = apa
    
To create a thesis that is a masters, wehre I want the digital copy, in IEEE format, the `\documentclass{}` would look as follows

    \documentclass[ms,digital,i3e]{uri}


Initialize your manuscript in the `thesismain.tex` file, by setting the following paramets before `\begin{document}`

    \title{the title of your work goes here} %<- write name of thesis here
    \author{your name} %<- Your name here
    \program{systems engineering} %<- Your degree here
    \gradyear{2017} %<- Your graduation year here
    \committee{Major Professor,Member 1,Member 2,Nasser H. Zawia} %<- All committee members her (Comma seperated)


Within `\begin{document}` first call all of your intro pages (title,abstract,etc.), in the order specified by the URI writing guidelines.

    \titlepage % <- Signature pages
    \signpage % <- Signature pages

    \pagenumbering{roman} %<- set page numbering to roman numerals

    \include{intropages/abstract} <- call abstract.tex from file
    \include{intropages/acknowledgements} <- call acknowledgements.tex 
    \contents %<- generate table of contents

A new chapter can be created with the command `\NewChapter{#}{name}`, filling in `#` with the number of the chapter and `name` with the name of the chapter.
    
## Additional Notes

As a suggestion, if you prefer to generate plots using the [`matplotlib`](https://matplotlib.org/) package for Python, consider following the guidelines from [this](http://bkanuka.com/articles/native-latex-plots/) blog post for generating plots in Python that look native to LaTeX.

Please feel free to push commits to this repository to further advance the setup, as there is room for improvement. Consider, adding to the `uri.cls` file to imoprve usability. 


Good Luck!
    

