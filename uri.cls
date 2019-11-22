\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uri}[2017/12/27 Thesis Format]

\LoadClass[12pt]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Packages Necssary to Run this file %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{setspace}               
\RequirePackage{geometry}               
\RequirePackage{indentfirst}            
\RequirePackage{pgffor,pgf}             
\RequirePackage{changepage}             
\RequirePackage{sectsty}                
\RequirePackage{tocloft}                
\RequirePackage{chngcntr}               


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Options to pass to the Document Class %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  
%  Choose 1 (ms or phd)
%  ms: (Default) produces the Masters Thesis setup 
%  phd: produces the disseration setup
%
%  Choose 1 (digital or hardcopy)
%  digitial: (Default) Produces library rights and electronic sign pages
%  hardcopy: No library rights and signature page with signature lines
% 
%  Choose 1 (i3e or apa)
%  i3e: (default) citations in ieee format
%  apa: citations in apa format

\newif\if@degree \@degreetrue
\DeclareOption{phd}{\@degreefalse}
\DeclareOption{ms}{\@degreetrue}


\newif\if@paper \@paperfalse
\DeclareOption{digital}{\@paperfalse}
\DeclareOption{hardcopy}{\@papertrue}

\newif\if@iTe \@iTetrue
\DeclareOption{i3e}{\@iTetrue}
\DeclareOption{apa}{\@iTefalse}
\ProcessOptions\relax

\if@iTe
	\RequirePackage{notoccite}
\else
	\RequirePackage{apacite}
\fi



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set formatting options Per Uri rules  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\geometry{margin=1in,lmargin=1.5in}
\doublespacing

\sectionfont{\fontsize{12}{12}\selectfont}  
\subsectionfont{\fontsize{12}{12}\selectfont}
\subsubsectionfont{\fontsize{12}{12}\selectfont} 

\counterwithin{figure}{section}
\counterwithin{table}{section}



\newcommand{\@hrule}{\rule{3in}{0.5pt}}

\renewcommand{\contentsname}{\hfill\bfseries\normalsize TABLE OF CONTENTS\hfill}       
\renewcommand{\listtablename}{\hfill\bfseries\normalsize LIST OF TABLES\hfill}         
\renewcommand{\listfigurename}{\hfill\bfseries\normalsize LIST OF FIGURES\hfill}       
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}                                               
\renewcommand\refname{BIBLIOGRAPHY}    

\def\program#1{\gdef\@program{#1}}
\def\gradyear#1{\gdef\@gradyear{#1}}
\def\committee{\gdef\@committee}


\def\@work{
   \if@degree
       Thesis
   \else
       Dissertation
   \fi
}



\newenvironment{bottompar}{\par\vspace*{\fill}\centering}{\clearpage}                        
\newenvironment{midpar}{\par\vspace*{\fill}\centering}

\newenvironment{midparS}{\vspace*{\fill}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Creates the title page %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\titlepage{\thispagestyle{empty}
	\pagestyle{empty}
    \begin{center}
    \MakeUppercase{\@title} \\
    BY \\
    \MakeUppercase{\@author} \\
    \end{center}

    \begin{midpar}
    	A \MakeUppercase{\@work} SUBMITTED IN PARTIAL FULFILLMENT OF THE \\
    	REQUIREMENTS FOR THE DEGREE OF \\
    	\if@degree
    	    MASTERS OF SCIENCE \\
    	\else
    	    DOCTOR OF PHILOSOPHY \\
    	\fi
    	IN \\
    	\MakeUppercase{\@program}
    \end{midpar}

    \begin{bottompar}
    	UNIVERSITY OF RHODE ISLAND \\
    	\@gradyear
    \end{bottompar}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Creates signature pages %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\signpage{\thispagestyle{empty}
	\begin{center}
		\if@degree
		    MASTERS OF SCIENCE IN \MakeUppercase{\@program} \\
        \else
            DOCTOR OF PHILOSOPHY IN \MakeUppercase{\@program} \\
        \fi
        OF \\
        \MakeUppercase{\@author}
	\end{center}

    \begin{midparS}
    	\hangindent=1.5in
    	\hangafter=1
	    \hspace{0.5in} APPROVED: \\
	    Thesis Committee: \\
	    \if@paper
		    Major Professor\@hrule \vspace{-.5\baselineskip}
		    \begin{adjustwidth}{2.3in}{0cm}
		    	\centering
			    \foreach \x [count=\ni] in \@committee {% 
			    	\ifnum\ni=1%
			    	    \x \\
			    	\else
			    	    \@hrule \\ \vspace{-.5\baselineskip}
			    	    \x \\
		    	    \fi}
	    	    DEAN OF THE GRADUATE SCHOOL \\ 
	  	    \end{adjustwidth}
		\else
			Major Professor
			\begin{adjustwidth}{2.3in}{0cm}
				\centering \vspace{-.8\baselineskip}
				\foreach \x [count=\ni] in \@committee {
					\x \\ }%
				 DEAN OF THE GRADUATE SCHOOL \\ 
			\end{adjustwidth}
		\fi
    	     
    \end{midparS}
	\begin{bottompar}
		UNIVERSITY OF RHODE ISLAND \\
		\@gradyear
	\end{bottompar}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Creates Abstract pages  %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\startabstract}{
		\newpage
		\clearpage
		\sloppy
		\begin{center}\section*{ABSTRACT}\end{center}
		\thispagestyle{empty}
		\pagestyle{empty}
		\addcontentsline{toc}{section}{ABSTRACT}
		\setcounter{page}{2}
		
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Creates acknowledgments pages %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\startacknowledgments}{%
		\newpage
		\begin{center}\section*{ACKNOWLEDGMENTS}\end{center}
		\addcontentsline{toc}{section}{ACKNOWLEDGMENTS}
		\thispagestyle{plain}
		\pagestyle{plain}	
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Creates table of contents   %%%%%%
%%%%%% List of figures and Tables  %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\contents}{%
	\newpage
	\tableofcontents
	\addcontentsline{toc}{section}{TABLE OF CONTENTS}
	\listoftables
	\addcontentsline{toc}{section}{LIST OF TABLES}
	\listoffigures
	\addcontentsline{toc}{section}{LIST OF FIGURES}
	\newpage	
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Creates Chapter pages %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\NewChapter}[2]{%
	\newpage
	\begin{center}
		\singlespacing
		\section*{CHAPTER {#1}}
		\textbf{#2}
		\setcounter{section}{#1}                                          
		\setcounter{table}{0}                                               
		\setcounter{figure}{0}
	\end{center}
	\addcontentsline{toc}{section}{CHAPTER {#1} - {#2}}
	\vspace{5mm}  
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Creates appendix pages %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\Appendix}{%
	\newpage
	\begin{center}\section*{APPENDIX}\end{center}
	\addcontentsline{toc}{section}{APPENDIX}
	\thispagestyle{plain}
	\pagestyle{plain}	
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Creates bibliography pages %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\startbib}[1]{%
	\if@iTe
		\bibliographystyle{IEEEtran}
		\bibliography{IEEEabrv,#1}
	\else
		\bibliographystyle{apacite}
		\bibliography{#1}
	\fi
}


