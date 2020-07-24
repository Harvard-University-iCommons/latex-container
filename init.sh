#!/bin/bash
set -e
TMPDIR=`mktemp -d`
export FORMULA="`cat`"
echo "$FORMULA" | grep -Eq "\\\(newwrite|outfile|immediate|openout|write|closeout|input|include|newread|openin|read|closein|write18)" && exit -1
cat formula.tex | ./parse.py > $TMPDIR/formula.tex
cd $TMPDIR
timeout --kill-after=2 4 pdflatex -no-shell-escape formula.tex >/dev/null
timeout --kill-after=2 4 gm convert -density 300 $TMPDIR/formula.pdf \
        -quality 90 $TMPDIR/formula.jpg >/dev/null 2>&1
cat $TMPDIR/formula.jpg
