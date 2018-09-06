
%%%%%%%%%%%%%%%%%%
% Some useful definitions for early music
%%%%%%%%%%%%%%%%%%

italicas=\override LyricText #'font-shape = #'italic
rectas=\override LyricText #'font-shape = #'upright
ss=\once \set suggestAccidentals = ##t
ficta = \once \set suggestAccidentals = ##t
date = #(strftime "%Y-%m-%d" (localtime (current-time)))
%m0 = \melismaEnd
%m1 = \melisma

%% Defining graphics for unusual mensural time signatures!
#(
  define ((double-time-signature2 glyph a) grob) (
       grob-interpret-markup grob (
          markup  (
            #:line ( #:musicglyph glyph #:number #:vcenter a )
          )
       )
  )
)
#(
  define ((double-time-signature3 glyph a b) grob) (
       grob-interpret-markup grob (
          markup  (
            #:line ( #:musicglyph glyph #:vcenter #:column (a b) )
          )
       )
  )
)
#(
  define ((custom-time-signature glyph) grob) (
       grob-interpret-markup grob (
          markup  (
            #:line ( #:musicglyph glyph)
          )
       )
  )
)


%%%%%%%%%%%%%%%%%%
% 3 - Score content: notes
%%%%%%%%%%%%%%%%%%

%\language "english"

StaveANotes = {

  % clef c1  % tweak / uncomment for debugging - this should override the clef in the score block

  \override Score.TimeSignature.stencil =
    #(custom-time-signature "timesig.mensural22")
  \time 2/1

  %\mark \markup \italic {"Prima Pars"}

  %\override Score.TimeSignature.stencil =
  %   #(double-time-signature2 "timesig.mensural98" "3")
  % \time 3/2

	R\breve r1
		f'1 c''1 c''2 bes'2 a'2 a'2 g'2.( a'4 bes'4 a'4 d''2. c''4 c''1 bes'2) c''\longa.
	r2	f'2 c''1 c''2 bes'2 a'2 a'2 g'2.( a'4 bes'4 g'4 d''2. c''4 c''1 \ficta b'2) c''1
	r1	c''1 f''1 f''2 e''2 d''2 d''2 c''2.( d''4 e''4 c''4 g''2. f''4 f''1 e''2) f''1
	r\longa r2
		c''2 f''2. f''4 e''2 d''1 d''2 c''1 c''2 bes'1 a'2 c''2 d''2.( c''4 a'4 bes'4 c''4 g'4 c''2) a'1
	r1 R\longa R\breve r2
		c''2 f''2. f''4 e''2 d''1 d''2 d''2. a'4 c''2 c''2 c''2 d''2.( c''4 c''1 \ficta b'2) c''\breve
	r1 R\breve R\longa
		c''\breve a'\breve g'2 g'2 c''1 d''2 d''2 d''1 c''\breve.
	r1 r2	a'2 d''2 c''2 a'1 
	r2	c''2 f''2 e''2 c''\breve
	r1 r1 r2
		c''2 c''2. c''4 c''2 d''2 c''2 bes'2 a'2.( bes'4 c''1) f'1
	r1 r2	a'2 d''2. d''4 d''2 ees''2 d''2 c''2 bes'4( c''4 d''2. c''4 c''1 \ficta b'2) c''\breve
	r1 r2	d''2 f''2. f''4 f''2 g''2 f''2 c''2 d''1 c''1
	r1	c''1 c''2 c''2 d''2 d''2 d''2 d''2 c''2 e''2 d''2 e''2 f''1
	r1	d''1 c''2 d''2 ees''2 d''2. d''4 c''2 c''\breve
	r1 	c''1 c''2 c''2 d''2 d''2 d''2 d''2 c''2 e''2 d''2 e''2 f''1
	r1	d''1 c''2 d''2 ees''2 d''2. d''4 c''2 c''2 a'1 a'2 bes'1 a'\maxima*1/4

  % \cadenzaOn

  %  b'\maxima*1/4
    \bar "|."
  %\cadenzaOff


}
StaveBNotes = {

  % clef c3  % tweak / uncomment for debugging - this should override the clef in the score block
  
    		c'1 f'1 f'2 e'2 d'2 d'2 c'2.( d'4 e'4 f'4 g'2. f'4 f'2.( e'8 d'8 e'2) d'2 
		d'2 a'2 g'2 f'2.( g'4 a'4 f'4 a'2) g'2
		e'2 e'2 c'2 c'1. c'2
		c'1 f'1 f'2 e'2 c'2 f'2 f'4( g'4 a'4 bes'4 c''1) g'2
		g'2 a'1 a'2 f'2 g'2 g'2 a'1. g'2
	r2	d'2 g'1 g'2 f'2 a'1 g'1 a'2.( bes'4 c''\breve) f'1
	r2	g'2 bes'2. bes'4 a'2 g'1 c'1 c''1 bes'2 bes'2 bes'2 g'1 a'4( g'4 f'4 e'4 d'1) c'2 
		bes2 f'2. f'4 e'2 e'2 c'2 c'1 f'2 d'2 d'2 g'\breve
	r\breve r2
		f'2 c''2. c''4 bes'2 a'1 a'2 g'1 g'2 f'1 e'2 g'2 a'2.( g'4 e'4 f'4 g'4 d'4 g'2) e'1
	r2	c'1 f'2. f'4 e'2 d'2 d'2 c'2 c'2 bes2 a2 c'2 d'2.( c'4 a4 bes4 c'4 g4 c'2) a1
		c'1 f'1 e'2.( d'4 c'2) c'2 f'1 f'2 f'2 a'1 g'1
	r2	c'2 f'2 e'2 f'\breve.
	r1 r\breve r2
		c''2 a'2. a'4 a'2 g'2 c''2 a'2 g'2.( f'8 g'8 a'1.) d'2
	r2	d'2 a'2. a'4 a'2 bes'2 a'2 g'2 f'2.( g'4 a'1) d'2
		g'2.( f'4 e'2) g'2 a'2 g'1 d'2
		d'2 e'2. e'4 e'2 
		g'2 a'2. a'4 a'2 g'2 c''2.( bes'4 a'2) g'2 a'1 bes'1
		g'1 g'2 g'2 a'2 a'2 g'2 a'2 bes'2 g'2 fis'2 g'2 e'2
	r4	c''4 b'2 c''2 c''\breve
	r2	f'2 f'2 f'2 g'2 f'2. f'4 e'2 f'1 
		e'1 d'2 e'2 f'2 f'2 e'2 f'2 f'2
		bes'2 a'2 bes'2 g'2 g'2 g'2 g'2 a'2
		a'2 g'2 a'2 bes'1
	r2	bes'2 bes'1. g'2 f'2
		c'2 d'1. d'2 c'\maxima*1/4

}
StaveDNotes = {

  % clef c4  % tweak / uncomment for debugging - this should override the clef in the score block
  	R\longa R\longa R\breve r1
		f1 c'1 c'2  a2 g2 g2 a2.( g4 a4 bes4 c'1 bes2) g1
	r2	f2 f'1 f'2 e'2 d'2 d'2 f'2.( e'4 d'1) c'1
	r2	a2.( bes4 c'2) bes2 f2 g1 bes2
		bes2 f'1 c'2 e'2 f'2 d'2 c'2 c'2
		c'2 f'2. f'4 d'2 c'2 bes2 d'2.( e'4 f'2) e'2 d'2 f'2 c'2 c'4( d'4 e'4 f'4 g'2) d'1
	r1 r2	bes2 f'2. f'4 e'2 d'1 d'2 c'2 c'2 c'2 a2 g2 a2.( g4 a4 bes4 c'2) bes2
	r2	g2 c'2. c'4 bes2 a1 a2 a2 c'2 d'2 d'2 a2 d'4( c'4 bes4 a4 g4 a4 bes4 c'4 d'2) c'1
	R\breve
		g1. c'2. c'4 a2 g2 d'2 d'2 g'1 f'1 f'2 d'2 c'2 a2
		bes2.( a4 a4 g8 f8 g1) f2 
		c'1 a1 f2 g1 g2.( a4 bes1) a2 a2 a1 c'2 c'2 f'2 e'2 c'\breve
	r\breve
		c'1 d'2 c'2 a2
		c'2 e'2. e'4 e'2 f'2 e'2 d'2 e'\breve c'2
		a2. a4 g2 d'1 a1
		d'1 c'2. c'4 a2 a2.( bes8 c'8 d'2) bes1. c'2 d'1 g\breve
	r2	c'2 c'2. c'4 c'2 d'2 c'2 bes2 a2.( bes4 c'1) f1
	r1	c'1 b2 c'2 c'2 f2 c'2 f2 bes1
	r1 r2	c'2 g'2 c'2 f'2 f'2 e'2 f'2 f'2
	r4	bes4 a2 bes2 bes2 bes2 f2 c'2 a1
		c'1 b2 c'2 c'2 f2 c'2 f2 bes1
	r1 r2	c'2 g'2 c'2 f'2 f'2 e'2 f'2 f'2
        r4	bes4 a2 bes2 bes2 bes2 f2 c'2 a1
	r2	f2 f2 f2 f\maxima*1/4

}
StaveCNotes = { 

  % clef c4  % tweak / uncomment for debugging - this should override the clef in the score block

  	R\longa R\breve r1
		c'1 f'1 f'2 e'2 d'2 d'2 c'2.( d'4 e'4 c'4 g'2. f'4 f'1 e'2) f'1
	r1	d'1 g'1 a'2 d'2 d'2 c'2 c'1 bes1
	r2	c'2 f'1 f'2 e'2 c'1. c'2 d'4( c'4 a4 bes4 c'1) d'1
	r2	a'2 c''1 c''2 f'2 g'2 g'2 a'1 d'1
	r1 r2	g'2 c''2. c''4 bes'2 a'1 a'2 g'1 g'2 f'1 e'2 f'2 d'2.( e'4 f'2 g'1) a'2.( g'8 f'8 g'1)
	r1 r2	d'2 f'2. f'4 e'2 d'1 d'2 f'2 e'2 f'2 f'2 c'2 c''4( bes'4 a'4 g'4 a'2) f'4( g'4 a'4 bes'4 c''2)
		f'2 bes'2. bes'4 bes'2 a'1 g'2 e'2 f'2 f'2 c'2 d'2
		d'2 g'2. g'4 a'2 f'2 g'2 a'1 c''2 bes'2 a'2 a'1 f'2.( g'4 a'4 g'4 f'4 e'4 g'2 f'1 e'2) f'1
	r1	c'\breve e'1 d'2 d'2 f'1 f'2 f'2 e'1 a\breve.
	r2	a2 d'2 c'2 a1 a'2 c''1 a'2 g'1
	r1 R\breve r2
		c'2   f'2. f'4 f'2 g'1 f'1 e'2 d'4( e'4 f'1 e'2 d'2. e'4 fis'1) g'1
	R\breve r2
		g'2 g'2. g'4 g'2 a'2 g'2 e'2 f'1. d'2
	r2	c'2 c'2 e'2 f'1 f'1 
		e'1 d'2 e'2 f'2 f'2 e'2 f'2 f'2 bes'2 a'2 bes'2 g'2
		g'2 g'2 g'2 a'2 a'2 g'2 a'2 bes'1
	r2	bes'2 bes'1. g'2 a'1 g'1 g'2 g'2 a'2
		a'2 g'2 a'2 bes'2 g'2 fis'2 g'2 e'2
	r4	c''4 b'2 c''2 c''\breve
	r2	f'2 f'2 f'2 g'2 f'2. f'4 e'2 f'1~ f'\maxima*1/2
}
StaveENotes = { 
	R\longa R\longa R\longa R\breve
		c1 f1 f2 e2 d2 d2 c1 f2 bes,4( c4 d4 e4 f2) c2 c2 g1 f1
	r1	c1 f1 f2 e2 d2 d2 c1 bes,1
	r1 R\breve r1
		f1 bes2. bes4 a2 g1 g2 f2 c2 g2 f2 f4( g4 a4 bes4 c'2) g2.( a4 bes2) c'1
	r1 R\breve r1
		c1 f2. f4 e2 d1 d2 c2 g2 bes2 bes2 a1 d2.( e4 f\breve)d1
	R\longa R\breve r1
		c1 f2. f4 e2 d1 c2 g2 d2 f2 f2 bes,2 f2.( e4 d4 c4 bes,4 c4 d2) c1
		f\breve f1 c2 c2 c1 bes,2.( c4 d2) d2 f1 c1
	R\breve
		f1 bes2 a2 f\breve
	r1	f1 c'2. c'4 c'2 d'2 c'2 bes2 a2.( bes4 c'1) f1
	R\longa r1
		d\breve	g2. g4 g2 a2 g2 f2 e2.( f4 g1) c1
	r2	c2 f2. f4 f2 g2 f1. e2 d4( e4 f2) bes,1
	% Alleluia
	r2	c2 g2 c2 f1
	r1 r2	g2 d'2 g2 c'1
	r1	f1 c'2 f2 bes2 bes,2 f2 bes,2 \ficta ees2 bes,2. bes,4 c2 f1
	r2	c2 g2 c2 f1
	r1 r2	g2 d'2 g2 c'1
	r1	f1 c'2 f2 bes2 bes,2 f2 bes,2 \ficta ees2 bes,2. bes,4 c2 f2
		f2 d2.( c4 bes,2) bes,2 f\maxima*1/4


}
StaveFNotes = { bes }
StaveGNotes = { bes }
StaveHNotes = { bes }

% Convenient overrides - comment and uncomment to add and remove staves for quick debugging / rendering purposes:
% StaveANotes = {  }
% StaveBNotes = {  }
% StaveCNotes = {  }
% StaveDNotes = {  }
% StaveENotes = {  }
% StaveFNotes = {  }
% StaveGNotes = {  }
% StaveHNotes = {  }

%%%%%%%%%%%%%%%%%%
% 4 - Score content: text / lyrics
%%%%%%%%%%%%%%%%%%

StaveALyrics = \lyricmode {  
	Sic De -- us di -- le -- xit mun -- dum, __
	Sic De -- us di -- le -- xit mun -- dum,
	Sic De -- us di -- le -- xit mun -- dum,
	Ut fi -- li -- um su -- um u -- ni -- ge -- ni -- tum da -- ret,
	Ut fi -- li -- um su -- um u -- ni -- ge -- ni -- tum da -- ret,
	Ut om -- nis qui cre -- dit in ip -- sum non pe -- re -- at,
		non pe -- re -- at,
	Sed ha -- be -- at vi -- tam ae -- ter -- nam,
	Sed ha -- be -- at vi -- tam ae -- ter -- nam,
	Sed ha -- be -- at vi -- tam ae -- ter -- nam.
	Al -- le -- lu -- ia, Al -- le -- lu -- ia,
	Al -- le -- lu -- ia, Al -- le -- lu -- ia,
	Al -- le -- lu -- ia, Al -- le -- lu -- ia,
	Al -- le -- lu -- ia, Al -- le -- lu -- ia, 
	Al -- le -- lu -- ia, Al -- le -- lu -- ia,
	Al -- le -- lu -- ia.
}
StaveBLyrics = \lyricmode {  
	Sic De -- us di -- le -- xit mun -- dum,
		di -- le -- xit mun -- dum,
		di -- le -- xit mun -- dum,
		Sic De -- us di -- le -- xit mun -- dum,
		Sic De -- us di -- le -- xit mun -- dum,
		Sic De -- us di -- le -- xit mun -- dum,
	Ut fi -- li -- um su -- um u -- ni -- ge -- ni -- tum da -- ret,
		Ut fi -- li -- um su -- um u -- ni -- ge -- ni -- tum,
		Ut fi -- li -- um su -- um u -- ni -- ge -- ni -- tum da -- ret,
		Ut fi -- li -- um su -- um u -- ni -- ge -- ni -- tum da -- ret,
	Ut om -- nis qui cre -- dit in ip -- sum non pe -- re -- at
	Sed ha -- be -- at vi -- tam ae -- ter -- nam,
		Sed ha -- be -- at vi -- tam ae -- ter -- nam,
		vi -- tam ae -- ter -- nam,
		Sed ha -- be -- at,
		Sed ha -- be -- at vi -- tam ae -- ter -- nam.	
	Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	        Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	        Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	        Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	        Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	        Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	        Al -- le -- lu -- ia.
}
StaveDLyrics = \lyricmode {
  	Sic De -- us di -- le -- xit mun -- dum,
		Sic De -- us di -- le -- xit mun -- dum,
		di -- le -- xit mun -- dum,
		Sic De -- us di -- le -- xit mun -- dum,
	Ut fi -- li -- um su -- um u -- ni -- ge -- ni -- tum da -- ret,
		Ut fi -- li -- um su -- um u -- ni -- ge -- ni -- tum da -- ret,
		Ut fi -- li -- um su -- um u -- ni -- ge -- ni -- tum da -- ret,
		Ut fi -- li -- um su -- um u -- ni -- ge -- ni -- tum da -- ret,
                da -- ret,
	Ut om -- nis qui cre -- dit in ip -- sum non pe -- re -- at,
		non pe -- re -- at,
	Sed ha -- be -- at vi -- tam ae -- ter -- nam,
		vi -- tam ae -- ter -- nam,
		Sed ha -- be -- at vi -- tam ae -- ter -- nam,	
		Sed ha -- be -- at vi -- tam ae -- ter -- nam.	
	Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	Al -- le -- lu -- ia.

}
StaveCLyrics = \lyricmode {
  	Sic De -- us di -- le -- xit mun -- dum,
		Sic De -- us di -- le -- xit mun -- dum,
		Sic De -- us di -- le -- xit mun -- dum,
		Sic De -- us di -- le -- xit mun -- dum,
	Ut fi -- li -- um su -- um u -- ni -- ge -- ni -- tum da -- ret, __
	        Ut fi -- li -- um su -- um u -- ni -- ge -- ni -- tum da -- ret, __
		Ut fi -- li -- um su -- um u -- ni -- ge -- ni -- tum,
		Ut fi -- li -- um su -- um u -- ni -- ge -- ni -- tum da -- ret,
	Ut om -- nis qui cre -- dit in ip -- sum non pe -- re -- at
		non pe -- re -- at
	Sed ha -- be -- at vi -- tam ae -- ter -- nam,
		Sed ha -- be -- at vi -- tam ae -- ter -- nam,
		vi -- tam ae -- ter -- nam.
	Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	        Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	        Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	        Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	        Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	        Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	        Al -- le -- lu -- ia, 	Al -- le -- lu -- ia.

}
StaveELyrics = \lyricmode {
  	Sic De -- us di -- le -- xit mun -- dum,
		di -- le -- xit mun -- dum,
		Sic De -- us di -- le -- xit mun -- dum,
	Ut fi -- li -- um su -- um u -- ni -- ge -- ni -- tum __ da -- ret,
		Ut fi -- li -- um su -- um u -- ni -- ge -- ni -- tum da -- ret,
		Ut fi -- li -- um su -- um u -- ni -- ge -- ni -- tum da -- ret,
	Ut om -- nis qui cre -- dit __ in ip -- sum non pe -- re -- at,
	Sed ha -- be -- at vi -- tam ae -- ter -- nam,
		Sed ha -- be -- at vi -- tam ae -- ter -- nam,	
		Sed ha -- be -- at vi -- tam ae -- ter -- nam.	
	Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	Al -- le -- lu -- ia, 	Al -- le -- lu -- ia,
	Al -- le -- lu -- ia.

}
StaveFLyrics = \lyricmode { A }
StaveGLyrics = \lyricmode { A }

 % Tanslation and attribution of text
 \markup {
        \vspace #1
	\fill-line {
		\column {
      \vspace #1
			\line { \italic { So God Loved the world that he gave his only-begotten son, } }
			\line { \italic { That all who  believe in him will not perish but have eternal live.  Alleluia. } }

			\vspace #1
			\line { (Gospel of John, ch3 v16) }


		}
	}
}


%%%%%%%%%%%%%%%%%%
% 5 - Editorial content, including prefatory stave / incipit settings and notes
%%%%%%%%%%%%%%%%%%

 %  Should very rarely need to be touched once a given piece has been typeset

% 5a Editorial method and comments
\markup {
    \vspace #3
    \column {
          %\wordwrap  { \italic { Music source and editorial comments go here.} }

          \wordwrap  {
              \italic {Andreae Gabrielis Sacrae Cantiones [...], Liber Primus}
              , published Antonio Gardano, Venice 1565;
              acknowledgements to the Bavarian State Library,
              whose website \italic{(http://bildsuche.digitale-sammlungen.de)} contains a scan of the whole publication.
          }
          \vspace #1
          \wordwrap  {
              Barlines are editorial (one bar per \italic {tempus}, ie. breve); 
              ficta, ligature brackets, cautionary and courtesy accidentals are above the stave where applicable. 
              Original note-values have been preserved as far as possible.
              Original mensuration marks are presented rather than imposing modern time signatures.
              Editorial underlay is in italics where applicable;
              Latin spelling has been modernised in places to aid legibility, and punctuation has been
              added.
          }
          \vspace #1
          \wordwrap {
              This is Gabrieli's first published collection of his compositions
              and shows his early style.  1565 is an interesting date as Gabrieli's
              star was just rising in Venice - he had travelled to Munich in 1562,
              befriending Lassus, and then he became organist at S Marco in 1566.
              Quite possibly this collection,  deidcated to Prince Albert, Duke of Bavaria
              and probably at least partially composed while in Munich,
              helped Gabrieli to gain the post.
          }
          \vspace #1
          \wordwrap {
              As suggested on the 1565 title page, instrumental support or substitution
              is optional but worth considering.
	  }
	  \vspace #3
	  .
    }
}

%% 5b - Plainsong incipit - obviously, comment out as required.
%\score   {
%    \transpose c \TranspositionInterval <<
%          \new Staff \with { \remove "Time_signature_engraver" \remove "Ambitus_engraver" } {
%                \set Staff.instrumentName = "Intonation"
%                \clef "treble_8"  \global  \cadenzaOn              <<  {
%                          \override Voice.Slur #'tran%sparent = ##f
%                          f4 s8 f4 s8 f4( g4) s8 g4.
%                      }\addlyrics {  In -- ci -- pit here. }
%               >>
%          }
%     >>
%    \layout {\context { \Voice \remove "Stem_engraver" } }
%}


% 5c - Prefatory staves
\layout {   % Need to modify a couple of settings in the main score layout as well
             indent=4\cm
              \context { \Staff
                         \override InstrumentName #'padding = 2
                         \override InstrumentName #'self-alignment-X = #RIGHT
              }
}
PrefatorySettings = {
  		%\override NoteHead   #'style = #'neomensural      % ie. can set to either Mensural or Neomensural
		%\override Rest #'style = #'neomensural
		%\override Staff.TimeSignature #'style = #'neomensural
                \override Flag #'style = #'mensural
                \autoBeamOff
                 \override Staff.InstrumentName #'Y-extent = #'(-4 . 4)
                 \override Staff.InstrumentName #'self-alignment-X = #RIGHT
                \override Staff.InstrumentName #'padding = 2
                % Uncomment these if you want eg. double b flat in key sig using c2 or f3 clef etc
                % May also have to tweak the numbers (4 vs 5 etc)
                \override Staff.KeySignature.flat-positions = #'((-4 . 4))
                \override Staff.KeySignature.sharp-positions = #'((-4 . 4))
                \cadenzaOn
                \key f \major
		            \time 2/2
                \huge
}
PrefatoryLayout = \layout {   % Set the layout inside the incipit
		\context {\Voice
			\remove Ligature_bracket_engraver
			\consists Mensural_ligature_engraver

		}
                \context { \Staff \remove Ambitus_engraver}
		line-width=5
                indent =  0
                ragged-right = ##f
		ragged-last = ##f
                system-count = #1
}
PrefStaveA = \markup {
	\score {
                \new MensuralVoice {
                    \set Staff.instrumentName=\StaveALabel
                    \PrefatorySettings
                    \clef "petrucci-g2"
                    f'1
                     \bar"" \skip1
		}  \layout {\PrefatoryLayout}
	}
}
PrefStaveB = \markup {
	\score {
                \new MensuralVoice {
                    \set Staff.instrumentName=\StaveBLabel
                    \PrefatorySettings
                    \clef "petrucci-c2"
                    c'1
                     \bar"" \skip1
		}  \layout {\PrefatoryLayout}
	}
}
PrefStaveC = \markup {
	\score {
                \new MensuralVoice {
                    \set Staff.instrumentName=\StaveCLabel
                    \PrefatorySettings
                    \clef "petrucci-c2"
                    c'1
                     \bar"" \skip1
		}  \layout {\PrefatoryLayout}
	}
}
PrefStaveD = \markup {
	\score {
                \new MensuralVoice {
                    \set Staff.instrumentName=\StaveDLabel
                    \PrefatorySettings
                    \clef "petrucci-c3"
                    f'1
                     \bar"" \skip1
		}  \layout {\PrefatoryLayout}
	}
}
PrefStaveE = \markup {
	\score {
          \new MensuralVoice {
                    \set Staff.instrumentName=\StaveELabel
                    \PrefatorySettings
                    \clef "petrucci-f3"
                    c1
                     \bar"" \skip1
		}  \layout {\PrefatoryLayout}
	}
}
PrefStaveF = \markup {
	\score {
                \new MensuralVoice {
                    \set Staff.instrumentName=\StaveFLabel
                    \PrefatorySettings
                    \clef "petrucci-f4"
                    g2
                     \bar"" \skip1
		}  \layout {\PrefatoryLayout}
	}
}
PrefStaveG = \markup {
	\score {
                \new MensuralVoice {
                    \set Staff.instrumentName=\StaveGLabel
                    \PrefatorySettings
                    \clef "petrucci-f4"
                    g2
                     \bar"" \skip1
		}  \layout {\PrefatoryLayout}
	}
}
PrefStaveH = \markup {
	\score {
                \new MensuralVoice {
                    \set Staff.instrumentName=\StaveHLabel
                    \PrefatorySettings
                    \clef "petrucci-f4"
                    f2
                     \bar"" \skip1
		}  \layout {\PrefatoryLayout}
	}
}





\version "2.18"