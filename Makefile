FLAC       = flac --best WAV/$1.wav -o FLAC/$1.flac
FLUIDSYNTH = fluidsynth -F
LAME       = lame --cbr -b 320
LILYPOND   = lilypond --silent --include=Parts -ddelete-intermediate-files \
                      -dno-point-and-click -djob-count=8 -dmidi-extension=mid
SHELL      = /bin/bash -O extglob
SOUNDFONT  = $(realpath ./soundfont.sf2)

all: kayla-bass.mp3 kayla-bass.pdf \
	 kayla-guitar.mp3 kayla-guitar.pdf \
	 kayla_score

clean:
	rm -f FLAC/* MIDI/* MP3/* PDF/* WAV/*

%_score: Globals/%.ily Headers/%.ily Notes/%-*.ily
	cat Common/preamble.ily \
	    Globals/$*.ily Headers/$*.ily \
	    Notes/$*-?(bass|guitar).ily \
	    Scores/layout.ily | \
	    $(LILYPOND) -o $* -
	test -f $*.pdf && mv $$_ PDF/; test -f $*.mid && mv $$_ MIDI/
	$(FLUIDSYNTH) WAV/$*.wav "$(SOUNDFONT)" MIDI/$*.mid
	$(LAME) WAV/$*.wav MP3/$*.mp3

%.flac: %.wav
	(call FLAC,$*)

%.mid: Parts/%.ily Parts/$(join $(if $(findstring drums, $<), drums_), midi.ily)
	cat $< $(addsuffix midi.ily, $(join Parts/, $(if $(findstring drums, $<), drums_))) | \
	$(LILYPOND) -o $* -
	test -f $*.mid && mv $$_ MIDI/

%.mp3: %.wav
	$(LAME) WAV/$*.wav MP3/$*.mp3

%.pdf: Parts/%.ily Parts/layout.ily
	cat $< $(addsuffix layout.ily, $(join Parts/, $(if $(findstring drums, $<), drums_))) | \
	$(LILYPOND) -o $* -; test -f $*.pdf && mv $$_ PDF/

%.wav: %.mid
	$(FLUIDSYNTH) WAV/$@ "${SOUNDFONT}" MIDI/$*.mid;
