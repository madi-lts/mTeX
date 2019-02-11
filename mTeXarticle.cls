\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mTeXarticle}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Required Packages
    \RequirePackage{amsmath,amssymb,amsfonts,amsthm}
    \RequirePackage{bm}
    \RequirePackage{color}
    \RequirePackage{cancel}
    \RequirePackage{enumerate}
    \RequirePackage{fancyhdr}
    \RequirePackage{feynmp}
    \RequirePackage{braket}
    \RequirePackage{float}
    \RequirePackage{graphicx}
    \RequirePackage{ifpdf}
    \RequirePackage{listings}
    \RequirePackage{latexsym}
    \RequirePackage{listings}
    \RequirePackage{mathrsfs}
    \RequirePackage{mathtools}
    \RequirePackage{mTeXdefs}
    \RequirePackage{listings}
    \RequirePackage{pdfsync}
    \RequirePackage{setspace}
    \RequirePackage{slashed}
    \RequirePackage{tabularx}
    \RequirePackage{tocvsec2}
    \RequirePackage{verbatim}
    \RequirePackage{xspace}
    \RequirePackage[document]{ragged2e}
%   \RequirePackage[mtpscr]{mtpro2}
    % HyperRef and CleveRef must be called at the end
    \AtBeginDocument{
        \usepackage[colorlinks=true,linkcolor=blue,citecolor=red,hyperfootnotes=true]{hyperref}
        \usepackage[]{cleveref}
            \crefname{equation}{\hspace{-.25em}}{\hspace{-.25em}}
            \crefname{table}{Table}{Tables}
            \crefname{figure}{Figure}{Figures}
            \crefname{chapter}{Chapter}{Chapters}
            \crefname{appendix}{Appendix}{Appendices}
            \crefname{section}{\S}{\S\S}
            \renewcommand{\creflastconjunction}{, and } % Gives Eqs. (1.1), (1.2), and (1.3) as opposed to (1.1), (1.2), (1.3).
        % Graphics rule for proper MetaPost file inclusion
        \ifpdf
          \DeclareGraphicsRule{*}{mps}{*}{}
        \fi
    }

% Headers & Index
\AtBeginDocument{
    \setlength{\parindent}{15pt}
    \justify
    \fancyhf{}
    \fancyhead{\slshape \nouppercase \leftmark} % Headers italic and lowercase w/caps when specified.
    \pagestyle{fancy}

    \let\oldthebibliography=\thebibliography
    \let\endoldthebibliography=\endthebibliography
    \renewenvironment{thebibliography}[1]{
    \oldthebibliography{#1}
    \addcontentsline{toc}{chapter}{\bibname}}{\endoldthebibliography}

    \let\oldtheindex=\theindex
    \let\endoldtheindex=\endtheindex
    \renewenvironment{theindex}{\oldtheindex \addcontentsline{toc}{chapter}{\indexname}}{\endoldtheindex}
}
