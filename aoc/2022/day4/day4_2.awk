BEGIN {
    FS = ",|-" # $0 = $1 -> $0 = $1 + $2 + $3 + $4
    s = 0
}
{
if (($3 <= $2 && $4 >= $1) || ($3 >= $2 && $4 <= $1))
    s += 1
}

END { print s }