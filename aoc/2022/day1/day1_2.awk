BEGIN { s = 0; t1 = 0; t2 = 0; t3 = 0 }
{
    s += $0
    if ($0 ~ /^$/)
        { 
        if (s > t1)
            { t2 = t1; t1 = s }
        else if (s > t2)
            { t3 = t2; t2 = s }
        else if (s > t3)
            t3 = s
        s = 0
        }
}
END { print t1 " / " t2 " / " t3; print "Total: "t1+t2+t3  }