#####    THIS IS A DESTRUCTIVE SCRIPT! BE CAREFUL AND ONLY USE IT WHEN BACKUPS ARE AVAILABLE   #####
##### The script searches and replaces strings in all the .h and .m files in a given directory #####


if [ $# -lt 3 ]
then
echo "Usage: ./script projectDirectory search1 replace1 search2 replace2 ..."
exit
fi

PROJECTDIR=$1
echo ".....Will search for and replace files in $PROJECTDIR"

c=2
numArgs=$#
numArgs=`expr $numArgs - 1`
numArgs=`expr $numArgs + $c`

echo "" > .replace.sed
	
while [ $c -lt $numArgs ]
do
        SEARCH=${!c}
       	c=`expr $c + 1`
	echo "s/$SEARCH/___TMP___FONT___$c/g" >> .replace.sed	
	c=`expr $c + 1`	
done

c=2
while [ $c -lt $numArgs ]
do
        c=`expr $c + 1`
	tmp=$c 
        REPLACE=${!c}
        c=`expr $c + 1`
        echo "s/___TMP___FONT___$tmp/$REPLACE/g" >> .replace.sed
done

for file in `find $PROJECTDIR -type f \( -name '*.h' -o -name '*.m' \) `
do
	echo "...Copy $file to $file.bak"
	cp $file $file.bak
	
	echo "...Replace strings"
	sed -f .replace.sed $file.bak > $file

	echo "...Remove $file.bak"
	rm -rf $file.bak
done
