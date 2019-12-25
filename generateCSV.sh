#!/bin/sh
# エクセルからコピー&ペーストしたファイル(*.csv)を、カンマ区切りに生計するスクリプト.

cd /Users/name/Desktop/studyVim

for file in `ls -name *.csv`;
do
    echo ${file/,/}
    sed -i .bak 's/[[:cntrl:]]/","/g' ${file/,/}
    sed -i .bak 's/^/"/' ${file/,/}
    sed -i .bak 's/$/"/' ${file/,/}
    sed -i .bak 's/""/NULL/g' ${file/,/}
done
