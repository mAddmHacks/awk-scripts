BEGIN { s = 0; t = 0 }
{
    s += $0
    if ($0 ~ /^$/)
        { 
        if (s > t)
            t = s
            s = 0
        }
}
END { print t }