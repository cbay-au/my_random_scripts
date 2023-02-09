

while :

do
 timestamp=`date +%s`
    echo start $timestamp >> result
        tail -n 1 -f result
    echo end $timestamp >> result
#       ((i--))
done

echo "out of loop"
