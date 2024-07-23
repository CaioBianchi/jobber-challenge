=begin
Spiral

Description:
Your objective is to complete a function createSpiral(N) that receives an integer N and returns a two-dimensional array where numbers from 1 to N2 should be represented as clockwise spiral.

Challenge:
Return an empty array if N < 1
=end

def createSpiral(N)
  return [] if N < 1

  spiral = Array.new(N) { Array.new(N) }
  num = 1
  left, top = 0, 0
  right, bottom = N - 1, N - 1

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
      (right.downto(left)).each do |i|
        spiral[bottom][i] = num
        num += 1
      end
      bottom -= 1
    end

    # Fill left column
    if left <= right
      (bottom.downto(top)).each do |i|
        spiral[i][left] = num
        num += 1
      end
      left += 1
    end
  end

  spiral
end
