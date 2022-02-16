require_relative "./aoc_day5_matrix.rb"

file = File.open("aoc_day5.txt")
file_data = file.read
list = file_data.split("\n")

matrix = Matrix.new(1000, 1000)

# PART 1

list.each do |line|
    first = line.split(" -> ")[0].split(',')
    second = line.split(" -> ")[1].split(',')

    first = Point.new(first[0].to_i, first[1].to_i)
    second = Point.new(second[0].to_i, second[1].to_i)
    matrix.mark_horizontal_line(first, second)
end

p matrix.count_2s

# PART 2

list.each do |line|
    first = line.split(" -> ")[0].split(',')
    second = line.split(" -> ")[1].split(',')

    first = Point.new(first[0].to_i, first[1].to_i)
    second = Point.new(second[0].to_i, second[1].to_i)
    matrix.mark_vertical_line(first, second)
end

p matrix.count_2s