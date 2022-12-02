#!/usr/bin/awk -f
#
# Returns HTTP codes of apache access log
# Usage: awk -f httpcode.awk /var/log/apache2/access.log
#
#If you don't know columns order, this block find them automagically on 1st row:
NR == 1 {
    for (i=1; i<=NF; ++i) {
        # Match time column
        if ($i ~ /^\[/)
            timeCol = i;
        # Match HTTP/0.1 to HTTP/2.0 column, next one is HTTP code
        if ($i ~ /^HTTP\/[0-2]\.[01]/)
            httpCodeCol = i+1;
    }
}

{
    httpCode=$httpCodeCol
    # Bad requests doesn't contain http code..
    if (httpCode !~ /[2-5]/) {
        hit["BadRequest"]+=1;
        latest["BadRequest"]=substr($timeCol,2,20);
        # Populate First occurrence if empty
        if (! first["BadRequest"])
            first["BadRequest"]=latest["BadRequest"];
    }
    else {
        hit[httpCode]+=1;
        latest[httpCode]=substr($timeCol,2,20);
        if (! first[httpCode])
            first[httpCode]=latest[httpCode];
    }
}

END {
    # HEADERS
    printf("%12s%8s\t%s\t\t%s\n","HTTP Code","Count","1st Occurrence","Latest Occurrence");
    print("--------------------------------------------------------------------");
    # RESULTS
    for(httpCode in hit)
        printf("%12s%8s\t%s\t%s\n",httpCode,hit[httpCode],first[httpCode],latest[httpCode]);
###DEBUG/DISPLAY bad requests
#    if (httpCode !~ /[2-5]{3}/)
#        print $0
}
