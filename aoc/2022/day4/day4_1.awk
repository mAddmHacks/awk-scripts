# cat day4.sample | awk 'BEGIN { FS=",|-" } { print $1 " " $2 " " $3 " " $4 }'

BEGIN {
    FS = ",|-" # $0 = $1 -> $0 = $1 + $2 + $3 + $4
    s = 0
}
{
# min & max value included
if (($1 <= $3 && $2 >= $4) || ($1 >= $3 && $2 <= $4))
    s += 1
    #print $1 " " $2 " " $3 " " $4
}

END { print s }