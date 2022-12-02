#!/usr/bin/awk -f
#
# Returns Hit number by IP on apache access log
# Usage: awk -f hitbyhost.awk /var/log/apache2/access.log | sort
#
#If you don't know IP address column, this block find it:
NR == 1 {
    for (i=1; i<=NF; ++i) {
        if ($i ~ /^[0-9]{1,3}(\.[0-9]{1,3}){3}$/)
            ipCol = i
    }
}

{
ip=$ipCol
hit[ip]+=1
}

END {
for(ip in hit)
    printf("%s\t%s\n",ip,hit[ip])
}
