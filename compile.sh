#!/bin/bash
# Preprocess the input, pass it through initial directive processing, turn it
# into a garbled mess using the APL program.
gcc -E -I. - | \
    perl hlc.pl | \
    DYALOG_LINEEDITOR_MODE=1 /opt/mdyalog/18.0/64/unicode/mapl -script llc.apl
