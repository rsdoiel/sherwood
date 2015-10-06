#!/bin/bash

function pass1() {
    mkdir -p pass1
    touch rewriteurls.shorthand
    # Handle rewriting explicit hostname references and normalize to root.
    echo "\"http://housingprototypes.org\" :=: \"/\"" >> rewriteurls.shorthand
    echo "\"http://www.housingprototypes.org\" :=: \"/\"" >> rewriteurls.shorthand
    echo "'http://housingprototypes.org' :=: '/'" >> rewriteurls.shorthand
    echo "'http://www.housingprototypes.org' :=: '/'" >> rewriteurls.shorthand
    echo "\"http://www.housingprototypes.org/ :=: \"/" >> rewriteurls.shorthand
    echo "\"http://housingprototypes.org/ :=: \"/" >> rewriteurls.shorthand
    echo "'http://www.housingprototypes.org/ :=: '/" >> rewriteurls.shorthand
    echo "'http://housingprototypes.org/ :=: '/" >> rewriteurls.shorthand
    echo "?field= :=: ^field=" >> rewriteurls.shorthand
    echo "?File_No= :=: ^File_No=" >> rewriteurls.shorthand

    find www.housingprototypes.org -type f | while read ITEM; do
        HTML_ELEMENT=$(grep -i "<html" "$ITEM")
        if [ "$HTML_ELEMENT" != "" ]; then
            echo "Pass 1: $ITEM"
            ROOT=${ITEM/www.housingprototypes.org/}
            HAS_PARAMS=$(echo $ROOT | grep '?')
            if [ "$HAS_PARAMS" = "" ]; then
                cp "$ITEM" "pass1/$ROOT"
            else
                P=$(echo "$ROOT" | cut -d\? -f 1)
                ARGS=$(echo "$ROOT" | cut -d\? -f 2)
                cp "$ITEM" "pass1/$P^$ARGS"
                #echo "${ROOT/\//} :=: ${P/\//}^$ARGS" >> rewriteurls.shorthand
            fi
        fi
    done
}

function pass2() {
    mkdir -p pass2 
    find pass1 -type f | while read ITEM; do
        TARGET=${ITEM/pass1/pass2}
        echo "Pass 2: shorthand rewriteurls.shorthand $ITEM > $TARGET"
        shorthand rewriteurls.shorthand $ITEM > "$TARGET"
    done
}

function merge() {
    mkdir -p site
    cp -vR www.housingprototypes.org/temp site/
    cp -vR www.housingprototypes.org/images site/
    cp -vR pass2/* site/
}

echo "Getting ready..."
if [ -f rewriteurls.shorthand ]; then
   /bin/rm rewriteurls.shorthand
fi
if [ -d pass1 ]; then
    /bin/rm -fR pass1
fi
if [ -d pass2 ]; then
    /bin/rm -fR pass2 
fi
if [ -d site ]; then
    /bin/rm -fR site
fi
echo "Pass1 ..."
pass1 
echo "Pass2 ..."
pass2
echo "Merging content"
merge
echo "Done. $(date)"
