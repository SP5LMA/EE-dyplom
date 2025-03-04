% ----------------------------------------------------------------------------
% Szablon prac dyplomowych na Wydziale Elektrycznym PW, zgodny z obowiązującymi
% Zarządzeniem JM Rektora PW 4/2022.
% ----------------------------------------------------------------------------
% Spełnione wszystkie zasady wymagane:
%  - druk dwustronny (twoside, openright) na A4
%  - numeracja stron um ieszczona u dołu po zewnętrznej stronie z odbiciem
%  lustrzanym na stronach parzystych i nieparzystych
%  - podrozdziały do trzech poziomów - kontrola po stronie autora pracy
%  dyplomowej
% ----------------------------------------------------------------------------
% Większość zasad zalecanych zgodnie z zaleceniami.
% Główne różnice - dla poprawy czytelności pracy:
%   * zwiększone światło międzywierszowe (interlinia 1.46557 zamiast 1.15)
%   * wyróżniające się nagłówki rozdziałów
%   * wyróżnione kolorem, klikalne odnośniki
% ----------------------------------------------------------------------------
% Dziękuję innym Autorom, na których szablonach mogłem się wzorować:
% prof. dr hab. inż. Jacek Starzyński, Wydział Elektryczny, PW
% Artur M. Brodzki i Piotr Woźniak, Wydział EiTI, PW
% ----------------------------------------------------------------------------
% Licencja szablonu: CC-BY 4.0
% https://creativecommons.org/licenses/by/4.0/
% Możesz edytować ten plik, jeśli Cię to nie przeraża ;)
% ----------------------------------------------------------------------------
% Aktualna wersja szablonu dostępna na GitHubie:
% https://github.com/SP5LMA/EE-dyplom
% Autor: Łukasz Makowski <lukasz.makowski.ee@pw.edu.pl>
% ----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{EE-dyplom}[2026/03/03 Praca dyplomowa na Politechnice Warszawskiej]

\LoadClass[a4paper,11pt,twoside,openright]{book}
% Alternatywnie: 12 pt
%\LoadClass[a4paper,12pt,twoside,openright]{book}

% -------------------------------------------------------------------
% Możliwość kompilacji przez pdflatex i xelatex
% -------------------------------------------------------------------
\RequirePackage{iftex}
\ifPDFTeX
    \let\strcmp\pdfstrcmp
    \let\XeLaTeX\LaTeX
\fi

% -------------------------------------------------------------------
% Zdefiniowanie parametru klasy
% -------------------------------------------------------------------
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=EE-dyplom.cls, prefix=pw}
\DeclareStringOption[inz]{thesis}
\DeclareStringOption[EE]{faculty}
\ProcessKeyvalOptions*


\ifnum\strcmp{\pwthesis}{inz} = 0
    \newcommand{\locallang}{PL}
\fi
\ifnum\strcmp{\pwthesis}{mgr} = 0
    \newcommand{\locallang}{PL}
\fi
\ifnum\strcmp{\pwthesis}{bsc} = 0
    \newcommand{\locallang}{EN}
\fi
\ifnum\strcmp{\pwthesis}{msc} = 0
    \newcommand{\locallang}{EN}
\fi

% -------------------------------------------------------------------
% Wykaz symboli i skrótów
% Pakiet musi być wczytany przed mathspec
% -------------------------------------------------------------------
\RequirePackage[acronym,symbols,nopostdot]{glossaries}
\setglossarysection{section}
\makeglossaries
\loadglsentries{tekst/glossary}
\ifnum\strcmp{\locallang}{PL} = 0 
    \newcommand{\acronymstitle}{Wykaz skrótów i symboli}
\else
    \newcommand{\acronymstitle}{List of Abbreviations and Symbols}
\fi

% -------------------------------------------------------------------
% Krój pisma w XeLaTeX
% Zalecane: krój bezszeryfowy (sfdefault)
% Symbole matematyczne
% Specyfikacja kroju pisma
% Lista krojów pisma (aka "czcionek") w Overleaf:
% https://www.overleaf.com/learn/latex/Questions/Which%20OTF%20or%20TTF%20fonts%20are%20supported%20via%20fontspec%3F
% Lista krojów typowo dostępnych w LaTeX:
% https://tug.org/FontCatalogue/
% -------------------------------------------------------------------
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{esint}
%\RequirePackage[version=4]{mhchem}
\ifXeTeX
    \RequirePackage{mathspec} % wczytuje również fontspec
	\usepackage[default,oldstyle]{sourcesanspro}
\else
%    \RequirePackage{lmodern}
    \usepackage[default]{sourcesanspro}
    \renewcommand*\familydefault{\sfdefault}
    \RequirePackage[T1]{fontenc}
\fi
\renewcommand{\familydefault}{\sfdefault}

% -------------------------------------------------------------------
% Podstawowa konfiguracja XeLaTeX
% -------------------------------------------------------------------
\ifXeTeX
    \RequirePackage{xltxtra}
\fi

% -------------------------------------------------------------------
% Lokalizacja XeLaTeX % PL-EN
% Musi być wczytana na początku
% -------------------------------------------------------------------
\ifXeTeX
    \RequirePackage{polyglossia}
    \ifnum\strcmp{\locallang}{PL} = 0 
        \setdefaultlanguage{polish}
    \else
        \setdefaultlanguage{english}
    \fi
    \setotherlanguage{polish}
    \setotherlanguage{english}
    %\setotherlanguage{latin}
    %\selectlanguage{english}
    %\selectlanguage{polish}
\else
    \RequirePackage[MeX]{polski}
    \ifnum\strcmp{\locallang}{PL} = 0 
        \RequirePackage[english,polish]{babel}
        \selectlanguage{polish}
    \else
        \RequirePackage[polish,english]{babel}
        \selectlanguage{english}
    \fi
    \RequirePackage[utf8]{inputenc}
    \DeclareUnicodeCharacter{00B0}{$^{\circ}$}
    \DeclareUnicodeCharacter{00D7}{x}
\fi

% -------------------------------------------------------------------
% Wymiary strony
% Zalecane:
%   margines wewnętrzny 30 mm,
%   margines zewnętrzny 20 mm,
%   marginesy górny i dolny 20 mm
% -------------------------------------------------------------------
\RequirePackage[a4paper,
    includehead,
    includefoot,
    inner=30mm,
    outer=20mm,
    vmargin=25mm]
{geometry}
% Do debugowania wymiarów
%\RequirePackage{showframe}

% -------------------------------------------------------------------
% Odstęp międzywierszowy
% Zalecane: interlinia 1,15
% -------------------------------------------------------------------
\RequirePackage{setspace}
% -------------------------------------------------------------------
% Alternatywnie supergęsty tekst: lineskip 12 pt gdy stopień pisma 12 pt
%\setstretch{0.8333333} % bo LaTeX ma defaultowy współczynnik 1.2
% -------------------------------------------------------------------
% Interlinia 1,15 (0.83333 * 1.15)
%\setstretch{0.9583}
% -------------------------------------------------------------------
% Alternatywnie interlinia 1.2*stopień pisma (standard w LaTeX)
%\singlespacing % == \setstretch{1.0}
% -------------------------------------------------------------------
% Alternatywnie superzłoty podział (0.83333 * 1.46557)
\setstretch{1.2213}
% -------------------------------------------------------------------
% Alternatywnie interlinia 1.5
%\onehalfspacing % == \setstretch{1.25} 1.25*1.2=1.5
% -------------------------------------------------------------------
% Alternatywnie złoty podział (odstęp 1.618):
%\setstretch{1.348333}
% -------------------------------------------------------------------
% Alternatywnie podwójna interlinia
%\doublespacing

% -------------------------------------------------------------------
% Nagłówki i stopki stron
% Wymagane: numery stron w zewnętrznych,
% dolnych narożnikach.
% -------------------------------------------------------------------
\RequirePackage{fancyhdr}
\fancyhf{}
\fancypagestyle{plain}{ %
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyfoot[RO,LE]{\thepage}
}
\fancypagestyle{headings}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{1pt}
    \fancyheadoffset{0cm}
    \fancyhead[LE]{\textit{\nouppercase{\leftmark}}}
    \fancyhead[RO]{\textit{\nouppercase{\rightmark}}}
    \fancyfoot[RO,LE]{\thepage}
    \renewcommand{\footrulewidth}{0pt}
    \setlength{\headheight}{16pt}
}
\pagestyle{headings}

% -------------------------------------------------------------------
% Puste strony niech będą naprawdę puste
% -------------------------------------------------------------------
\RequirePackage{emptypage}

% -------------------------------------------------------------------
% Formatowanie akapitów
% Do wyboru: akapit z wcięciem 0,5 cm
% ALBO bez wcięcia z odstępem 4 [?] przed akapitem
% Uwaga: pierwszy akapit rozdziału zawsze jest bez
% wcięcia i jest to prawidłowe, zgodne z zasadami 
% typografii.
% -------------------------------------------------------------------
% Rozwiązanie 1:
\setlength{\parindent}{0.5cm}
\setlength{\parskip}{0em}
% Rozwiązanie 2:
%\setlength{\parindent}{0pt}
%\setlength{\parskip}{4mm}

% -------------------------------------------------------------------
% Odwołania do źródeł (bibliografia)
% Do wyboru: styl numeracyjny wg normy PN (?)
% ALBO styl harwardzki
% -------------------------------------------------------------------
\RequirePackage[backend=biber,
        style=ieee,     % styl numeryczny IEEE prawie jak PN
%        sorting=nyt,    % sortowanie spisu po nazwiskach
        sorting=none,    % ze względu na popularne żądanie
        citestyle=numeric-comp % kompaktowe odnośniki numeryczne typu [21-23]
    ]{biblatex}
\addbibresource{EE-dyplom.bib}
\DeclareNameAlias{default}{family-given} % nazwisko na początku
\newcommand{\bibliografia}{
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{chapter}{\refname}
    {
        \sloppy
        \printbibliography
    }
}
% -------------------------------------------------------------------
% Alternatywa - styl harwardzki:
% -------------------------------------------------------------------
%\RequirePackage{natbib}
%\bibliographystyle{agsm}
%\newcommand{\bibliografia}{
%        \bibliography{EE-dyplom.bib}
%}

% -------------------------------------------------------------------
% Żeby spis treści zawierał to co trzeba
% -------------------------------------------------------------------
\RequirePackage[nottoc]{tocbibind}

% -------------------------------------------------------------------
% Numeracja tabel i rysunków
% Do wyboru: ciągła w całej pracy
% ALBO kolejna w rozdziałach
% -------------------------------------------------------------------
% Rozwiązanie 1: ciągła w pracy
\RequirePackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\counterwithout{equation}{chapter}
% Rozwiązanie 2: kolejna w rozdziałach
% To standard - wystarczy zakomentować powyższe

% -------------------------------------------------------------------
% Tytuły tabel i podpisy rysunków
% Zalecenie: 9 pt, "justowany do lewej strony" (?)
% -------------------------------------------------------------------
% Gdy główny stopień pisma to 11 pt wtedy footnotesize daje 9 pt 
%\RequirePackage[format=plain, labelfont=bf, labelsep=period, 
%            font=footnotesize, justification=RaggedRight]
%        {caption}
% Alternatywnie: 10 pt gdy główny to 11 pt i 11 pt gdy główny to 12 pt
\RequirePackage[format=hang, labelfont=bf, labelsep=period,
            font=small, justification=raggedright,singlelinecheck=true]
        {caption}
\RequirePackage{subcaption}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ustawienia typografii
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% -------------------------------------------------------------------
% Kontrola wdów i sierot
% -------------------------------------------------------------------
\widowpenalty 20000
\clubpenalty 20000
\raggedbottom

% -------------------------------------------------------------------
% Przenoszenie wyrazów do nowej linii
% -------------------------------------------------------------------
\pretolerance 1000
\hyphenpenalty 1000
\tolerance 2000
\emergencystretch .618em
\righthyphenmin 4
\lefthyphenmin 4

% -------------------------------------------------------------------
% Znaki cytowania % PL-EN
% -------------------------------------------------------------------
\RequirePackage{csquotes}
\setquotestyle[guillemets]{polish}
%\setquotestyle{english}

% -------------------------------------------------------------------
% Klikalne linki
% -------------------------------------------------------------------
\RequirePackage{hyperref}
\hypersetup{ % Na bazie https://en.wikibooks.org/wiki/LaTeX/Hyperlinks
%    bookmarks=true,         % show bookmarks bar? FIXME
    unicode=true,           % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitH},    % fits the width of the page to the window
%    pdfsubject={}, % subject of the document
%    pdfkeywords={}, % list of keywords
    linktoc=all,            % defines which part of an entry in the table 
                            %of contents is made into a link (none,section,page,all)
    pdfnewwindow=true,      % links in new PDF window
    colorlinks=true,        % false: boxed links; true: colored links
    linkcolor=EEBlueDark,   % color of internal links (change box color with linkbordercolor)
    citecolor=EEBlueDark,   % color of links to bibliography
    filecolor=EEBlueDark,   % color of file links
    urlcolor=EEBlueDark,    % color of external links
    linkbordercolor={1 0 0},     % color of frame around internal links (if colorlinks=false)
    citebordercolor={0 1 0},     % color of frame around citations
    urlbordercolor={0 1 1},     % color of frame around URL links 
}

% -------------------------------------------------------------------
% Wypełniacze do testowania typografii
% -------------------------------------------------------------------
%\RequirePackage{lipsum}
%\RequirePackage{bredzenie}

% -------------------------------------------------------------------
% Formatowanie tabel
% -------------------------------------------------------------------
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{longtable}
\RequirePackage{colortbl}

% -------------------------------------------------------------------
% Kolory
% -------------------------------------------------------------------
\RequirePackage[usenames,dvipsnames]{xcolor}
\definecolor{mysamplecolor}{rgb}{0.123, 0.456, 0.789}
% Kolory wydziałów "budowlanych"
\definecolor{bud}{RGB}{106, 186, 156}

% Kolory wydziałów "mechanicznych"
\definecolor{mech}{RGB}{234, 124, 90}

% Kolory wydziałów "chemicznych"
\definecolor{chem}{RGB}{254, 213, 66}

% Kolory wydziałów "elektrycznych"
\definecolor{elek}{RGB}{120, 150, 207}

% Kolory wydziałów "matematyczno-fizycznych"
\definecolor{mfiz}{RGB}{150, 95, 119}

% Kolory wydziałów "multidyscyplinarnych"
\definecolor{multi}{RGB}{180, 160, 170}

% Kolor Wydziału Elektrycznego i dwa pokrewne monochromatyczne.
% Kolor podstawowy jest tu określony w przybliżeniu, gdyż 
% Zarządzenie definiuje go niejednoznacznie. Dla wskazanego 
% Pantone 2716C i 2716U podane wartości CMYK (50, 30, 0, 0) 
% są inne niż podaje to Pantone na swej stronie www (38, 26, 0, 0).
\definecolor{EEBlue}{cmyk}{0.50, 0.30, 0, 0}            % #8ba5d3 
\definecolor{EEBlueLight}{cmyk}{0.14, 0.04, 0.03, 0}    % #e2ecf8
\definecolor{EEBlueDark}{cmyk}{0.73, 0.55, 0.35, 0.32}  % #45536a
% Uzupełniający dla EEBlue - pomarańczowy
\definecolor{EEOrange}{cmyk}{0.02, 0.41, 0.94, 0}       % #f6a307
% Uzupełniające bliskie dla EEBlue, 10 stopni na kole barw
\definecolor{EETangerine}{RGB}{255, 119, 0}
\definecolor{EEGold}{RGB}{255, 209, 0}
\definecolor{EEAzure}{RGB}{0, 136, 255}
\definecolor{EEUltramarine}{RGB}{0, 46, 255}

% -------------------------------------------------------------------
% Ścieżki do grafik
% -------------------------------------------------------------------
\RequirePackage{graphicx}
\graphicspath{{gfx/}{rysunki/}}

% -------------------------------------------------------------------
% Listingi programów
% -------------------------------------------------------------------
\RequirePackage{listings}
\lstdefinestyle{EEStyle}{
	backgroundcolor=\color{gray!3!white},
    commentstyle=\color{EEBlueDark},
    keywordstyle=\bfseries\color{EEUltramarine},
    numberstyle=\tiny\color{EEBlueDark},
    stringstyle=\color{EETangerine},
    basicstyle=\ttfamily\small,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    firstnumber=1, % 2
    stepnumber=1,  % 5
    numbersep=5pt,
    xleftmargin=4ex,frame=single,framexleftmargin=0ex,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2,
    frame=lrbt,
    frameround=ffff,
    inputpath=src,
    aboveskip=1.46557em,
    belowskip=1em
}
\lstset{style=EEStyle}

% -------------------------------------------------------------------
% Ozdobniki ścieżek plików, menu i klawiszy
% -------------------------------------------------------------------
\RequirePackage[os=win]{menukeys}
\renewmenumacro{\menu}[>]{roundedmenus}
\renewmenumacro{\directory}{pathswithfolder}
\renewmenumacro{\keys}{shadowedroundedkeys}


% -------------------------------------------------------------------
% Dodatki
% -------------------------------------------------------------------
\RequirePackage{etoolbox}
%\RequirePackage[titletoc]{appendix}
\ifnum\strcmp{\locallang}{PL} = 0 
    \newcommand{\appendiceslisttitle}{Spis załączników}
    \newcommand{\appendixprefix}{Załącznik}
\else
    \newcommand{\appendiceslisttitle}{List of Appendices}
    \newcommand{\appendixprefix}{Appendix}
\fi
\renewcommand{\appendixname}{\appendixprefix}
\let\appendixname\appendixprefix

% -------------------------------------------------------------------
% Stopnie pisma tytułów
% Zalecenie: wielkości 14 [?], 13 [?], 12 [?]
% odpowiednio dla poziomów I, II i III
% -------------------------------------------------------------------
%\RequirePackage{titlesec}
%\titleformat{\chapter}[display]
%  {\fontsize{18pt}{48pt}\selectfont \bfseries}
%  {\chaptertitlename\ \thechapter}{1em}
%  {\fontsize{14pt}{0pt}\selectfont \bfseries}
%\titleformat{\section}[hang]
%  {\fontsize{13pt}{18pt}\selectfont \bfseries}
%  {\thesection}{1em}{}
%\titleformat{\subsection}[hang]
%  {\fontsize{12pt}{15pt}\selectfont \bfseries}
%  {\thesubsection}{1em}{}
% Alternatywne rozwiązanie:
% LaTeX robi to dobrze więc po co zmieniać?

% -------------------------------------------------------------------
% Wyliczenia
% Zalecenie: tylko kropka lub myślnik
% -------------------------------------------------------------------
\RequirePackage{enumitem}
\newlength\docparskip
\setlength{\docparskip}{\parskip}
\setlist[itemize,1]{nosep,
        label=$\bullet$,    % ustawiony krój ma kwadratowe kropki
}
\setlist[itemize,2]{nosep,label=--}
\setlist[itemize,3]{nosep,label=-}
\setlist[itemize,4]{nosep,label=$\cdot$}
%\setlist[description]{font=\normalfont, labelwidth=3em}

% -------------------------------------------------------------------
% Przypisy dolne
% -------------------------------------------------------------------
% Standardowo zgodne z zaleceniami

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Here be dragons...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STRONA TYTUŁOWA
% Here be dragons...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\instytut}[1]{
    \newcommand{\@instytut}{#1}
}
\newcommand{\kierunek}[1]{
    \newcommand{\@kierunek}{#1}
}
\newcommand{\specjalnosc}[1]{
    \newcommand{\@specjalnosc}{#1}
}
\newcommand{\album}[1]{
    \newcommand{\@album}{#1}
}
\newcommand{\promotor}[1]{
    \newcommand{\@promotor}{#1}
}
\newcommand{\engtitle}[1]{
    \newcommand{\@engtitle}{#1}
}
\newcommand{\longdate}[1]{
    \newcommand{\@longdate}{#1}
}

\ifnum\strcmp{\pwthesis}{inz} = 0
    \newcommand{\frontpageheader}{inzhead.png}
\fi
\ifnum\strcmp{\pwthesis}{mgr} = 0
    \newcommand{\frontpageheader}{mgrhead.png}
\fi
\ifnum\strcmp{\pwthesis}{bsc} = 0
    \newcommand{\frontpageheader}{bschead.png}
\fi
\ifnum\strcmp{\pwthesis}{msc} = 0
    \newcommand{\frontpageheader}{mschead.png}
\fi

\ifnum\strcmp{\locallang}{PL} = 0
    \newcommand{\kieruneklocal}{na~kierunku }
    \newcommand{\specjalnosclocal}{w~specjalności }
    \newcommand{\titlelocal}{\@title }
    \newcommand{\albumlocal}{numer~albumu }
    \newcommand{\promotorlocal}{promotor}
    \newcommand{\citylocal}{WARSZAWA }
\fi
\ifnum\strcmp{\locallang}{EN} = 0
    \newcommand{\kieruneklocal}{in~the~field~of~study }
    \newcommand{\specjalnosclocal}{and~specialisation }
    \newcommand{\titlelocal}{\@engtitle }
    \newcommand{\albumlocal}{student record book number }
    \newcommand{\promotorlocal}{supervisor }
    \newcommand{\citylocal}{WARSZAWA }
\fi

\newcommand{\pwheader}{Head}
\ifnum\strcmp{\locallang}{PL} = 0
    \g@addto@macro\pwheader\pwfaculty
    \g@addto@macro\pwheader{PL.png}
\fi

\ifnum\strcmp{\locallang}{EN} = 0
    \g@addto@macro\pwheader\pwfaculty
    \g@addto@macro\pwheader{EN.png}
\fi

\let\oldmaketitle\maketitle
\renewcommand{\maketitle}{
    \linespread{1.15}

    \thispagestyle{empty}
    \begin{center}
    \includegraphics[width=\textwidth]{\pwheader}
        \vskip 3em
        \@instytut
        \vskip 3em
        \includegraphics[width=\linewidth]{\frontpageheader}
        \vskip 1em
        \kieruneklocal \@kierunek
        \vskip .5em
        \specjalnosclocal \@specjalnosc
        \vskip 3em
        \large \titlelocal
        \vskip 3em
        \LARGE \@author \\
        \normalsize
        \albumlocal \@album
        \vskip 2em
        \promotorlocal\\\@promotor
        \vfill
        \citylocal \@date
    \end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% streszczenie, abstract
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\streszczeniepracy}[1]{
    \newcommand{\@streszczeniepracy}{#1}
}
\newcommand{\slowakluczowe}[1]{
    \newcommand{\@slowakluczowe}{#1}
}
\newcommand{\thesisabstract}[1]{
    \newcommand{\@thesisabstract}{#1}
}
\newcommand{\thesiskeywords}[1]{
    \newcommand{\@thesiskeywords}{#1}
}

% Streszczenie polskie
\newcommand{\stronastreszczenia}{
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
        \textbf{\large\@title}
        
        \textbf{Streszczenie}
    \end{center}
    \@streszczeniepracy
    
    \vskip 2em
    \noindent\textbf{Słowa kluczowe: }
    \@slowakluczowe
    \cleardoublepage
}

% Abstract angielski
\newcommand{\abstractpage}{
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
        \textbf{\large\@engtitle}
        
        \textbf{Abstract}
    \end{center}
    \@thesisabstract
    
    \vskip 2em
    \noindent\textbf{Keywords: }
    \@thesiskeywords
    \cleardoublepage
}

% Spięcie stron streszczeń we właściwej
% kolejności w jedno polecenie.
\newcommand{\abstractpages}{
    \ifnum\strcmp{\locallang}{PL} = 0
        \stronastreszczenia
        \abstractpage
    \else
        \abstractpage
        \stronastreszczenia
    \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jedno polecenie - kombajn stron początkowych
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{empty}}} 
\AtBeginDocument{\counterwithout{lstlisting}{chapter}}
\newcommand{\frontpages}{
    \pagestyle{empty}
    \maketitle
    \abstractpages
% Zgodnie z Zarządzeniem JM Rektora 3/2022, oświadczenia o autorstwie i
% opcjonalne oświadczenie o udzieleniu licencji składane są w systemie USOS
% APD.
% Zgodnie z Zarządzeniem JM Rektora 4/2022 załącznik 1, układ pracy nie obejmuje
% oświadczenia o autorstwie i udzielenia licencji BG PW.
%    \authorship
%    \licensedthesis
    \tableofcontents
    \cleardoublepage
    \pagestyle{headings}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lista skrótów i symboli
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\acronymslist}{
%    \cleardoublepage
    \chapter*{\acronymstitle}
    \pagestyle{plain}
    \addcontentsline{toc}{chapter}{\acronymstitle}
    \printglossary[type=\acronymtype,title={}]
    \printglossary[type=symbols,title={}]
    % Alternatywna lista symboli - do użycia tylko w Overleaf
    %\input{tekst/symbols}
}   %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Załączniki i ich lista
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{easyappendix}[chapter]
\newenvironment{easyappendix}[1]{
    \cleardoublepage
    \refstepcounter{easyappendix}
    \addcontentsline{app}{chapter}{\hspace{1em}\theeasyappendix\hspace{1em} #1\dotfill}
    \par\bigskip
    \Huge{\textbf{\appendixname~\theeasyappendix}}
    \par\medskip
    \Huge{\textbf{#1}}
    \par\bigskip
    \normalsize
}{}
\newcommand\easyappendices{
    \let\appendixname\appendixprefix
    \chapter*{\appendiceslisttitle}
    \addcontentsline{toc}{chapter}{\appendiceslisttitle}
    \@starttoc{app}
    \input{tekst/appendices}
}