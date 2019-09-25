\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{heros}{
  \def\@cv@fontface{texgyreheros}
}
\DeclareOption{alegreya}{
    \def\@cv@fontface{AlegreyaSans}
}
\DeclareOption{merriweather}{
    \def\@cv@fontface{MarriweatherSans}
}
\DeclareOption{nunito}{
    \def\@cv@fontface{Nunito}
}
\DeclareOption{roboto}{
    \def\@cv@fontface{Roboto}
}

\DeclareOption{nocolors}{\def\@cv@nocolors{}}
\DeclareOption{print}{\def\@cv@print{}}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption,10pt}{article}%
}
\ExecuteOptions{heros}

\ProcessOptions\relax
\LoadClass{article}
\RequirePackage{longtable}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{friggerigreen}{HTML}{C2E15F}
\definecolor{friggeriorange}{HTML}{FDA333}
\definecolor{friggeripurple}{HTML}{D3A4F9}
\definecolor{friggerired}{HTML}{FB4485}
\definecolor{friggeriblue}{HTML}{6CE0F1}
\definecolor{friggeriyellowgreen}{HTML}{13B4CD}
\definecolor{friggeribrickred}{HTML}{8913CD}
\definecolor{friggerisepia}{HTML}{CD8913}
\definecolor{friggeribrown}{HTML}{A52A2A}

\ifdefined\@cv@print
  \colorlet{friggerigreen}{gray}
  \colorlet{friggeriorange}{gray}
  \colorlet{friggeripurple}{gray}
  \colorlet{friggeribrown}{gray}
  \colorlet{friggerired}{gray}
  \colorlet{friggeriblue}{gray}
  \colorlet{friggeriyellowgreen}{gray}
  \colorlet{friggeribrickred}{gray}
  \colorlet{friggerisepia}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

\def\colorPallete{{"friggeriblue","friggerired","friggeriorange","friggerigreen","friggeripurple","friggeribrown","friggeriyellowgreen","friggeribrickred"}}

\ifdefined\@cv@nocolors
  \colorlet{friggerigreen}{gray}
  \colorlet{friggeriorange}{gray}
  \colorlet{friggeripurple}{gray}
  \colorlet{friggeribrown}{gray}
  \colorlet{friggerired}{gray}
  \colorlet{friggeriblue}{gray}
  \colorlet{friggeriyellowgreen}{gray}
  \colorlet{friggeribrickred}{gray}
  \colorlet{friggerisepia}{gray}
\fi

%%%%%%%%%
% Fonts %g
%%%%%%%%%
\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}
\RequirePackage{fontawesome}
\RequirePackage{calc}

% \RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
% 
% \newfontfamily\bodyfont[]{Helvetica Neue}
% \newfontfamily\thinfont[]{Helvetica Neue UltraLight}
% \newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}
% 
% \defaultfontfeatures{Mapping=tex-text}
% \setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue Light}
% 
% \setmathfont{XITS Math}

%%% modified by Karol Kozioł for ShareLaTex use
%\RequirePackage[quiet]{fontspec}
%\RequirePackage[math-style=TeX]{unicode-math}

\newfontfamily\bodyfont
[Path=fonts/\@cv@fontface/,
BoldFont=\@cv@fontface-Bold.ttf,
ItalicFont=\@cv@fontface-Italic.ttf,
BoldItalicFont=\@cv@fontface-BoldItalic.ttf]
{\@cv@fontface-Regular.ttf}
\newfontfamily\thinfont[Path=fonts/\@cv@fontface/]{\@cv@fontface-Light.ttf}
\newfontfamily\headingfont[Path=fonts/\@cv@fontface/]{\@cv@fontface-Bold.ttf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[Mapping=tex-text, Color=textcolor,
Path=fonts/\@cv@fontface/,
BoldFont=\@cv@fontface-Bold.ttf,
ItalicFont=\@cv@fontface-Italic.ttf,
BoldItalicFont=\@cv@fontface-BoldItalic.ttf
]
{\@cv@fontface-Regular.ttf}

\setmathfont[Path=fonts/\@cv@fontface/]{\@cv@fontface-Regular.ttf}
%%%

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        friggeriblue\or%
        friggerired\or%
        friggeriorange\or%
        friggerigreen\or%
        friggeripurple\or%
        friggeribrown\or%
        friggeriyellowgreen\or%
        friggeribrickred\or%
        friggerisepia\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {%
  \large\headingfont\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%
\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{longtable}{@{\extracolsep{\fill}}ll}
}{%
  \end{longtable}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}
\newcommand{\courseentry}[6]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}}\\%
  \multicolumn{1}{r}{\footnotesize Thesis}&\parbox[t]{11.8cm}{#5}\\%
  \multicolumn{1}{r}{\footnotesize Coursework}&\parbox[t]{11.8cm}{{\footnotesize #6}%
  \vspace{\parsep}}\\}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.6}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[backend=biber, style=verbose, maxnames=99, sorting=ydnt, defernumbers=true]{biblatex}

\DeclareFieldFormat[article,%
                    thesis,%
                    book,%
                    inproceedings,%
                    misc,%
                    software,%
                    report]{title}{\small#1\par}

\DeclareBibliographyDriver{thesis}{%
  \printfield{title}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit*{\addcomma\space}%
    \usebibmacro{institution+location+date}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
  }
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{doi}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
  }
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{doi}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{book}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}


\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \newunit%
  }
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{doi}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{eprint}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{software}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{url}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareNameFormat{author}{%
  \small\addfontfeature{Color=lightgray}%
  \ifgiveninits
    {\usebibmacro{name:given-family}
      {\namepartfamily}
      {\namepartgiveni}
      {\namepartprefix}
      {\namepartsuffix}}
    {\usebibmacro{name:given-family}
      {\namepartfamily}
      {\namepartgiven}
      {\namepartprefix}
      {\namepartsuffix}}%
  \usebibmacro{name:andothers}}

\setlength{\bibitemsep}{0.5ex}

 \defbibheading{bibheading}[\bibname]{%
   \vspace{0.3\baselineskip}%
   \large\headingfont\color{headercolor}#1%
   \markboth{#1}{#1}
 }

 \newcommand{\printbibsection}[3][]{
  \begin{refsection}
     \nocite{*}
     \ifblank{#1}{%
         \printbibliography[sorting=chronological, type={#2}, title={#3}, heading=bibheading]%
     }{%
     \ifblank{#2}{%
         \printbibliography[sorting=chronological, #1, title={#3}, heading=bibheading]%
         }{%
         \printbibliography[sorting=chronological, #1, type={#2}, title={#3}, heading=bibheading]%
         }
     }
  \end{refsection}
 }
  

  
  
 \DeclareSortingScheme{chronological}{
   \sort[direction=descending]{\field{year}}
   \sort[direction=descending]{\field{month}}
 }



%%%%%%%%%%%%%%
% References %
%%%%%%%%%%%%%%

\newlength{\listdoubleitemmaincolumnwidth}
\setlength{\listdoubleitemmaincolumnwidth}{5.5cm}%

\newcommand{\cvref}[7]{%
    {\bf#1}\newline% Name
    {\addfontfeature{Color=lightgray}\itshape%
    \ifthenelse{\equal{#2}{}}{}{#2\newline}% Department
    \ifthenelse{\equal{#3}{}}{}{#3\newline}% Adresse
    \ifthenelse{\equal{#4}{}}{}{#4\newline}% PLZ
    \ifthenelse{\equal{#5}{}}{}{#5\newline}}% Land
  	\ifthenelse{\equal{#6}{}}{}{\href{mailto:#6}{#6}\newline} %email
	\ifthenelse{\equal{#7}{}}{}{#7}\\\vspace{.3\baselineskip}%Phone
}

\newcommand{\refrow}[2]{%
    \begin{minipage}[t]{\listdoubleitemmaincolumnwidth}{#1}\end{minipage}%
    \hspace{2cm}%
    \begin{minipage}[t]{\listdoubleitemmaincolumnwidth}{#2}\end{minipage}\\%
}

%%%%%%%%%%%%%%
% Points %
%%%%%%%%%%%%%%

\usetikzlibrary{shapes}
\newcommand\score[1]{
\pgfmathsetmacro\pgfxa{#1+1}
\tikzstyle{scorestars}=[circle, draw,inner sep=2.25pt,anchor=south]
  \begin{tikzpicture}[baseline]
    \foreach \i in {1,...,5} {
    \pgfmathparse{(\i<=#1?\colorPallete[5-#1]:"white")}
    \edef\starcolor{\pgfmathresult}
    \draw (\i*1.75ex,0) node[name=star\i,scorestars,fill=\starcolor]  {};
   }
  \end{tikzpicture}
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage[hidelinks]{hyperref}
