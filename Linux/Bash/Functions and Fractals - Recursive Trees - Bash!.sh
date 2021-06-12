#credit- github

declare -A arr

f() {
    local depth=$1 length=$2 row=$3 column=$4
    [[ $depth -eq 0 ]] && return
    for ((i=length; i; i--)); do
        arr[$((row-i)).$column]=1
    done
    ((row -= length))
    for ((i=length; i; i--)); do
        arr[$((row-i)).$((column-i))]=1
        arr[$((row-i)).$((column+i))]=1
    done
    f $((depth-1)) $((length/2)) $((row-length)) $((column-length))
    f $((depth-1)) $((length/2)) $((row-length)) $((column+length))
}
read num
f $num 16 63 49
for ((i=0; i<63; i++)); do
    for ((j=0; j<100; j++)); do
        if [[ ${arr[$i.$j]} ]]; then
            printf 1
        else
            printf _
        fi
    done
    echo
done

