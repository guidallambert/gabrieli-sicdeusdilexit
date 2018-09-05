
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

  % \cadenzaOn

    b'\maxima*1/4
    \bar "|."
  %\cadenzaOff


}
StaveBNotes = {

  % clef c3  % tweak / uncomment for debugging - this should override the clef in the score block
}
StaveCNotes = {

  % clef c4  % tweak / uncomment for debugging - this should override the clef in the score block

}
StaveENotes = {  % QCed against source

  % clef c4  % tweak / uncomment for debugging - this should override the clef in the score block

}
StaveDNotes = { 

  % clef c4  % tweak / uncomment for debugging - this should override the clef in the score block

}
StaveFNotes = {  }
StaveGNotes = {  }
StaveHNotes = {  }

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

}
StaveBLyrics = \lyricmode {  

}
StaveCLyrics = \lyricmode {


}
StaveDLyrics = \lyricmode {


}
StaveELyrics = \lyricmode {


}
StaveFLyrics = \lyricmode {

}
StaveGLyrics = \lyricmode { A }
StaveHLyrics = \lyricmode { A }

 % Tanslation and attribution of text
 \markup {
        \vspace #1
	\fill-line {
		\column {
                        \vspace #1
			\line { Prima Pars }
			\line { \italic { Tranlation goes here }}
			\vspace #1
			\line { Secunda Pars}
			\line { \italic { Trahslation goes here }}

			\vspace #1
			\line { Text source goes here }


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
                    \clef "petrucci-c1"
                    g'1
                     \bar"" \skip1
		}  \layout {\PrefatoryLayout}
	}
}
PrefStaveB = \markup {
	\score {
                \new MensuralVoice {
                    \set Staff.instrumentName=\StaveBLabel
                    \PrefatorySettings
                    \clef "petrucci-c3"
                    g1
                     \bar"" \skip1
		}  \layout {\PrefatoryLayout}
	}
}
PrefStaveC = \markup {
	\score {
                \new MensuralVoice {
                    \set Staff.instrumentName=\StaveCLabel
                    \PrefatorySettings
                    \clef "petrucci-c4"
                    d2
                     \bar"" \skip1
		}  \layout {\PrefatoryLayout}
	}
}
PrefStaveD = \markup {
	\score {
                \new MensuralVoice {
                    \set Staff.instrumentName=\StaveDLabel
                    \PrefatorySettings
                    \clef "petrucci-c4"
                    g2
                     \bar"" \skip1
		}  \layout {\PrefatoryLayout}
	}
}
PrefStaveE = \markup {
	\score {
          \new MensuralVoice {
                    \set Staff.instrumentName=\StaveELabel
                    \PrefatorySettings
                    \clef "petrucci-f4"
                    g,1
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