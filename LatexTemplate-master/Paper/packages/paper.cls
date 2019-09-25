\NeedsTeXFormat{LaTeX2e}

% Use KOMA book class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
\LoadClass{scrartcl}
\ProvidesClass{paper}

% Extern Includes
\RequirePackage{mathtools}
\RequirePackage{amsmath, amsfonts, amssymb}
\RequirePackage[amsmath, thmmarks, framed]{ntheorem}
%\RequirePackage{listings, verbatim}
\RequirePackage{caption}

%\RequirePackage{gitinfo}
%\RequirePackage{placeins}

% Functionality Includes
\RequirePackage{scrlayer-scrpage, setspace, microtype}
\RequirePackage{ifxetex, ifluatex, ifdraft}
\RequirePackage{silence}
\RequirePackage{totcount}
\RequirePackage{enumitem, booktabs, afterpage}
\RequirePackage{titling}
\RequirePackage[framemethod=tikz]{mdframed}
\RequirePackage[
	unicode,
	colorlinks=false,
	pdfborder={0 0 0},
	bookmarks,
	bookmarksopen,
	bookmarksnumbered,
	bookmarksdepth]{hyperref}
\RequirePackage[nopostdot, style=super, nomain]{glossaries} % nonumberlist
%\RequirePackage{adjustbox}
%\RequirePackage{etoolbox, environ, xparse}

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
		giveninits,
		url=true]{biblatex}
	
	\RequirePackage{csquotes}
	\RequirePackage{fontspec}
	\RequirePackage[capitalise, nameinlink]{cleveref}
	\RequirePackage[warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}

	%% Fonts
	\setmainfont{Libertinus Serif}
	\setmathfont{XITS Math}
	\setmathfont[range={\rightarrow,\leftarrow,\rightharpoonup,\rightharpoondown,\leftharpoondown,\leftharpoonup}]{TeX Gyre Termes Math}
	\setmathfont[range={\mathcal}]{Latin Modern Math}
\else
	% Alternative Includes
	\RequirePackage[ngerman]{babel}
	\RequirePackage[T1]{fontenc}
	\RequirePackage[utf8]{inputenc}
	\RequirePackage{uniinput}
	\RequirePackage{lmodern}
	\RequirePackage{csquotes}
	\RequirePackage[sb,tt=false]{libertine}
	\RequirePackage[libertine]{newtxmath}
	\RequirePackage[cal=zapfc,bb=boondox]{mathalfa}
	\RequirePackage[capitalise, nameinlink]{cleveref}

	\def\lAngle{\langle\langle}
	\def\rAngel{\rangle\rangle}
\fi

\WarningFilter{mdframed}{You got a bad break}

%% Getter/Setter
\def\thetitle{}
\let\oldTitle\title
\renewcommand*{\title}[1]{\oldTitle{#1}\def\thetitle{#1}}

\def\thesubject{}
\let\oldSubject\subject
\renewcommand*{\subject}[1]{\oldSubject{#1}\def\thesubject{#1}}

\def\theauthor{}
\let\oldAuthor\author
\renewcommand*{\author}[1]{\oldAuthor{#1}\def\theauthor{#1}}

\def\thedate{}
\let\oldDate\date
\renewcommand*{\date}[1]{\oldDate{#1}\def\thedate{#1}}

\def\thekeywords{}
\newcommand*{\keywords}[1]{\def\thekeywords{#1}}

\hypersetup{
	pdftitle={\thetitle},
	pdfauthor={\theauthor},
	pdfsubject={\thesubject},
	pdfkeywords={\thekeywords}
}

% Header and Footer
\clearscrheadfoot
\ihead[]{\normalfont \thetitle}
\ohead{\normalfont \headmark}
\cfoot[\pagemark]{\pagemark}
\automark{section}
\pagestyle{scrheadings}

%% Layout
\setkomafont{section}{\Large}
\setkomafont{disposition}{\bfseries\rmfamily\boldmath}

%\setstretch{1.12}
\setlength\droptitle{-3cm}
\setlength\parskip{0pt}
\setlength\parindent{1em}

\pretitle{\begin{center}\LARGE\textbf}
\posttitle{\par\end{center}}
\renewcommand{\maketitlehookb}{\begin{center}\large\thesubject\par\end{center}\vskip 0.5em}
\preauthor{\begin{center}\Large}
\postauthor{\par\end{center}}
\predate{\begin{center}\Large}
\postdate{\par\end{center}}

\MakeOuterQuote{"}

% Counters & Environments
%% Enumeration Style
\setenumerate{label=(\alph*),leftmargin=2em}
\newlist{wenumerate}{enumerate}{1}
\setlist[wenumerate]{leftmargin=3em}
\setlistdepth{9}

%% Theorem Macro
\DeclareDocumentCommand\newmdtheoremenv{s O{} m o m o }
{
	\IfBooleanTF{#1} {
	\newtheorem*{#3}{#5}
	}
	{
	\ifboolexpr{ test {\IfNoValueTF {#4}} and test {\IfNoValueTF {#6}} }
	{
		\newtheorem{#3}{#5}
	}
	{
		\IfValueTF{#4}{\newtheorem{#3}[#4]{#5}}{}%
		\IfValueTF{#6}{\newtheorem{#3}{#5}[#6]}{}%
	}
	}
	\BeforeBeginEnvironment{#3}{\begin{mdframed}[#2]}
	\AfterEndEnvironment{#3}{\end{mdframed}}
}

% Colors
\definecolor{bluegray}{rgb}{0.7, 0.85, 0.85}
\definecolor{dkgreen}{rgb}{0.0, 0.6, 0.0}
\definecolor{gray}{rgb}{0.5, 0.5, 0.5}
\definecolor{mauve}{rgb}{0.58, 0.0, 0.82}

%% Theorem Style
\mdfdefinestyle{thmstyle}
{
	usetwoside=false,
	linewidth=3pt,
	backgroundcolor=black!05,
	linecolor=bluegray,
	leftline=true,
	rightline=true,
	bottomline=false,
	topline=false,
	afterlastframe={\vspace{\topsep}}
}

%% Theorem Counter
\newcounter{thmcounter}
\def\newthm#1#2{
	\newmdtheoremenv[ntheorem,style=thmstyle]{#1}[thmcounter]{#2}
	\newmdtheoremenv*[ntheorem,style=thmstyle]{#1-nn}{#2}
}
\def\newdef#1#2{\newtheorem{#1}[thmcounter]{#2}\newtheorem*{#1-nn}{#2}}
\theoremseparator{.}
\numberwithin{thmcounter}{section}
\renewcommand*{\thesection}{\arabic{section}}
\renewcommand*{\thethmcounter}{\arabic{section}.\arabic{thmcounter}}

%% Sätze
\theorembodyfont{\normalfont}
\theoremheaderfont{\bfseries}
\theoremstyle{plain}

\newthm{satz}{Satz}
\newthm{theorem}{Theorem}
\newthm{lemma}{Lemma}
\newthm{korollar}{Korollar}
\newthm{folgerung}{Folgerung}
\newthm{hilfssatz}{Hilfssatz}
\newthm{proposition}{Proposition}
\newthm{satz-definition}{Definition und Satz}

%% Notationen, Bemerkungen, Beispiele, etc.
\theorembodyfont{\normalfont}

%\newmdtheoremenv[ntheorem,style=thmstyle,linecolor=green!30]{definition}[theorem]{Definition}
%\newmdtheoremenv*[ntheorem,style=thmstyle,linecolor=green!30]{definition-nn}{Definition}

\newthm{bezeichnung}{Bezeichnung}
\newthm{bezeichnungen}{Bezeichnungen}
\newthm{vorraussetzung}{Vorraussetzung}
\newthm{vorraussetzungen}{Vorraussetzung}
\newthm{bemerkung}{Bemerkung}
\newthm{bemerkungen}{Bemerkungen}
\newthm{definition}{Definition}
\newthm{definitionen}{Definitionen}
\newthm{notation}{Notation}
\newthm{warnung}{Warnung}
\newthm{achtung}{Achtung}
\newthm{erinnerung}{Erinnerung}
\newdef{frage}{Frage}
\newdef{problem}{Problem}
\newdef{beispiel}{Beispiel}
\newdef{beispiele}{Beispiele}

%% Beweise
\theoremstyle{nonumberplain}
\theoremheaderfont{\itshape}
\theoremindent=0pt
\theorembodyfont{\normalfont}
\theoremseparator{.}
\theoremsymbol{\scalebox{0.8}{\ensuremath{\blacksquare}}}
%\theoremsymbol{\scalebox{0.8}{\ensuremath{\square}}}
%\theoremsymbol{\scalebox{0.8}{\text{\textsc{Qed.}}}}

\newtheorem{proof}{Beweis}
\newtheorem{beweisidee}{Beweisidee}
\newtheorem{beweis}{Beweis}

%% Code
%\lstdefinestyle{haskellstyle}{%
%	frame=none,
%	tabsize=8,
%	keepspaces,
%	language=Haskell,
%	aboveskip=3mm,
%	belowskip=3mm,
%	showstringspaces=false,
%	columns=flexible,
%	basicstyle={\small\ttfamily},
%	numbers=none,
%	numberstyle=\tiny\color{gray},
%	keywordstyle=\color{blue},
%	commentstyle=\color{dkgreen},
%	stringstyle=\color{mauve},
%	breaklines=true,
%	breakatwhitespace=true,
%	tabsize=4,
%	extendedchars=true
%}
%\lstnewenvironment{haskellcode}{%
%	\lstset{style=haskellstyle}}{}

\endinput
