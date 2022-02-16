# Part 1
report = File.readlines('aoc_day3.txt').map(&:strip)
masks = []
report[0].length.times { masks.push(2**_1) }
report.map! { _1.to_i(2) }
gamma = 0

masks.each do |mask|
  gamma += mask if report.map { mask & _1 }.reject(&:zero?).count > report.count / 2
end

epsilon = gamma ^ masks.sum
puts "Gamma is #{gamma}"
puts "Epsilon is #{epsilon}"
puts "Power is #{gamma * epsilon}"

# Part 2
def get_rating(report, masks, invert)
  report_copy = report.clone
  masks.each do |mask|
    common = invert ? 1 : 0
    if report_copy.map { mask & _1 }.reject(&:zero?).count >= report_copy.count / 2.to_f
      common = invert ? 0 : 1
    end
    report_copy.reject! do |number|
      if common.zero?
        (mask & number).zero? ? false : true
      else
        (mask & number).zero? ? true : false
      end
    end
    return report_copy[0] if report_copy.count == 1
  end
end

masks.reverse!
o2 = get_rating(report, masks, false)
co2 = get_rating(report, masks, true)
puts "Oxygen rating is #{o2}"
puts "CO2 rating is #{co2}"
puts "Life Support rating is #{o2 * co2}"