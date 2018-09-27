def main()
    solve.each do |b|
        printboard b
        puts
    end
end

def solve
    out = []
    [*0..7].permutation do |a|
        out << a if is_valid?(a)
    end
    out
end

def is_valid?(a)
    (0..7).each do |i|
        (i+1..7).each do |j|
            return false if (a[i] - a[j]).abs == j - i
        end
    end
    true
end

def printboard(b)
    b.each do |a|
        expand2d(a).each do |x|
            print (x == 1 ? ?@ : ?+)
            print ' '
        end
        puts
    end
end

def expand2d(n)
    Array.new(8){|i| i == n ? 1 : 0}
end

main() if __FILE__ == $0
