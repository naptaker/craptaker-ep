#!/usr/bin/env fish

docker run -it --rm -v (PWD):/src/craptaker \
       yurrriq/lilypond \
       /bin/bash -c "cd craptaker && make lalily-arab_spring"
