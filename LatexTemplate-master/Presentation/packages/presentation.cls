\NeedsTeXFormat{LaTeX2e}

% Use Beamer presentation class
\PassOptionsToClass{notheorems}{beamer}
\PassOptionsToClass {
	hyperref={
		unicode,
		colorlinks=false,
		pdfborder={0 0 0},
		bookmarks,
		bookmarksopen,
		bookmarksnumbered,
		bookmarksdepth
	}
}{beamer}

\LoadClass{beamer}
\ProvidesClass{presentation}

% Extern Includes
\RequirePackage{mathtools}
\RequirePackage{amsmath}
\RequirePackage{marvosym}
\RequirePackage{listings, verbatim, caption}
%\RequirePackage{gitinfo}
\RequirePackage{placeins}

%% Undefine plain theoremstyle from beamer class
%% this is due to a collision with the ntheorem package
\let\th@plain\relax

\RequirePackage[amsmath, thmmarks, framed]{ntheorem}

% Functionality Includes
\RequirePackage{microtype, setspace}
\RequirePackage{ifxetex, ifluatex, ifdraft}
\RequirePackage{silence}
\RequirePackage{booktabs, afterpage}
\RequirePackage[framemethod=tikz]{mdframed}
%\RequirePackage[
%	unicode,
%	colorlinks=false,
%	pdfborder={0 0 0},
%	bookmarks,
%	bookmarksopen,
%	bookmarksnumbered,
%	bookmarksdepth]{hyperref}
\RequirePackage{adjustbox}
\RequirePackage{etoolbox, environ, xparse}

% TikZ
\RequirePackage{tikz}
\RequirePackage{tikzstuff}
\RequirePackage{forest}
\RequirePackage{tkz-graph}
\RequirePackage{tkz-berge}

\usetikzlibrary{graphs, graphs.standard}
\usetikzlibrary{patterns}
\usetikzlibrary{decorations.pathreplacing}

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
	\RequirePackage[warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}
	\usefonttheme{professionalfonts}
	
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

	\def\lAngle{\langle\langle}
	\def\rAngel{\rangle\rangle}
\fi

\WarningFilter{mdframed}{You got a bad break}

%% Layout
\setstretch{1.12}
\setlength\parskip{0.5em}
\setlength\parindent{0em}

\MakeOuterQuote{"}

\setbeamertemplate{itemize item}{\raisebox{0.2em}{\scalebox{0.4}{\(\blacktriangleright\)}}} 
\setbeamertemplate{itemize subitem}{\raisebox{0.2em}{\scalebox{0.4}{\(\blacktriangleright\)}}} 

%% Colors
\definecolor{bluegray}{rgb}{0.7, 0.85, 0.85}
\definecolor{dkbluegray}{rgb}{0.05, 0.4, 0.4}
\definecolor{dkgreen}{rgb}{0.0, 0.6, 0.0}
\definecolor{gray}{rgb}{0.5, 0.5, 0.5}
\definecolor{mauve}{rgb}{0.58, 0.0, 0.82}

\usecolortheme[named=dkbluegray]{structure}

%% Theorem Style
\mdfdefinestyle{thmstyle}
{
	usetwoside=false,
	leftmargin=0em,
	linewidth=3pt,
	backgroundcolor=black!05,
	linecolor=dkbluegray,
	leftline=true,
	rightline=false,
	bottomline=false,
	topline=false,
	innerleftmargin=0.5em,
	splittopskip=3ex,
	afterlastframe={\vspace{\topsep}}
}

%% Theorem Macros
\newcommand*{\newthm}[2] {
	\newtheorem*{#1}{#2}
	\BeforeBeginEnvironment{#1}{\begin{mdframed}[ntheorem,style=thmstyle]}
	\AfterEndEnvironment{#1}{\end{mdframed}}
}
\newcommand*{\newthmplain}[2] {
	\newtheorem*{#1}{#2}
}

%% Sätze
\theoremstyle{break}
\theorembodyfont{\normalfont}
\theoremheaderfont{\bfseries}

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
\newthm{notationen}{Notationen}
\newthm{warnung}{Warnung}
\newthm{warnungen}{Warnungen}
\newthm{achtung}{Achtung}
\newthm{erinnerung}{Erinnerung}
\newthm{erinnerungen}{Erinnerungen}

\newthmplain{vermutung}{Vermutung}
\newthmplain{vermutungen}{Vermutungen}
\newthmplain{frage}{Frage}
\newthmplain{fragen}{Fragen}
\newthmplain{antwort}{Antwort}
\newthmplain{antworten}{Antworten}
\newthmplain{problem}{Problem}
\newthmplain{probleme}{Probleme}

\newthmplain{beispiel}{Beispiel}
\newthmplain{beispiele}{Beispiele}

%% Beweise
\theoremstyle{nonumberplain}
\theoremheaderfont{\itshape}
\theoremindent=0pt
\theorembodyfont{\normalfont}
\theoremseparator{.}
\theoremsymbol{\scalebox{0.8}{\ensuremath{\blacksquare}}}

%\newtheorem{proof}{Beweis}
\newtheorem{beweisidee}{Beweisidee}
\newtheorem{beweis}{Beweis}

\endinput
