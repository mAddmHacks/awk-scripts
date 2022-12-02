#!/usr/bin/awk -f
BEGIN {
#    h[t]=0;
}

NR == 1 {
    for (i=1; i<=NF; ++i) {
        if ($i ~ /^\[/) 
            tCol = i
    }
}

{
#printf("%s",$tCol);
t=substr($tCol,2,17)
h[t]+=1
}

END {
for(t in h)
    printf("%s\t%s\n",t,h[t])
}
