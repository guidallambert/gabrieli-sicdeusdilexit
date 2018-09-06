


\header {
        copyright = ""
         tagline= \markup { \column {
		\vspace #1
		\wordwrap {Transcribed by Alistair Kirk, on \date using Lilypond #(lilypond-version).  This score may be copied and performed freely under the terms of the CPDL license (http://www2.cpdl.org).
                           Disclaimer:  This is intended as a performing score, and I have added insights into the sources where possible.  Any distortion of the received musical text is unintentional
                           (constructive and informed corrections are welcome). However, I am not a professional musicologist, and this transcription should not be relied on for academic or musicological purposes.
                }
       }}
}



%%%%%%%%%%%%%%%%%%
% 6 - Staff definitions 
%%%%%%%%%%%%%%%%%%

% Should very rarely need to be touched once a given piece has been typeset
%
% Nb. this is the really main structure of the .ly file; 
% it needs to go at the end because it references variables 
% containing the notes and lyrics etc, which need to have 
% been defined before the parser reads this section
%
% When making a new edition, just comment out the staves you don't need.

\score {
	\transpose c \TranspositionInterval <<
		\new ChoirStaff = "MainChoirStaff" <<	 	% choir staff = group of staves formatted for a choir
            
			 \set ChoirStaff.systemStartDelimiterHierarchy = #'(SystemStartBracket  a (SystemStartSquare b c) d e )  % Uncomment and twiddle to create square brackets for gouping staves etc
			\set ChoirStaff.midiInstrument = \MidiPlaybackSound  %  "recorder" and "tuba" may also  be useful?
                        %\set ChoirStaff.midiMaximumVolume = 127  % Need to find a good value for this.
			
                        \new Staff = "StaveA" { << 
                              \new Voice = "StaveAVoice"  { 
                                    \set Staff.instrumentName =\PrefStaveA
                                    \set Staff.midiPanPosition = #-0.8
                                    \clef \StaveAClef 
                                    \global		% inherit key and time sig etc from the score
                                    \StaveANotes		% actual notes are in a variable as defined above
                                    \bar "|." 		% nb. final barline only necessary in one voice              
                              }
                        >> }
			\new Lyrics = "StaveA_Lyrics" \lyricsto StaveAVoice { \StaveALyrics }
			
                        \new Staff = "StaveB" { << 
                              \new Voice = "StaveBVoice"  { 
                                    \set Staff.instrumentName =\PrefStaveB
                                    \set Staff.midiPanPosition = #0.8
                                    \clef \StaveBClef 
                                    \global		% inherit key and time sig etc from the score
                                    \StaveBNotes		% actual notes are in a variable as defined above              
                              }
                        >> }
			\new Lyrics = "StaveB_Lyrics" \lyricsto StaveBVoice { \StaveBLyrics }
                        
                         \new Staff = "StaveC" { << 
                              \new Voice = "StaveCVoice"  { 
                                    \set Staff.instrumentName =\PrefStaveC
                                    \set Staff.midiPanPosition = #-0.4
                                    \clef \StaveCClef 
                                    \global		% inherit key and time sig etc from the score
                                    \StaveCNotes		% actual notes are in a variable as defined above      
                              }
                        >> }
			\new Lyrics = "StaveC_Lyrics" \lyricsto StaveCVoice { \StaveCLyrics }  
                        
                        \new Staff = "StaveD" { << 
                              \new Voice = "StaveDVoice"  { 
                                    \set Staff.instrumentName =\PrefStaveD
                                    \set Staff.midiPanPosition = #0.4
                                    \clef \StaveDClef 
                                    \global		% inherit key and time sig etc from the score
                                    \StaveDNotes		% actual notes are in a variable as defined above 
                              }
                        >> }
			\new Lyrics = "StaveD_Lyrics" \lyricsto StaveDVoice { \StaveDLyrics }   
                        
                        \new Staff = "StaveE" { << 
                             \new Voice = "StaveEVoice"  { 
                                    \set Staff.instrumentName =\PrefStaveE
                                    \set Staff.midiPanPosition = #0.4
                                    \clef \StaveEClef 
                                   \global		% inherit key and time sig etc from the score
                                    \StaveENotes		% actual notes are in a variable as defined above           
                              }
                        >> }
			\new Lyrics = "StaveE_Lyrics" \lyricsto StaveEVoice { \StaveELyrics }

                        %\new Staff = "StaveF" { << 
                        %      \new Voice = "StaveFVoice"  { 
                        %            \set Staff.instrumentName =\PrefStaveF
                        %	     \set Staff.midiPanPosition = #0.4
                        %            \clef \StaveFClef 
                        %            \global		% inherit key and time sig etc from the score
                        %            \StaveFNotes		% actual notes are in a variable as defined above            
                        %      }
                        %>> }
			%\new Lyrics = "StaveF_Lyrics" \lyricsto StaveFVoice { \StaveFLyrics }  
                        
                        % \new Staff = "StaveG" { << 
                        %      \new Voice = "StaveGVoice"  { 
                        %            \set Staff.instrumentName =\PrefStaveG
                        %	     \set Staff.midiPanPosition = #0.4
                        %            \clef \StaveGClef 
                        %            \global		% inherit key and time sig etc from the score
                        %            \StaveGNotes		% actual notes are in a variable as defined above         
                        %      }
                        %>> }
			%\new Lyrics = "StaveG_Lyrics" \lyricsto StaveGVoice { \StaveGLyrics }
                        
                        %\new Staff = "StaveH" { << 
                        %      \new Voice = "StaveHVoice"  { 
                        %            \set Staff.instrumentName =\PrefStaveH
                        %	     \set Staff.midiPanPosition = #0.4
                        %            \clef \StaveHClef 
                        %            \global		% inherit key and time sig etc from the score
                        %            \StaveHNotes		% actual notes are in a variable as defined above         
                        %      }
                        %>> }
			%\new Lyrics = "StaveH_Lyrics" \lyricsto StaveHVoice { \StaveHLyrics }
                >>
	>>
	\layout {}      
	\midi {
		\context { \Score
			tempoWholesPerMinute = #(ly:make-moment 54 1)
                }
	}
}
\version "2.18"