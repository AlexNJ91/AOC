puzzle = File.read("aoc_day1.txt").lines.map { |puzzle| puzzle.to_i }

# Part 1
p puzzle.each_cons(2).count { |a,b| b > a }
# Part 2
p puzzle.each_cons(3).map(&:sum).each_cons(2).count { |a,b| b > a }