\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mTeXbook}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}

\input{mTeXpackages.sty}

\ifpdf
	\DeclareGraphicsRule{*}{mps}{*}{}
\fi
	
\newcommand{\setupheader}{
\makeatletter
    \if@twoside
        % \fancyhead[LE,RO]{\thepage}
        \fancyhead[RO]{\nouppercase \leftmark} % Headers italic and lowercase w/caps when specified.
        \fancyhead[LE]{\nouppercase \rightmark}
    \else
    \if@openany
        \fancyhead[RE,RO]{\thepage}
        \fancyhead[RE]{\nouppercase\rightmark} % Headers italic and lowercase w/caps when specified.
        \fancyhead[RO]{\nouppercase\rightmark} % Headers italic and lowercase w/caps when specified.    
    \fi
\makeatother
}

 % Headers & Index
\AtBeginDocument{
		\justifying


		\let\oldthebibliography=\thebibliography
		\let\endoldthebibliography=\endthebibliography
		\renewenvironment{thebibliography}[1]{
		\oldthebibliography{#1}
		\addcontentsline{toc}{chapter}{\bibname}}{\endoldthebibliography}

		\let\oldtheindex=\theindex
		\let\endoldtheindex=\endtheindex
		\renewenvironment{theindex}{\oldtheindex \addcontentsline{toc}{chapter}{\indexname}}{\endoldtheindex}


				
	    \captionsetup{labelfont=bf,
	                  width=0.90\textwidth,
	                  justification=justified}
}

% New \chapter command to write "Chapter 1" in TOC instead of "1"
	% \def\@chapter[#1]#2{
	% 	\ifnum \c@secnumdepth >\m@ne
	% 		\if@mainmatter
	% 			\refstepcounter{chapter}%
	% 			\typeout{\@chapapp\space\thechapter.}%
	% 			\addcontentsline{toc}{chapter}%
	% 			{\@chapapp\space\thechapter:\space#1}%
	% 		\else
	% 			\addcontentsline{toc}{chapter}{#1}%
	% 		\fi
	% 	\else
	% 	  \addcontentsline{toc}{chapter}{#1}%
	% 	\fi
	% 	\chaptermark{#1}%
	% 	\addtocontents{lof}{\protect\addvspace{10\p@}}%
	% 	\addtocontents{lot}{\protect\addvspace{10\p@}}%
	% 	\if@twocolumn
	% 		\@topnewpage[\@makechapterhead{#2}]%
	% 	\else
	% 	\@makechapterhead{#2}%
	% 	\@afterheading
	% 	\fi}
	%
	\newcommand{\RTcleardoublepage}{
		\clearpage
		\if@twoside
			\ifodd
				\c@page
			\else
				\thispagestyle{empty}\hbox{}\newpage
				\if@twocolumn\hbox{}\newpage\fi
			\fi
		\fi}

	\let\RToldcleardoublepage\cleardoublepage
	\renewcommand{\cleardoublepage}{\RTcleardoublepage}

	\renewcommand{\bibname}{References}


	\newenvironment{abstract}{%
    	\chapter*{Abstract}
    	{}}

  \def\@maketitle{%
    \newpage
    \null
    \vskip 2em%
    \begin{center}%
    \let \footnote \thanks
      {\HUGE \@title \par}%
      \vskip 1.5em%
      {\large
        \lineskip .5em%
        \begin{tabular}[t]{c}%
          \@author
        \end{tabular}\par}%
      \vskip 1em%
      %{\large \@date}%
    \end{center}%
    \par
    \vskip 1.5em}

% adjust margins for binding  (changed 2007-04-24 tgp)
	% \setlength{\oddsidemargin}{0in}
	% \setlength{\evensidemargin}{0in}
	% % \setlength{\textwidth}{6.5in}
	% % \setlength{\textheight}{9.0in}
	% \setlength\topmargin{0in}
	% \setlength\headheight{14.5pt}
	% \addtolength\topmargin{-\headheight}
	% \addtolength\topmargin{-\headsep}
	% \setlength\unitlength{1cm}
% figure parameters
