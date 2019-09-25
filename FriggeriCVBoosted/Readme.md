# Friggeri CV Boosted

[![](https://img.shields.io/badge/PDF-latest-orange.svg?style=flat)](https://github.com/JesperDramsch/friggeri-cv-boosted/tree/master-pdf) [![Build Status](https://travis-ci.org/JesperDramsch/friggeri-cv-boosted.svg?branch=master)](https://travis-ci.org/JesperDramsch/friggeri-cv-boosted)

# Contests

- [CV / Resumé](#about)
    - [Features](#features)
    - [How it looks](#how-it-looks)
- [Options](#options)
    - [Style](#style)
        - [A4 Paper](#a4paper)
        - [No Colors](#no-colors)
        - [Print](#print)
    - [Fonts](#fonts)
        - [Heros](#font-heros)
        - [Alegreya](#font-alegreya)
        - [MerriWeather Sans](#font-merriWeather-sans)
        - [Nunito](#font-nunito)
        - [Roboto](#font-roboto)
    - [Usage](#usage)
        - [\score{n}](#scoren)
        - [\courseentry{}{}{}](#courseentry)
        - [Nunito](#font-nunito)
        - [Roboto](#font-roboto)
- [Technicalities](#technicalities)
- [Coverletter](#coverletter)
    - [Options](#options)

# About

Versatile CV Typeset in LaTeX (XeTeX). Lots of [features](#features) for modern CVs and Resumés. Works for classic CVs, modern CVs, and academic CVs. Typeset beautifully, without the need to actually know design. Modification of the friggeri-cv Latex template with extended colour palette and a choice of libre fonts.

Available on [Overleaf Templates](https://www.overleaf.com/latex/templates/friggeri-cv-boosted/sscbbybmxcqs).

## Features:

* Two Column
* Information-dense
* Fontawesome Icons
* Skill Scoring
* Publication List
* Multiple Fonts
* Student-Friendly

## How it looks:

![Example how a CV with this template can look like page 0](https://raw.githubusercontent.com/JesperDramsch/friggeri-cv-boosted/master-pdf/png/cv-heros-0.png)
![Example how a CV with this template can look like page 1](https://raw.githubusercontent.com/JesperDramsch/friggeri-cv-boosted/master-pdf/png/cv-heros-1.png)
![Example how a CV with this template can look like page 2](https://raw.githubusercontent.com/JesperDramsch/friggeri-cv-boosted/master-pdf/png/cv-heros-2.png)

# Options
Several class options are available:

## Style
* `a4paper`: Changes layout to A4.
* `nocolors`: Changes to black and white, leaves headers.
* `print`: Changes to black and white, removes header to minimize ink usage.

### A4Paper
[![A4 Layout](https://raw.githubusercontent.com/JesperDramsch/friggeri-cv-boosted/master-pdf/png/cv-a4paper-0.png)](https://github.com/JesperDramsch/friggeri-cv-boosted/blob/master-pdf/cv-a4paper.pdf)

### No Colors
[![Version without color](https://raw.githubusercontent.com/JesperDramsch/friggeri-cv-boosted/master-pdf/png/cv-nocolors-0.png)](https://github.com/JesperDramsch/friggeri-cv-boosted/blob/master-pdf/cv-novolors.pdf)

### Print
[![Print version](https://raw.githubusercontent.com/JesperDramsch/friggeri-cv-boosted/master-pdf/png/cv-print-0.png)](https://github.com/JesperDramsch/friggeri-cv-boosted/blob/master-pdf/cv-print.pdf)

## Fonts
* `heros`: Standard TexGyre Heros font (introduced as alternative to Helvetica Neue by Sharelatex)
* `alegreya`: [See Example](https://fonts.google.com/specimen/Alegreya+Sans) Alegreya was chosen as one of 53 "Fonts of the Decade" at the ATypI Letter2 competition in September 2011, and one of the top 14 text type systems.
* `merriweather`: [See Example](https://fonts.google.com/specimen/Merriweather+Sans) Merriweather Sans is traditional in feeling despite the modern shapes it has adopted for screens.
* `nunito`: [See Example](https://fonts.google.com/specimen/Nunito) Nunito is a well balanced sans serif typeface superfamily
* `roboto`: [See Example](https://fonts.google.com/specimen/Roboto) Roboto has a dual nature. It has a mechanical skeleton and the forms are largely geometric. At the same time, the font features friendly and open curves. 

### Font Heros
[![](https://raw.githubusercontent.com/JesperDramsch/friggeri-cv-boosted/master-pdf/png/cv-heros-0.png)](https://github.com/JesperDramsch/friggeri-cv-boosted/blob/master-pdf/cv-heros.pdf)

### Font Alegreya
[![](https://raw.githubusercontent.com/JesperDramsch/friggeri-cv-boosted/master-pdf/png/cv-alegreya-0.png)](https://github.com/JesperDramsch/friggeri-cv-boosted/blob/master-pdf/cv-alegreya.pdf)

### Font MerriWeather Sans
[![](https://raw.githubusercontent.com/JesperDramsch/friggeri-cv-boosted/master-pdf/png/cv-merriweather-0.png)](https://github.com/JesperDramsch/friggeri-cv-boosted/blob/master-pdf/cv-merriweather.pdf)

### Font Nunito
[![](https://raw.githubusercontent.com/JesperDramsch/friggeri-cv-boosted/master-pdf/png/cv-nunito-0.png)](https://github.com/JesperDramsch/friggeri-cv-boosted/blob/master-pdf/cv-nunito.pdf)

### Font Roboto
[![](https://raw.githubusercontent.com/JesperDramsch/friggeri-cv-boosted/master-pdf/png/cv-roboto-0.png)](https://github.com/JesperDramsch/friggeri-cv-boosted/blob/master-pdf/cv-roboto.pdf)


# Usage
Replace all things that need replacing.

Adding new things is easy:
Check Dante for [New Icons in Fontawesome](ftp://ftp.dante.de/tex-archive/fonts/fontawesome/doc/fontawesome.pdf)

## \score{n}
One input integer from 0-5 (inclusive).
### Example:
```
\score{3}
```

### Effect
Will fill number of circle out of five circles to indicate skill level.

## \courseentry{}{}{}{}{}{}
Six inputs

1. Years
1. Degree
1. University
1. Context
1. Thesis
1. Courses

### Example
```
\courseentry
{2011--2012}
{Bachelor {\normalfont of Commerce}}
{The University of California, Berkeley}
{This thesis explored the idea that money has been the cause of untold anguish and suffering in the world. I found that it has, in fact, not.}
{Money Is The Root Of All Evil -- Or Is It?}
{Business for Business Gurus, Money 101}
```

### Effect
Creates a special education-focused \entry in the the entrylist environment.

# Technicalities
Modification of the friggeri-cv Latex template. Original was typeset in Helvetica and using colors inspired by Monokai. Modification uses extended colour palette and a choice of libre fonts.

Uses TikZ for the header and some pretty tricks, XeTeX and fontspec to use fonts, biblatex to print publications and textpos for the aside.

# Coverletter
[![](https://raw.githubusercontent.com/JesperDramsch/friggeri-cv-boosted/master-pdf/png/coverletter.png)](https://github.com/JesperDramsch/friggeri-cv-boosted/blob/master-pdf/coverletter.pdf)

## Options
Several class options are available:

* `a4paper`: Changes layout to A4.
* `nocolors`: Changes to black and white, leaves headers.
* `noadress`: Removes letter head from layout.
