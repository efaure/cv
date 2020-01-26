%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{pblue}{HTML}{0395DE}
\definecolor{materialpurple}{HTML}{9C27B0}
\definecolor{materialindigo}{HTML}{3F51B5}
\definecolor{materialblue}{HTML}{2196F3}
\definecolor{materialcyan}{HTML}{00BCD4}
\definecolor{materialteal}{HTML}{009688}
\definecolor{materialgreen}{HTML}{4CAF50}
\definecolor{materiallime}{HTML}{CDDC39}
\definecolor{materialamber}{HTML}{FFC107}
\definecolor{materialbrown}{HTML}{795548}
\definecolor{materialred}{HTML}{FF4436}
\definecolor{materialorange}{HTML}{FF5722}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

% \RequirePackage[quiet]{fontspec}
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
\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

\newfontfamily\bodyfont
[Path = font/,BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf]
{texgyreheros-regular.otf}
\newfontfamily\thinfont[Path = font/]{Lato-Hairline.ttf}
\newfontfamily\lightfont[Path = font/]{Lato-LIght.ttf}
\newfontfamily\headingfont[Path = font/]{texgyreheros-bold.otf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[Path = font/,Mapping=tex-text, Color=textcolor,
BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf
]
{texgyreheros-regular.otf}

\setmathfont{texgyreheros-regular.otf}
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
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=3cm] (box) at (current page.north){};
    \node [anchor=east] (name) at (box) {%
      \fontsize{30pt}{62pt}\color{header}%
      {\lightfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{pblue}%
      \bodyfont #3%
    };
  \end{tikzpicture}
  \vspace{0.5cm}
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
			pblue\or%
			pblue\or%
			pblue\or%
			pblue\or%
			pblue\else%
			pblue\fi%
		} #1#2#3%
	}%
	\stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
  \LARGE\headingfont\color{headercolor}\@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  \emph{#1}&\parbox[t]{11.5cm}{%
  	{\large\textbf{#2}}%
    \hfill%
    {\large\textbf{\addfontfeature{Color=pblue} #3}} \vspace{1mm} \\%
    #4\vspace{\parsep}%
  }\\}

\newcommand{\entryDate}[4]{%
	\parbox[t]{2cm}{\emph{#1}}&\parbox[t]{11.5cm}{%
		{\large\textbf{#2}}%
		\hfill%
		{\large\textbf{\addfontfeature{Color=pblue} #3}} \vspace{1mm} \\%
		#4\vspace{\parsep}%
	}\\}

\newcommand{\entryNoDetail}[3]{%
	\emph{#1}&\parbox[t]{11.5cm}{%
		#2%
		\hfill%
		{\textbf{\addfontfeature{Color=pblue} #3}}\\%
		\vspace{-1.5mm}
	}\\}

\newcommand{\entrySpeaker}[4]{%
	\emph{#1}&\parbox[t]{11.5cm}{%
		{\fontsize{11}{11}\textbf{#2}}%
		\hfill%
		{\fontsize{11}{11}\textbf{\addfontfeature{Color=pblue} #3}} \vspace{1mm} \\%
		#4\vspace{\parsep}%
	}\\}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
  \par\vspace{\parskip}{	\LARGE\headingfont\color{pblue}  ##1 }%    
  }
%  \begin{textblock}{4.4}(1.0, 0.55)
  \begin{textblock}{4.4}(16, 0.55)
  \begin{flushleft}
  \obeycr
}{%
  \restorecr
  \end{flushleft}
  \end{textblock}
  \let\section\oldsection
}


\newenvironment{bottom}{%
	\begin{textblock}{18}(2, 19.5)
		\begin{flushleft}
			\obeycr
		}{%
			\restorecr
		\end{flushleft}
	\end{textblock}
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

%\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=0.5cm,nohead,nofoot]{geometry}
\RequirePackage[left=1.5cm,top=2cm,right=6.5cm,bottom=0.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}