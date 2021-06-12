read num 
avg=$num
sum=0
while [ $avg -gt 0 ]
do
    read v 
    sum=$((sum + v))
    avg=$((avg - 1))
done 
printf "%.3f\n"  `echo "$sum/$num" | bc -l`

