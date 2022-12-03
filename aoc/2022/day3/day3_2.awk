BEGIN {
    priority="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
}
{
    rucksack = $0" "rucksack
    if (NR %3 == 0) {
        $0 = rucksack
        # https://www.gnu.org/software/gawk/manual/html_node/String-Functions.html
        for (i = split($1,items,""); $2 !~ (char=items[i--]) || $3 !~ char;)
            OFS="\n"
        s += index(priority, char)
    #    item=match(rucksack[NR],"["substr(rucksack[NR-1],(match(rucksack[NR-1], "["rucksack[NR-2]"]")))"]")
    #    itemletter = substr(rucksack[NR],item,1)
    #    s += index(priority, itemletter)
    }
}
END { print s }