BEGIN {
    p = 0
    # A for Rock, B for Paper, and C for Scissors
    # 1 for Rock, 2 for Paper, and 3 for Scissors
    # X lose, Y draw, and Z win
    POINTS["A X"] = 3+0
    POINTS["A Y"] = 1+3
    POINTS["A Z"] = 2+6
    POINTS["B X"] = 1+0
    POINTS["B Y"] = 2+3
    POINTS["B Z"] = 3+6
    POINTS["C X"] = 2+0
    POINTS["C Y"] = 3+3
    POINTS["C Z"] = 1+6
    
}
{
    p += POINTS[$0]
}
END { print p }