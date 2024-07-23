# Spiral
#
# Description:
# Your objective is to complete a function createSpiral(n) that receives an integer n and returns a two-dimensional array where numbers from 1 to n2 should be represented as clockwise spiral.
#
# Challenge:
# Return an empty array if n < 1

def createSpiral(n)
  return [] if n < 1

  spiral = Array.new(n) { Array.new(n) }
  num = 1
  left = 0
  top = 0
  right = n - 1
  bottom = n - 1

  while left <= right && top <= bottom
    # Fill top row
    (left..right).each do |i|
      spiral[top][i] = num
      num += 1
    end
    top += 1

    # Fill right column
    (top..bottom).each do |i|
      spiral[i][right] = num
      num += 1
    end
    right -= 1

    # Fill bottom row
    if top <= bottom
      right.downto(left).each do |i|
        spiral[bottom][i] = num
        num += 1
      end
      bottom -= 1
    end

    # Fill left column
    next unless left <= right

    bottom.downto(top).each do |i|
      spiral[i][left] = num
      num += 1
    end
    left += 1
  end

  spiral
end
