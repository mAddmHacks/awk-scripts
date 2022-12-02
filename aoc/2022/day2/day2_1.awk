BEGIN {
    p = 0
    POINTS["A X"] = 3+1
    POINTS["A Y"] = 6+2
    POINTS["A Z"] = 0+3
    POINTS["B X"] = 0+1
    POINTS["B Y"] = 3+2
    POINTS["B Z"] = 6+3
    POINTS["C X"] = 6+1
    POINTS["C Y"] = 0+2
    POINTS["C Z"] = 3+3
    
}
{
    p += POINTS[$0]
}
END { print p }