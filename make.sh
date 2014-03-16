#!/bin/bash

RELATIVE_DIR=`dirname $0`
cd $RELATIVE_DIR

MASTER_DOCUMENT=article
SCRIPT_DIR=`pwd`
SRC_DIR=$SCRIPT_DIR/src
OUTPUT_DIR=$SRC_DIR/../target
PDF_FILE_NAME=article

function call_pdflatex() {
	pdflatex -synctex=1 -interaction=nonstopmode -output-directory=$OUTPUT_DIR $MASTER_DOCUMENT
}

if [ -e "$SCRIPT_DIR/$PDF_FILE_NAME.pdf" ]; then
	rm "$SCRIPT_DIR/$PDF_FILE_NAME.pdf"
fi

if [ ! -d "$OUTPUT_DIR" ]; then
	mkdir $OUTPUT_DIR
fi

cd $SRC_DIR
call_pdflatex && call_pdflatex

#if [ -e "$OUTPUT_DIR/$MASTER_DOCUMENT.pdf" ]; then
#	mv "$OUTPUT_DIR/$MASTER_DOCUMENT.pdf" "$SCRIPT_DIR/$PDF_FILE_NAME.pdf"
#fi
