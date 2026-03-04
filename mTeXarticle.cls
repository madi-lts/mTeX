\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mTeXarticle}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}
\DeclareHookRule{begindocument}{showkeys}{before}{nameref}

\input{mTeXpackages.sty}
 
% Graphics rule for proper MetaPost file inclusion
\ifpdf
    \DeclareGraphicsRule{*}{mps}{*}{}
\fi

\renewcommand{\bibname}{References}

% Headers & Index
\AtBeginDocument{
    \setlength{\parindent}{15pt}
    \justifying
    % \fancyhf{}
    % \fancyhead{\slshape \nouppercase \leftmark} % Headers italic and lowercase w/caps when specified.
    % \pagestyle{fancy}

    % \let\oldthebibliography=\thebibliography
% 	\let\endoldthebibliography=\endthebibliography
% 	\renewenvironment{thebibliography}[1]{
% 	\oldthebibliography{#1}
% 	\addcontentsline{toc}{section}{\bibname}}{\endoldthebibliography}

    % \let\oldtheindex=\theindex
    % \let\endoldtheindex=\endtheindex
    % \renewenvironment{theindex}{\oldtheindex \addcontentsline{toc}{section}{\indexname}}{\endoldtheindex}
    

}
