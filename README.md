# URIthesis

This repository was created for easy setup of a thesis or Dissertation at the University of Rhode Island. However, this is not a style file, but rather a skeleton of `.tex` files and folders to easily write and format a thesis in LaTeX. URI has a style file which can be found [here](https://web.uri.edu/ecbe/thesisguide/step2/). The URI style file was not used in creating this setup as there are some issues within the URI style file, most likely due to limited maintenance.


## Setup

Comments within the `.tex` files will aid in generating personalized changes such as setting the citation format, paper/electronic versions, or adding additional chapters. However, a few notes to get going are outlined below.

### Adding New Chapters

The current format supports a five-chapter thesis. To add additional chapters, simply create a new folder and chapter file, similar to the others. Add the chapter to the `thesismain.tex` file, in the section seen below.

    %-----------------Compile Chapter Files--------------------

    \include{chapter1/Chapter1}   %
    \include{chapter2/Chapter2}    %
    \include{chapter3/Chapter3}     % - Current Chapters -
    \include{chapter4/Chapter4}    %
    \include{chapter5/Chapter5}   %
    % Add new chapter here
    %---------------------------------------------------------

Within the new chapter `.tex` file, add the preamble seen below and update the `\setcounter{section}{#}` to the number of the new chapter. 


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%% Preamble %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \begin{center}                                                          %
	    \section*{CHAPTER 1}                                                %
	    \textbf{Name of Chapter 1}                                          %
	    \setcounter{section}{1} % <- update # with new chapter #            %
	    \setcounter{table}{0}                                               %
	    \setcounter{figure}{0}                                              %
    \end{center}                                                            %
    \addcontentsline{toc}{section}{CHAPTER 1 - Name of Chapter 1}           %
    \vspace{5mm}                                                            %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
### Committee Signature Pages
    
URI formatting guidelines did not specify the appropriate indentation for these pages. Because of this, these files were just generated with MS word and included as `.pdf` files. Simply open the word document within the `\intropages` folder and open `sign_pages.doc` and change the name of or add the committee members accordingly. Save the file with the `.pdf` extension to the same folder. 
    
    
## Additional Notes

Please feel free to push commits to this repository to further advance the setup, as there is room for improvement. Consider, if your're interested, creating a style file to improve formatting and usability. 


Good Luck!
    

