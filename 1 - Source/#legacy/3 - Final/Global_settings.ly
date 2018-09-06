%  Alistair Kirk's Lilypond Template for Polyphonic Music - last revised 2015-02-12.
%
%  Best edited using Frescobaldi  -

%%%%%%%%%%%%%%%%%%
% 1 - Description of this score
%%%%%%%%%%%%%%%%%%

% 1a - paper layout
#(set-default-paper-size "a4")
#(set-global-staff-size 14)
\paper {
        left-margin   = 12\mm
        right-margin   = 12\mm
        top-margin    = 10\mm
        bottom-margin = 10\mm
}

% 1b - titles
\header {
	title = "Sic Deus Dilexit Mundum"
	%subtitle = "Kyrie Eleison"
	% poet = ""
	% subsubtitle = "VIII Vocum"
	% arranger = ""
	composer = "Andrea Gabrieli"
	% opus=""
}

hcomposer = "Gabrieli"

% 1c - Transposition of the whole score.   This works relative to c.  
%  Ie. To keep original pitch leave this as 'c' (without quotes).  
% To transpose the whole score up a tone set to 'd'.  For down a tone, set to 'bes,' (note the comma) etc
%  Everything is transposed, including key signatures etc (but prefatory staves are not affected).
 TranspositionInterval = bes,
 
 % 1d - clefs and stave labels
StaveAClef =  "treble" 
StaveALabel =  "CANTVS" 

StaveBClef =  "treble" 
StaveBLabel =  "ALTVS" 

StaveCClef =  "treble" 
StaveCLabel =  "QVINTVS" 

StaveDClef =  "treble_8" 
StaveDLabel =  "TENOR" 

StaveEClef =   "bass"
StaveELabel =   "BASSVS"

StaveFClef =  "treble_8"
StaveFLabel =   "Altus"

StaveGClef =   "treble_8"
StaveGLabel =   "Tenor"

StaveHClef =   "bass"
StaveHLabel =   "Bassus"

% 1e - key and time signature
gkeysig = {\key f \major}
global = {
	\time 2/1
	\gkeysig
        \override Score.MetronomeMark #'transparent = ##t
        %\tempo 1=54
}

%1f  - What sound to use for the output MIDI file - 
% I think ocarina sounds a bit like a chamber organ, but suit yourself!
%  "recorder"  may also  be useful?
MidiPlaybackSound = "ocarina" 


%%%%%%%%%%%%%%%%%%
% 2 - Generic 'technical' settings (shouldn't usually need to change any of these unless personal preference suggests otherwise)
%%%%%%%%%%%%%%%%%%

\layout {
	\context {
		\Voice
			\remove "Note_heads_engraver"
			\consists "Completion_heads_engraver"
			\override NoteHead #'style = #'baroque
                         \override Slur #'transparent = ##t
			\remove "Rest_engraver" 
			\consists "Completion_rest_engraver" 	
                        \override Stem #'neutral-direction = #up 
	}
	\context {
		\Staff
			\consists Ambitus_engraver 
                        %% \override Stem #'thickness = #0.9
                        \RemoveEmptyStaves
	}
        \context { 
                \StaffGroup
                        \consists "Separating_line_group_engraver"
	}
        \context {
                 \Score
                          \override BarNumber #'padding = #1.5
                          %\override BarNumber #'font-size = #1
                          %\override BarLine #'transparent = ##t	%% Uncomment for Mensurstriche (also change from ChoirStaff to Staffgroup and comment out completion_heads_engraver etc
                          %\override BarLine #'hair-thickness = #0.9   %% Example of how to manipulate barlines
        }
        \context {
                \Lyrics 
                       %\override LyricText #'font-size = #1.2
                       %\override LyricText #'whiteout = ##t		% Might help with mensurstriche
                       %\override LyricExtender #'whiteout = ##t	% Might help with mensurstriche
                       %\override LyricHyphen #'whiteout = ##t		% Might help with mensurstriche               
	}
}
\paper {
	ragged-last-bottom = ##f
  	ragged-bottom = ##f
	system-separator-markup = \slashSeparator
        evenHeaderMarkup=\markup  \fill-line { \fromproperty #'page:page-number-string \htitle \hcomposer }
	oddHeaderMarkup= \markup  \fill-line { \on-the-fly #not-first-page \hcomposer \on-the-fly #not-first-page \htitle \on-the-fly #not-first-page \fromproperty #'page:page-number-string }
         top-system-spacing #'basic-distance = #7    % Top stave is a bit too close to the page headers.
         % systems-per-page = 3  % Lilypond rarely needs forcing like this...
         %  system-count = 13   % ditto
         % page-count = 8    % ditto
}



















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Content below this line shouldn't usually need to be touched!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
















% 5a Editorial method and comments
Editorial = \markup {
	\vspace #3
	\column {
          \wordwrap  { \italic { Music source and editorial comments go here.} }
          %\wordwrap  { \italic { Barlines and time signatures are editorial; ficta, cautionary and courtesy accidentals are above the stave where applicable.}
	}  
}


%%%%%%%%%%%%%%%%%%
% Some useful definitions for early music
%%%%%%%%%%%%%%%%%%

italicas=\override LyricText #'font-shape = #'italic
rectas=\override LyricText #'font-shape = #'upright
ss=\once \set suggestAccidentals = ##t
ficta = \once \set suggestAccidentals = ##t
date = #(strftime "%Y-%m-%d" (localtime (current-time)))

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
 

\version "2.18"