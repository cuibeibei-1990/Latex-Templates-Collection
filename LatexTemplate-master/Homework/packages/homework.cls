\NeedsTeXFormat{LaTeX2e}

% Use KOMA article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
\LoadClass[headings=small,11pt,DIV=12]{scrartcl}
\ProvidesClass{homework}

% Includes
\RequirePackage{mathtools, amsmath, amssymb}
\RequirePackage{scrletter, scrlayer-scrpage, setspace}
\RequirePackage{ifxetex, ifluatex}
\RequirePackage[framemethod=tikz]{mdframed}
\RequirePackage[amsmath, thmmarks, framed]{ntheorem}
\RequirePackage{booktabs, adjustbox, totcount, enumitem, etoolbox, environ, xparse, fp}
\RequirePackage[
	unicode,
	colorlinks=false,
	pdfborder={0 0 0},
	bookmarks,
	bookmarksopen,
	bookmarksnumbered,
	bookmarksdepth]{hyperref}

% Accent color
\definecolor{bluegray}{rgb}{0.5, 0.65, 0.85}

% Class Macros
\newif\ifxetexorluatex
\ifxetex
	\xetexorluatextrue
\else \ifluatex
	\xetexorluatextrue
\else
	\xetexorluatexfalse
\fi \fi

% Configuration
\ifxetexorluatex
	% Specific Includes
	\RequirePackage[babelshorthands]{polyglossia}
	\setdefaultlanguage{german}
	\PolyglossiaSetup{german}{indentfirst=true}

	\RequirePackage[
		backend=biber,
		style=alphabetic,
		abbreviate=false]{biblatex}
	
	\RequirePackage{csquotes}
	\RequirePackage{fontspec}
	\RequirePackage[capitalise, nameinlink]{cleveref}
	\RequirePackage[warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}

	%% Fonts
	\setmainfont{Libertinus Serif}
	\setmathfont{Libertinus Math}
	\setmathfont[range={\mathbb}]{XITS Math}
	\setmathfont[range={\mathcal}]{Latin Modern Math}
\else
	\ClassError{paper}{Not supported compiler.}{Please use LuaLaTeX or XeTeX.}
\fi

% Layout
\addtokomafont{disposition}{\centering \normalfont\scshape}
\setkomafont{date}{\large}
\setkomafont{author}{\large}

\setstretch{1.1}
\setlength\parindent{1ex}
\renewcommand*{\sectionformat}{}

% Theorem Configuration

\renewtheoremstyle{plain}%
	{\item[\hskip\labelsep \theorem@headerfont ##1\ ##2\theorem@separator]}%
	{\item[\hskip\labelsep \theorem@headerfont ##1\ ##2\ {\normalfont(##3)}\theorem@separator]}
\renewtheoremstyle{break}%
	{\item\hbox to \textwidth{\theorem@headerfont ##1\
		##2\theorem@separator\hfill}}%
	{\item\hbox to \textwidth{\theorem@headerfont ##1\ ##2\
		{-- ##3}\theorem@separator\hfill}}

\DeclareDocumentCommand\newmdtheoremenv{s O{} m o m o }{
	\IfBooleanTF{#1}{
		\newtheorem*{#3}{#5}%
	}{
		\ifboolexpr{ test {\IfNoValueTF {#4}} and test {\IfNoValueTF {#6}} }{
			\newtheorem{#3}{#5}} {
				\IfValueTF{#4}{\newtheorem{#3}[#4]{#5}}{}
				\IfValueTF{#6}{\newtheorem{#3}{#5}[#6]}{}
			}
		}
		\BeforeBeginEnvironment{#3}{\begin{mdframed}[#2]}
		\AfterEndEnvironment{#3}{\end{mdframed}
	}
}

\mdfdefinestyle{thmstyle}{
	usetwoside=false,
	leftmargin=0em,
	linewidth=3pt,
	backgroundcolor=black!05,
	linecolor=bluegray,
	leftline=true, rightline=true, bottomline=false, topline=false,
	innerleftmargin=0.5em,
	splittopskip=3ex,
	afterlastframe={\vspace{\topsep}}
}

\newtotcounter{exercisenumber}
\newcounter{theoremcounter}

\def\newthm#1#2{
	\newmdtheoremenv[ntheorem,style=thmstyle]{#1}[theoremcounter]{#2}
	\newmdtheoremenv*[ntheorem,style=thmstyle]{#1-nn}{#2}
}

\def\newdef#1#2{
	\newtheorem{#1}[theoremcounter]{#2}\newtheorem*{#1-nn}{#2}
}
\theoremseparator{.}
%\numberwithin{theoremcounter}{section}
%\numberwithin{theoremcounter}{exercisenumber}

% Theorems

\newthm{theorem}{Satz}
\newthm{lemma}{Lemma}
\newthm{corollary}{Korollar}
\newthm{proposition}{Proposition}
\newthm{theorem-definition}{Definition und Satz}

\newdef{notation}{Notation}
\newdef{definition}{Definition}

\theoremstyle{nonumberplain}
\theoremsymbol{\ensuremath{\blacksquare}}
\theoremseparator{.}
\theorembodyfont{\normalfont}
\theoremheaderfont{\itshape}
\newtheorem{proof}{Beweis}

% Tasks

\theoremstyle{break}
\theoremsymbol{}
\theoremseparator{:}
\theorembodyfont{\normalfont}
\theoremheaderfont{\bfseries}
\newtheorem{exer}[exercisenumber]{Aufgabe}

\xdef\totalpoints{0.0}

\newcommand{\addPT}[2]{%
	\edef\tempA{A{#1} &}
	\edef\tempB{\qquad/{#2} &}
	\expandafter\gappto\expandafter\PTableA\expandafter{\tempA}
	\expandafter\gappto\expandafter\PTableB\expandafter{\tempB}
	\expandafter\gappto\expandafter\PTHead\expandafter{c | }
}

\NewDocumentEnvironment{task}{m o}{%
	\def\points{#1}
	\IfNoValueTF{#2}{
		\exer
	}{
		\exer[#2]
	}
}{
	\endexer

	% add points to totalpoints and store value globally
	\FPadd\result\totalpoints{\points}
	\xdef\totalpoints{\FPprint\result}

	% round points to at most one decimal place
	\FPifint\points
		\FPround\points\points{0}
	\else
		\FPround\points\points{1}
	\fi

	\addPT{\arabic{exercisenumber}}{\FPprint{\points}}
	\nopagebreak\hspace*{\fill}\mbox{A\arabic{exercisenumber}: \framebox[1.55cm]{\hfill/\FPprint{\points}}}
}

\newlist{subtask}{enumerate}{10}
\setlist[subtask]{label=(\alph*),leftmargin=*}

\newcommand{\pointtable}{
	\begin{center}
		\ifcsname PTableASaved\endcsname
			\expandafter\tabular\expandafter{\PTHeadSaved c}
				\PTableASaved \(\sum\) \\ \hline
				\PTableBSaved \qquad / \totalpointsSaved
			\endtabular
			\vspace{2ex}
		\else
			\ClassWarning{Compile again}
		\fi
	\end{center}
}

\clubpenalty10000
\widowpenalty10000

%% Header, Footer and Metadata
\KOMAoptions{headsepline=true}
\clearscrheadfoot
\ihead[Gruppe \thegroup]{Gruppe \thegroup\\}
\ohead{\theauthor\\\thesubject}
\cfoot[\pagemark]{\pagemark}
\pagestyle{scrheadings}

%% Getters and Setters
\def\thetitle{}
\newcommand*{\settitle}[1]{\title{#1}\setkomavar{title}[Titel]{#1}\def\thetitle{#1}}
%\newcommand*{\thetitle}{{\protect\usekomavar{title}}}

\def\thesubject{}
\newcommand*{\setsubject}[1]{\subject{#1}\setkomavar{subject}[Thema]{#1}\def\thesubject{#1}}
%\newcommand*{\thesubject}{\usekomavar{subject}}

\newkomavar{author}
\def\theauthor{}
\newcommand*{\setauthor}[1]{\author{#1}\setkomavar{author}[Autor]{#1}\def\theauthor{#1}}
%\newcommand*{\theauthor}{\usekomavar{author}}

\def\thedate{}
\newcommand*{\setdate}[1]{\date{#1}\setkomavar{date}[Datum]{#1}\def\thedate{#1}}
%\newcommand*{\thedate}{\usekomavar{date}}

\newkomavar{group}
\def\thegroup{}
\newcommand*{\setgroup}[1]{\setkomavar{group}[Gruppe]{#1}\def\thegroup{#1}}
%\newcommand*{\thegroup}{\usekomavar{group}}

% Start and End
\AtBeginDocument{%
	\maketitle
	\pointtable%
	\thispagestyle{plain.scrheadings}

	\hypersetup{
		pdftitle={\thetitle},
		pdfauthor={\theauthor},
		pdfsubject={\thesubject},
		pdfkeywords={Übungsblatt},
	}
}

\AtEndDocument{
	\makeatletter
	\immediate\write\@mainaux{\string\gdef\string\PTableASaved{\PTableA}}%
	\immediate\write\@mainaux{\string\gdef\string\PTableBSaved{\PTableB}}%
	\immediate\write\@mainaux{\string\gdef\string\PTHeadSaved{\PTHead}}%
	\FPifint\totalpoints
		\FPround\totalpoints\totalpoints{0}
	\else
		\FPround\totalpoints\totalpoints{1}
	\fi
	\immediate\write\@mainaux{\string\gdef\string\totalpointsSaved{\FPprint{\totalpoints}}}%
	\makeatother
}
