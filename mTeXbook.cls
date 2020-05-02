\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mTeXbook}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}

% Required Packages
    \RequirePackage{amsmath,amssymb,amsfonts,amsthm}
    \RequirePackage{authblk}
    \RequirePackage{bm}
    \RequirePackage{bbold}
    \RequirePackage{braket}
    \RequirePackage{color}
    \RequirePackage{cancel}
    \RequirePackage{chapterbib}
    \RequirePackage{enumerate}
    \RequirePackage{fancyhdr}
    \RequirePackage{feynmp}
    \RequirePackage{float}
    \RequirePackage{graphicx}
    \RequirePackage{ifpdf}
    \RequirePackage{listings}
    \RequirePackage{latexsym}
    \RequirePackage{listings}
    \RequirePackage{mathrsfs}
    \RequirePackage{mathtools}
    \RequirePackage{mhchem}
    \RequirePackage{mTeXdefs}
    \RequirePackage[numbers]{natbib}
    \RequirePackage{listings}
    \RequirePackage{pdfsync}
    \RequirePackage{setspace}
    \RequirePackage{silence}
        \WarningFilter{latex}{Command \@arrayparboxrestore has changed.}
    \RequirePackage{slashed}
    \RequirePackage{tabularx}
    \RequirePackage{tocvsec2}
    \RequirePackage{verbatim}
    \RequirePackage{xfrac}
    \RequirePackage{xspace}
    \RequirePackage{simpler-wick}
    \RequirePackage{caption}
    \RequirePackage{subcaption}
    \RequirePackage[document]{ragged2e}
        \setlength{\RaggedRightParindent}{\parindent}
    \RequirePackage{parskip}
        \setlength{\parskip}{0.125\baselineskip plus4pt minus4pt}
    \RequirePackage{lipsum}
%   \RequirePackage[mtpscr]{mtpro2}
%       \pdfmapfile{+mtpro2.map}
	% HyperRef and CleveRef must be called at the end
	\AtBeginDocument{
		\usepackage[colorlinks=true,citecolor=red,hyperfootnotes=true]{hyperref}
    \usepackage{doi}
		\usepackage[nameinlink]{cleveref}
			\crefname{equation}{Eq.~}{Eqs.~}
			\crefname{table}{Table}{Tables}
			\crefname{figure}{Figure}{Figures}
			\crefname{chapter}{Chapter}{Chapters}
			\crefname{appendix}{Appendix}{Appendices}
			\crefname{section}{Section}{Sections}
			\renewcommand{\creflastconjunction}{, and } % Gives Eqs. (1.1), (1.2), and (1.3) as opposed to (1.1), (1.2), (1.3).
		% Graphics rule for proper MetaPost file inclusion
		\ifpdf
		  \DeclareGraphicsRule{*}{mps}{*}{}
		\fi
	}


 % Headers & Index
    	\AtBeginDocument{
	\RaggedRight
        \fancyhf{}
        \fancyhead[LE,RO]{\thepage}
        \fancyhead[RE]{\slshape \nouppercase \leftmark} % Headers italic and lowercase w/caps when specified.
        \fancyhead[LO]{\slshape \nouppercase \rightmark}
        \pagestyle{fancy}

		\let\oldthebibliography=\thebibliography
		\let\endoldthebibliography=\endthebibliography
		\renewenvironment{thebibliography}[1]{
		\oldthebibliography{#1}
		\addcontentsline{toc}{chapter}{\bibname}}{\endoldthebibliography}

		\let\oldtheindex=\theindex
		\let\endoldtheindex=\endtheindex
		\renewenvironment{theindex}{\oldtheindex \addcontentsline{toc}{chapter}{\indexname}}{\endoldtheindex}

		\let\RToldchapter\chapter
		\renewcommand{\chapter}{\if@openright\RTcleardoublepage
				\else\clearpage\fi
				\thispagestyle{empty}%
				\global\@topnum\z@
				\@afterindentfalse
				\secdef\@chapter\@schapter}
	}

% New \chapter command to write "Chapter 1" in TOC instead of "1"
	\def\@chapter[#1]#2{
		\ifnum \c@secnumdepth >\m@ne
			\if@mainmatter
				\refstepcounter{chapter}%
				\typeout{\@chapapp\space\thechapter.}%
				\addcontentsline{toc}{chapter}%
				{\@chapapp\space\thechapter:\space#1}%
			\else
				\addcontentsline{toc}{chapter}{#1}%
			\fi
		\else
		  \addcontentsline{toc}{chapter}{#1}%
		\fi
		\chaptermark{#1}%
		\addtocontents{lof}{\protect\addvspace{10\p@}}%
		\addtocontents{lot}{\protect\addvspace{10\p@}}%
		\if@twocolumn
			\@topnewpage[\@makechapterhead{#2}]%
		\else
		\@makechapterhead{#2}%
		\@afterheading
		\fi}

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

	\renewcommand\l@chapter[2]{%
	\ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}%
		\vskip 1.0em \@plus\p@
		\setlength\@tempdima{1.5em}%
		\begingroup
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\leavevmode \bfseries
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			#1\nobreak\normalfont
			\leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
			\nobreak\hb@xt@\@pnumwidth{\bfseries \hss #2}\par
			\penalty\@highpenalty
			\endgroup
	\fi}

	\newenvironment{abstract}{%
    	\if@twocolumn
    		\@restonecoltrue\onecolumn
    	\else
    		\@restonecolfalse
    	\fi
    	\chapter*{Abstract}
    	%\fontsize{12}{14}\selectfont
    	{\if@restonecol\twocolumn\fi}}

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
	\setlength{\oddsidemargin}{0in}
	\setlength{\evensidemargin}{0in}
	\setlength{\textwidth}{6.5in}
	\setlength{\textheight}{9.0in}
	\setlength\topmargin{0in}
	\setlength\headheight{14.5pt}
	\addtolength\topmargin{-\headheight}
	\addtolength\topmargin{-\headsep}
	\setlength\unitlength{1in}
