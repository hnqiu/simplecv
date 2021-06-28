% A simple CV class
% Copyright (C) 2020-2021 hnqiu. All Rights Reserved.
% Licensed under the MIT License. See LICENSE for details.

% Project is hosted at
% https://github.com/hnqiu/simplecv


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simplecv}[2020/07/20 v0.1 A simple CV class]

\LoadClass[10pt]{article}


\setlength{\parindent}{0pt} % par no indent


\RequirePackage{palatino} % font
\RequirePackage{hyperref}
\RequirePackage{etoolbox} %\ifnumgreater
\RequirePackage{tikz} %\foreach
\RequirePackage{xcolor}
\definecolor{lightblue}{RGB}{0, 150, 180}
\definecolor{emphblue}{RGB}{0, 120, 150}
\colorlet{emphcolor}{emphblue}
\colorlet{body}{black!80!white}
\RequirePackage{fontawesome}
\RequirePackage{fancyhdr} % header & footer
\RequirePackage{lastpage} % get total page num

% set footer
\newcommand{\setfooter}[1]{
  \pagestyle{fancy}
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt} % remove header lines
  \cfoot{{\color{lightblue}\thepage\ of \pageref{LastPage}}}
  \rfoot{{\color{lightblue}#1}}
}


% new cmd \name
\newcommand{\name}[1]{
  \centerline{\Huge{#1}}
}

% new cmd \personalinfo
% \param
%   - addr
%   - state
%   - postcode
%   - email
%   - phone number
\newcommand{\personalinfo}[5]{
  % \centerline{\color{lightblue}{
  \centerline{
    \faMapMarker~#1 \textperiodcentered #2 \textperiodcentered #3
    \hspace{2pt}
    \faEnvelope~\href{mailto:#4}{#4}
    \hspace{2pt}
    \faMobile~#5
  }
}


% new cmd \cvsection
\newcommand{\cvsection}[1] {
  \medskip
  {\Large\scshape\raggedright{\color{emphcolor}{#1}}\par}\medskip
  \vspace{-\baselineskip}
  {\color{lightblue}\noindent\rule\linewidth{2pt} \par}
  \smallskip
}

% new cmd \cvevent
\newcommand{\cvevent}[4]{
  \noindent\makebox[0.2\linewidth][l]{\faCalendar~#1}
  \large\makebox[0.4\linewidth][l]{#2}
  \par\smallskip
  \noindent\makebox[0.2\linewidth][l]{}
  \makebox[0.5\linewidth][l]{\textbf{\color{emphcolor}#3}}
  \small\makebox[0.2\linewidth][l]{\faMapMarker~#4}\par
  \smallskip
  \normalsize
}

% new cmd \cvitem
% use \parbox to break lines inside boxes
\newcommand{\cvitem}[1]{
  \noindent\hspace{0.2\linewidth}
  \makebox[1em][l]{\faAngleDoubleRight}
  \parbox[t]{0.75\linewidth}{#1}\par
  \smallskip
}

% new cmd \cvskill
\newcommand{\cvskill}[2]{
  \noindent\hspace{0.2\linewidth}
  \makebox[0.4\linewidth][l]{#1}
  \makebox[0.3\linewidth][l]{
    \small
    \foreach \x in {1,...,10}{
      {\ifnumgreater{\x}{#2}{\color{body!30}}{\color{emphcolor}}\faCircle}
    }
  }\par
  \smallskip
}


% new cmd \cvlangitem
% new language items
\newcommand{\cvlangitem}[2]{
  \noindent\hspace{0.2\linewidth}
  \makebox[0.4\linewidth][l]{#1}
  \makebox[0.3\linewidth][l]{#2}
  \par\smallskip
}


% new cmd \cvreferee
% \param
%   - name
%   - title
%   - organization
%   - email
%   - phone
%   - webpage
\newcommand{\cvreferee}[6]{
  {
  \noindent\hspace{0.2\linewidth}
  \makebox[0.4\linewidth][l]{
    \href{#6}{\large{#1}}
    \normalsize\hspace{2ex}\faMortarBoard~#2
  }\par\smallskip
  \noindent\hspace{0.2\linewidth}
  \makebox[3ex][l]{\faInstitution}\makebox[0.6\linewidth][l]{#3}\par
  \noindent\hspace{0.2\linewidth}
  \makebox[3ex][l]{\faEnvelope}\makebox[0.6\linewidth][l]{\href{mailto:#4}{#4}}\par
  \noindent\hspace{0.2\linewidth}
  \makebox[3ex][l]{\faPhone}\makebox[0.6\linewidth][l]{#5}\par
  \medskip
  }
}

