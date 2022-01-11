\RequirePackage{setspace}

\def\filename{ttuthes}
\def\fileversion{1.0}
\def\filedate{2020/12/10}  % european style year/day/month

\def\thepart			{\Roman{part}}
\def\thechapter			{\Roman{chapter}}
\def\thesection			{\arabic{chapter}.\arabic{section}}
\def\thesubsection 		{\thesection.\arabic{subsection}}
\def\thesubsubsection	{\thesubsection.\arabic{subsubsection}}
\def\theparagraph		{\thesubsubsection.\arabic{paragraph}}
\def\thesubparagraph	{\theparagraph.\arabic{subparagraph}}

\def\thetable{\arabic{chapter}.\arabic{table}}
\def\thefigure{\arabic{chapter}.\arabic{figure}}
\def\theequation{\arabic{chapter}.\arabic{equation}}

%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ttuthes}[\filedate\space\fileversion\space{LaTeX document class.}]
\LoadClass[oneside,12pt]{book}

\renewcommand{\frontmatter}{%
   \if@openright
      \cleardoublepage
   \else
      \clearpage
   \fi
   \@mainmatterfalse
   \pagenumbering{roman}            %% Front Matter roman numerals
   \setcounter{page}{2}             %% Start on the second page 
}

\def\@makechapterhead#1{%
  \vspace*{-20 \p@}%
  {\parindent \z@ \centering \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
         \MakeUppercase
         \@chapapp\space \thechapter % CHAPTER #
        \par\nobreak
%        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
     \MakeUppercase{#1} \par\nobreak % Actual Caption
    \vskip 20\p@
  }}

\def\@makeschapterhead#1{%
  \vspace*{-20 \p@}%
  {\parindent \z@ \centering \normalfont
    \interlinepenalty\@M
    \MakeUppercase{#1}\par\nobreak
    \vskip 20\p@
  }}

\renewcommand*\l@part{\@dottedtocline{0}{0em}{1.5em}}
\renewcommand*\l@chapter{\setstretch{1.5}\@dottedtocline{0}{0em}{1.5em}}
\renewcommand*\l@section{\setstretch{1.5}\@dottedtocline{1}{1.5em}{2.3em}}
\renewcommand*\l@subsection{\setstretch{1.0}\@dottedtocline{2}{3.8em}{3.2em}}

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
			\refstepcounter{chapter}%
			\typeout{\@chapapp\space\thechapter.}%
			\addcontentsline{toc}{chapter}%
			{\protect\numberline{\Roman{chapter}}\texorpdfstring{\MakeUppercase{#1}}{#1}} % 2020
		\else
			\addcontentsline{toc}{chapter}{#1}%
		\fi
	\else
		\addcontentsline{toc}{chapter}{#1}%
	\fi
	\chaptermark{#1}%
%	\addtocontents{lof}{\protect\addvspace{10\p@}}% Leaves a space between chapters for lof
%	\addtocontents{lot}{\protect\addvspace{10\p@}}% Leaves a space between chapters for lot
	\if@twocolumn
		\@topnewpage[\@makechapterhead{#2}]%
	\else
		\@makechapterhead{#2}%
		\@afterheading
	\fi
}

\renewcommand\contentsname{TABLE OF CONTENTS}
\renewcommand\listfigurename{LIST OF FIGURES}
\renewcommand\listtablename{LIST OF TABLES}
\renewcommand\bibname{BIBLIOGRAPHY}
\renewcommand\indexname{INDEX}
\renewcommand\figurename{Figure}
\renewcommand\tablename{Table}
\renewcommand\partname{PART}
\renewcommand\chaptername{CHAPTER}
\renewcommand\appendixname{APPENDIX}
\renewcommand\today{}

\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi%
	\global\@topnum\z@\@afterindenttrue\secdef\@chapter\@schapter}

\renewcommand\section{\@startsection {section}{1}{\z@}%
	{3.5ex \@plus 1ex \@minus .2ex}{.3ex \@plus.2ex}{\normalfont\normalsize\centering}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{3.25ex\@plus 1ex \@minus .2ex}{.2ex \@plus .2ex}{\normalfont\normalsize\raggedright\noindent}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
	{3.25ex\@plus 1ex \@minus .2ex}{.2ex \@plus .2ex}{\itshape\normalsize\raggedright\noindent}} % Sub sub sections in itallic
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
	{3.25ex \@plus1ex \@minus.2ex}{-1em}{\normalfont\normalsize}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
	{3.25ex \@plus1ex \@minus .2ex}{-1em}{\normalfont\normalsize}}

\renewcommand{\l@figure}{\vspace{\baselineskip}\@dottedtocline{0}{0em}{2.3em}}
\renewcommand{\l@table}{\vspace{\baselineskip}\@dottedtocline{0}{0em}{2.3em}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%START SETTINGS FOR MARGINS
%%%%%%%%%NOTE: SOME ADJUSTMENTS MAY NEED TO BE MADE WITH \topmargin, \textwidth, and \textheight
    \setlength{\oddsidemargin}{.45in}  %% These margins worked for my
    \setlength{\evensidemargin}{.5in}   % Dissertation
    \setlength{\textwidth}{6in}
    \setlength{\topmargin}{-.5in}
    \setlength{\textheight}{8.65in}  %%originally 8.65in
    \setlength{\footskip}{.5in} %orignally not here; sets space between text and page number
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%END SETTINGS FOR MARGINS
    
\newcommand{\tr}{^\mathsf{T}}  %% puts the transpose symbol on a Matrix
\newcommand{\bs}{\boldsymbol}  %% Shortcut for \boldsymbol
\newcommand{\R}{\mathbb{R}}    %% The REAL symbol
\newcommand{\ep}{\hfill\rule[-.23ex]{1.6ex}{1.6ex}\medskip} %% end of proof symbol
\renewcommand\floatpagefraction{.9}
\renewcommand\textfraction{.1} %originally .1
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}
\pagestyle{plain}              %% For the most part this gives pagenumbering
\renewcommand{\baselinestretch}{1.5}  % like the grad school wants

\RequirePackage{epsfig,amsmath,amssymb,amsfonts}
\def\@begintheorem#1#2{\trivlist%
	\item[\hskip \labelsep{#1\ #2.}]\itshape}
