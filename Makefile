FLAC       = flac -f --best Output/WAV/$1.wav -o Output/FLAC/$1.flac
FLUIDSYNTH = fluidsynth -F
LAME       = lame --cbr -b 320
LILYPOND   = lilypond --silent --ddelete-intermediate-files \
                      -dno-point-and-click -djob-count=8 -dmidi-extension=mid
SHELL      = /bin/bash -O extglob
SOUNDFONT  = $(realpath ./soundfont.sf2)

all: kayla-bass.mp3 kayla-bass.pdf \
	 kayla-guitar.mp3 kayla-guitar.pdf \
	 kayla_score

clean:
	rm -f Output/FLAC/* /Output/MIDI/* Output/MP3/* Output/PDF/* Output/WAV/*

lalily-%: %.ly
	lilypond -I lalily -ddelete-intermediate-files \
		 -djob-count=8 -dmidi-extension=mid $*
	test -f $*.pdf && mv $$_ Output/PDF/; test -f $*.mid && mv $$_ Output/MIDI/

%_score: Globals/%.ily Headers/%.ily Notes/%-*.ily
	cat Common/preamble.ily \
	    Globals/$*.ily Headers/$*.ily \
	    Notes/$*-?(bass|drums|guitar).ily \
	    Scores/layout.ily | \
	    $(LILYPOND) -o $* -
	test -f $*.pdf && mv $$_ Output/PDF/; test -f $*.mid && mv $$_ Output/MIDI/
	$(FLUIDSYNTH) Output/WAV/$*.wav "$(SOUNDFONT)" Output/MIDI/$*.mid
	$(LAME) Output/WAV/$*.wav Output/MP3/$*.mp3

%.flac: %.wav
	$(call FLAC,$*)

%.mid: Parts/%.ily Parts/midi.ily
	cat $< Parts/midi.ily | $(LILYPOND) -o $* -
	test -f $*.mid && mv $$_ Output/MIDI/

%.mp3: %.wav
	$(LAME) Output/WAV/$*.wav Output/MP3/$*.mp3

%.pdf: Parts/%.ily Parts/layout.ily
	cat $< $(addsuffix layout.ily, $(join Parts/, $(if $(findstring drums, $<), drums_))) | \
	$(LILYPOND) -o $* -; test -f $*.pdf && mv $$_ Output/PDF/

%.wav: %.mid
	$(FLUIDSYNTH) Output/WAV/$@ "${SOUNDFONT}" Output/MIDI/$*.mid;
