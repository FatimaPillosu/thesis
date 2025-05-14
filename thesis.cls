\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2025/01/08 Custom Thesis Class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Base class
\LoadClass[10pt,twoside]{book} % Font size 11pt, two-sided layout

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Packages
\RequirePackage{array}
\RequirePackage{amsmath}
\RequirePackage{booktabs}
\RequirePackage{ifoddpage}
\RequirePackage{eso-pic}
\RequirePackage{tikz}
\RequirePackage{geometry} % Configure page layout
\RequirePackage{graphicx} % Handle images
\RequirePackage{caption}  % Manage captions
\RequirePackage{titlesec} % Customize headings
\RequirePackage{fontspec} % Custom fonts
\RequirePackage{fancyhdr} % Advanced headers and footers
\RequirePackage{lastpage} % Total number of pages
\RequirePackage{setspace} % Line spacing
\RequirePackage{xcolor}   % Color management
\RequirePackage{tcolorbox} % Creating a colored vertical line
\RequirePackage[table]{xcolor}
\RequirePackage{etoolbox} % Patch commands
\RequirePackage{natbib} % Handle references
\RequirePackage{hyperref} % Handle URL rendering
\RequirePackage{float} % Improves float control
\hypersetup{breaklinks=true}
\RequirePackage{ragged2e}
\renewcommand{\bibfont}{\raggedright}
\RequirePackage{url}
\def\UrlBreaks{\do\/\do-}
\RequirePackage{nomencl} % Handle acronyms
\makenomenclature % Enable nomenclature generation
\renewcommand{\nomname}{Abbreviations}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Define custom colours for the thesis
\definecolor{colour_chapter1_page}{HTML}{F6F4E6}   
\definecolor{colour_chapter1_text}{HTML}{D6CC92}

\definecolor{colour_chapter2_page}{HTML}{EDE9CF}   
\definecolor{colour_chapter2_text}{HTML}{C0B158}

\definecolor{colour_chapter3_page}{HTML}{E0D9AE}   
\definecolor{colour_chapter3_text}{HTML}{A1933D}

\definecolor{colour_chapter4_page}{HTML}{CFC483}   
\definecolor{colour_chapter4_text}{HTML}{857933}

\definecolor{colour_chapter5_page}{HTML}{FF595E}   
\definecolor{colour_chapter5_text}{HTML}{FF595E}

\definecolor{colour_chapter6_page}{HTML}{E68301}   
\definecolor{colour_chapter6_text}{HTML}{E68301}

\definecolor{colour_chapter7_page}{HTML}{3F37C9}   
\definecolor{colour_chapter7_text}{HTML}{3F37C9}

\definecolor{colour_chapter8_page}{HTML}{F6EAF1}   
\definecolor{colour_chapter8_text}{HTML}{D597BD}

\definecolor{colour_chapter9_page}{HTML}{ECD0E1}   
\definecolor{colour_chapter9_text}{HTML}{C1679F}

\definecolor{table_white}{HTML}{FFFFFF}
\definecolor{table_grey}{HTML}{E0E0E0}
\definecolor{header_grey}{HTML}{A0A0A0}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Page setup
\geometry{top=35mm, bottom=35mm, left=35mm, right=65mm} % Margins
\colorlet{bodytext}{custom_grey} % Body text color: dark gray
\color{bodytext} % Apply this globally
\setmainfont{Arial} % Set body font to Arial
\setstretch{1.25}   % Line spacing
\setlength{\parindent}{2em} % Set paragraph indentation
\setlength{\parskip}{0.2em}   % Add spacing between paragraphs
\setlength{\parskip}{1em plus 0pt minus 0pt} % Fixed spacing between paragraphs
\setlength{\topskip}{10pt} % Ensure consistent spacing at the top of a page
\setlength{\textfloatsep}{10pt plus 0pt minus 0pt} % Fixed spacing around floats
\setlength{\abovecaptionskip}{5pt plus 0pt minus 0pt} % Space above captions
\setlength{\belowcaptionskip}{5pt plus 0pt minus 0pt} % Space below captions

% Add spacing below main text for footnotes
\setlength{\skip\footins}{30pt} % Space between main text and footnotes
\renewcommand{\footnoterule}{%
  \kern -3pt
  \hrule width 0.4\columnwidth
  \kern 10pt
}

\makeatletter
\renewcommand{\@makefntext}[1]{%
  \parindent 1em%
  \noindent
  \makebox[1.8em][r]{\@makefnmark}%
  \setstretch{1.1}\small #1\par\vspace{6pt}%
}
\makeatother

% Prevent stretching and ensure consistent spacing
\widowpenalty=10000 % Prevent widows
\clubpenalty=10000  % Prevent clubs
\interfootnotelinepenalty=10000 % Prevent breaking footnotes across pages
\displaywidowpenalty=10000 % Prevent widows in equations
\raggedbottom % Prevent vertical stretching
\sloppy % Allow line breaks in more places
\hyphenpenalty=500 % Allow more hyphenation
\exhyphenpenalty=50 % Penalty for explicit hyphenation

% Ensure indentation for the first paragraph after sections
\makeatletter
\patchcmd{\@startsection}
  {\@afterindentfalse}
  {\@afterindenttrue}
  {}{}
\renewcommand\section{%
  \@startsection {section}{1}{\z@}%
    {-1.5ex \@plus -0.2ex \@minus -0.1ex} % Minimal space before the section title
    {0.3ex \@plus 0.1ex} % No space after the section title
    {\normalfont\Large\bfseries\@afterindenttrue}%
}

% Customize subsection spacing (no additional white space before)
\renewcommand\subsection{%
  \@startsection {subsection}{2}{\z@}%
    {-1ex \@plus -0.1ex \@minus -0.1ex} % Very minimal space before
    {0.2ex \@plus 0.1ex} % No space after the subsection title
    {\normalfont\large\bfseries}%
}

% Customize subsubsection spacing (no additional white space before)
\renewcommand\subsubsection{%
  \@startsection {subsubsection}{3}{\z@}%
    {-0.5ex \@plus -0.1ex \@minus -0.1ex} % Almost no space before
    {0.1ex \@plus 0.1ex} % No space after the subsubsection title
    {\normalfont\normalsize\bfseries}%
}

\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Chapter title
\newfontfamily\chapterfont{QT Avanti} % Define "Cabin Condensed" for chapter titles

\titleformat{\chapter}[display] % "display" places number and title on separate lines
  {\normalfont\chapterfont\bfseries} % Use "Cabin Condensed" and bold for chapter titles
  {\Huge\MakeUppercase{Chapter \thechapter}} % Large, uppercase chapter number
  {0pt} % No additional spacing
  {\vspace{1pt}\Large\MakeUppercase} % Slightly smaller title below the number
  [\vspace{0.1ex} % Adjust space before the lines
   \noindent\textcolor{gray!40}{\rule{\linewidth}{0.25pt}} % First thinner, dark gray line
   \vspace{1ex}] % Space between the lines and the body text

% Adjust spacing before the chapter title
\titlespacing*{\chapter}{0pt}{-10pt}{100pt} % Left, before, and after spacing:

% Ensure each chapter starts on a new page
\makeatletter
\renewcommand{\chapter}{%
  \thispagestyle{plain} % Use plain page style for chapter title pages
  \global\@topnum\z@ % Suppress floats at the top of the chapter start page
  \@afterindenttrue % Enable indentation at the start of the chapter
  \secdef\@chapter\@schapter
}
\newcommand{\chapterindent}{\hspace*{\parindent}\ignorespaces} % Add manual indent for the first paragraph
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Header and footer styles
\pagestyle{fancy}
\fancyhf{} 

% Header: Chapter title on the left, smaller font, gray color
\fancyhead[L]{%
  {\footnotesize\color{gray}\uppercase{\leftmark}}
}

% Footer: Page X of Y in the centre, smaller font, gry color
\fancyfoot[C]{%
  {\footnotesize\color{gray}\thepage}
}

% Remove header and footer lines
\renewcommand{\headrulewidth}{0pt} % Remove the line below the header
\renewcommand{\footrulewidth}{0pt} % Remove the line above the footer

% Redefine the 'plain' style (used on first page of chapters)
\fancypagestyle{plain}{
  \fancyhf{} % Clear all header and footer fields
  \fancyhead[L]{%
    {\footnotesize\color{gray}\uppercase{\leftmark}} % Same header as in fancy style
  }
  \fancyfoot[C]{%
    {\footnotesize\color{gray}\thepage} % Same footer as in fancy style
  }
  \renewcommand{\headrulewidth}{0pt} % Remove the line below the header
  \renewcommand{\footrulewidth}{0pt} % Remove the line above the footer
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Captions
\captionsetup{%
  justification=justified,       % Justified alignment for captions
  singlelinecheck=false,         % Ensure single-line captions are justified
  font={footnotesize,stretch=1}, % Set the same font size for the entire caption
  labelfont={bf,footnotesize},   % Bold label and match the caption text size
  textfont=footnotesize,         % Ensure the rest of the caption text matches the label size
  width=\textwidth               % Caption width matches text width
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Custom command for margin comments
\newcommand{\marginpara}[1]{%
  \marginpar[\raggedright\footnotesize\textbf{#1}]% Left margin (even pages)
  {\raggedright\footnotesize\textbf{#1}}% Right margin (odd pages)
}
\endinput

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Sorting the position of figures in the thesis

% Set default placement for figures and tables
\floatplacement{figure}{htbp}
\floatplacement{table}{htbp}

% Allow more float space to avoid large white areas
\renewcommand{\topfraction}{0.95}    
\renewcommand{\bottomfraction}{0.95} 
\renewcommand{\textfraction}{0.05}   
\renewcommand{\floatpagefraction}{0.9} 

% Prevent figures from accumulating at the end of a chapter
\AtBeginDocument{%
  \setcounter{totalnumber}{5}  
  \setcounter{topnumber}{5}    
  \setcounter{bottomnumber}{5} 
}

% Enable H placement to force figures where defined, when necessary
\let\origfigure\figure
\let\endorigfigure\endfigure
\renewenvironment{figure}[1][H]%
  {\origfigure[#1]}%
  {\endorigfigure}