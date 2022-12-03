BEGIN {
    priority="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    s=0
}
{
    len=length/2
    rucksack[0]=substr($0,1,len)
    rucksack[1]=substr($0,len+1)
    item=match(rucksack[0], "["rucksack[1]"]")
    s += index(priority, substr($0,item,1))
}
END { print s }