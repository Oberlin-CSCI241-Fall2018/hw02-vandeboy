#!/bin/sh
# Peng Gu
# 09/23/2018
# The user should type the path for file from command line, and the program 
#reads rot128 and diamond from it. The output of rot128 and diamond 
#of the student is compared with professor's to test if they have the exact same output. To test diamond, this program provides three different types of input and can display what type of input goes wrong. It also tests if the output diamond has the same height as professor's.

cat > testfile << END_TEXT
Trump was born and raised in the New York City borough of Queens, and received an economics degree from the Wharton School of the University of Pennsylvania. He took charge of his family's real estate business in 1971, renamed it The Trump Organization, and expanded it from Queens and Brooklyn into Manhattan. The company built or renovated skyscrapers, hotels, casinos, and golf courses. Trump later started various side ventures, including licensing his name for real estate and consumer products. He managed the company until his 2017 inauguration. He co-authored several books, including The Art of the Deal. He owned the Miss Universe and Miss USA beauty pageants from 1996 to 2015, and he produced and hosted the reality television show The Apprentice from 2003 to 2015. Forbes estimates his net worth to be 3.1 billion.
END_TEXT
$1/rot128 < testfile > test1.enc
$1/rot128 < test1.enc > test1.out
~rhoyle/pub/cs241/hw01/rot128 < testfile > test2.enc
~rhoyle/pub/cs241/hw01/rot128 < test2.enc > test2.out
diff -q test1.out test2.out > /dev/null
if [ $? -eq 0 ]; then
    echo "The rot128 output files are identical"
else
    echo "The rot128 output files are not the same"
fi


cat > num << END_TEXT 
abcde5 
END_TEXT
cat > num2 << END_TEXT 
-7abc
END_TEXT
cat > num3 << END_TEXT 
3287[]['
END_TEXT
$1/diamond < num > test3
$1/diamond < num2 > test5
$1/diamond < num3 > test7
sed -i '1d' test3 test5 test7
~rhoyle/pub/cs241/hw01/diamond < num > test4
~rhoyle/pub/cs241/hw01/diamond < num2 > test6
~rhoyle/pub/cs241/hw01/diamond < num3 > test8
sed -i '1d' test4 test6 test8
sed -i 's/^.\{37\}//' test4 test6 test8
count1=`cat test3 | wc -l`
count2=`cat test4 | wc -l`
count3=`cat test5 | wc -l`
count4=`cat test6 | wc -l`
count5=`cat test7 | wc -l`
count6=`cat test8 | wc -l`
if [ $count1 -eq $count2 ] && [ $count3 -eq $count4 ] && [ $count5 -eq $count6 ]; then
    echo "The diamonds have the same size"
else
    echo "The diamonds have different sizes"
fi
out1=0
out2=0
out3=0
diff -q -Z test3 test4 > /dev/null
out1=$?
diff -q -Z test5 test6 > /dev/null
out2=$?
diff -q -Z test7 test8 > /dev/null
out3=$?
if [ $out1 -eq 0 ] && [ $out2 -eq 0 ] && [ $out3 -eq 0 ]; then
    echo "The diamonds are identical"
elif [ ! $out1 -eq 0 ]; then
    echo "The student's diamond couldn't handle input \"abcde5\" "
elif [ ! $out2 -eq 0 ]; then
    echo "The student's diamond couldn't handle input \"-7abc\" "
else
     echo "The student's diamond couldn't handle input \"3287[][\" "
fi
