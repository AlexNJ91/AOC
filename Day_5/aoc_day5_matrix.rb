class Point
  attr_accessor :x, :y
  def initialize(x, y)
      @x = x
      @y = y
  end
end

class Matrix

  attr_accessor :matrix

  def initialize(length, height)
      @matrix = Array.new(length, 0)
      @matrix.each_with_index do |col, index|
          @matrix[index] = Array.new(height, 0)
      end
  end

  def get_element(x, y)
      @matrix[x][y]
  end

  def set_element(x, y, value)
      @matrix[x][y] = value
  end

  def count_2s
      count = 0
      @matrix.each do |col|
          col.each do |element|
              count += 1 if element > 1
          end
      end
      count
  end

  def mark_horizontal_line(point1, point2)
      return if point1.x != point2.x and point1.y != point2.y

      xs = point1.x > point2.x ? point2.x.upto(point1.x).to_a : point1.x.upto(point2.x).to_a
      ys = point1.y > point2.y ? point2.y.upto(point1.y).to_a : point1.y.upto(point2.y).to_a

      tag = xs.length == 1 ? "x" : "y"
      
      if tag == "x"
          xs = Array.new(ys.length, point1.x)
          0.upto(ys.length - 1) do |i|
              @matrix[xs[i]][ys[i]] += 1
          end
      else
          ys = Array.new(xs.length, point1.y)
          0.upto(xs.length - 1) do |i|
              @matrix[xs[i]][ys[i]] += 1
          end
      end
  end

  def mark_vertical_line(point1, point2)
      return if (point1.x - point2.x).abs != (point1.y - point2.y).abs

      xs = point1.x > point2.x ? point1.x.downto(point2.x).to_a : point1.x.upto(point2.x).to_a
      ys = point1.y > point2.y ? point1.y.downto(point2.y).to_a : point1.y.upto(point2.y).to_a

      0.upto(xs.length - 1) do |i|
          @matrix[xs[i]][ys[i]] += 1
      end
  end

  def display_matrix
      @matrix.each do |col|
          p col
      end
  end
end