%
%  Alistair Kirk's Lilypond Template for Polyphonic Music - last revised 2018-09-03.
%
%
%  If you can't be bothered to learn how to use lilypond properly (fair enough) then you can still easily make many 
%  commonly-needed changes to this score - including transposition, clefs, music size, titles etc etc - using my 
%  easy online guide at https://guidallambert.github.io/MusicEditing/EasyLilypondCustomisation.html
%
%  Best edited using Frescobaldi!  Get it from frescobaldi.org - a highly recommended 
%  Lilypond editor.  (I also highly recommend VSCode with its Git integration for version controlling.)
%


%%%%%%%%%%%%%%%%%%
% 1 - Description of this score
%%%%%%%%%%%%%%%%%%

%%% 1A - paper layout
%

#(set-default-paper-size "a4")
#(set-global-staff-size 14)
\paper {
        left-margin   = 12\mm
        right-margin   = 12\mm
        top-margin    = 10\mm
        bottom-margin = 10\mm
}

%%% 1B - titles
%

\header {
	title = "Sic Deus Dilexit Mundum"
	subtitle = "Motetto a V voci"
	% poet = ""
	% subsubtitle = "VIII Vocum"
	% arranger = ""
	composer = "Andrea Gabrieli (c. 1533 - 1585)"
	% opus=""
}

hcomposer = "Gabrieli"
htitle = "Sic Deus Dilexit Mundum"

%%% 1C - Transposition of the whole score.
%
% This works relative to c.
%  Ie. To keep the original pitch leave this as 'c' (without quotes).
% To transpose the whole score up a tone set to 'd'.  For down a tone, set to 'bes,' (note the comma) etc
%  Everything is transposed, including key signatures etc (but prefatory staves are not affected).

TranspositionInterval = bes,



%%% 1D - clefs and stave labels
%

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

%%% 1E - key and time signature
%

gkeysig = {\key f \major}  %  Nb.  don't need to change this even if transposing - see above
global = {
	\time 2/1  %nb this might be overridden elsewhere (actually thinking of getting rid of it here...
	\gkeysig
        \override Score.MetronomeMark #'transparent = ##t
}

%%%1f  - What sound and tempo to use for the output MIDI file
%

% Tempo:
% Set the first number in the line below to set the playback speed.
% The number controls the length of the semibreve (which is the
% tactus of most 16th century polyphony written in tempus imperfectum)
% Suggest something in the range of 35 (very slow) to 65 (very fast).
% 45 is my default.

midiTactus = #(ly:make-moment 48 1)

% Playback sound:
% I think ocarina sounds a bit like a chamber organ on most General MIDI
% soundbanks, and annoys me the least of all the various terrible options,
% but suit yourself!
% "recorder" may also be useful on your computer??

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

                         % These two go together!
                         \override Slur #'transparent = ##t
                         \override AccidentalSuggestion #'avoid-slur = #'inside  % Doesm't seem to help (in that ficta are shown way outside the stave when theres a slur) but does at least suppress all the error messages in the log file!


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
         % systems-per-page = 3  	% Lilypond rarely needs forcing like this...
         %  system-count = 13   	% ditto
         % page-count = 8    		% ditto
}




%%% The main musical content is in the two linked files below:


\include "Music_Lyrics_Notes.ly"

\include "Global_Score_block.ly"


\version "2.18"