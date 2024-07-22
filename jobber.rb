require 'minitest/autorun'

=begin
Semantic Versions

Description:
You're fed up about changing the version of your software manually. Instead, you will create a little script that will make it for you.

Challenge:
Create a function nextVersion, that will take a string in parameter, and will return a string containing the next version number.

For example:

```
nextVersion("1.2.3") === "1.2.4";
nextVersion("0.9.9") === "1.0.0.";
nextVersion("1") === "2";
nextVersion("1.2.3.4.5.6.7.8") === "1.2.3.4.5.6.7.9";
nextVersion("9.9") === "10.0";
```

Rules

No number but the first may be greater than 9: if any are, you must set them to 0 and increment the next number in sequence.
You can assume all tests inputs to be valid.
=end
def nextVersion(version)
  # Split the version string into an array of integers
  parts = version.split('.').map(&:to_i)

  # Iterate from the last part to the first part
  (parts.length - 1).downto(0) do |i|
    if parts[i] < 9
      # If the part is less than 9, increment it and return the result as a string
      parts[i] += 1
      return parts.join('.')
    else
      # If the part is 9, set it to 0 and continue to the next part
      parts[i] = 0
    end
  end

  # If all parts were 9, prepend a 1 at the beginning
  parts.unshift(1)
  parts.join('.')
end

class TestNextVersion < Minitest::Test
  def test_next_version
    assert_equal "1.2.4", nextVersion("1.2.3")
    assert_equal "1.0.0", nextVersion("0.9.9")
    assert_equal "2", nextVersion("1")
    assert_equal "1.2.3.4.5.6.7.9", nextVersion("1.2.3.4.5.6.7.8")
    assert_equal "10.0", nextVersion("9.9")
    assert_equal "2.0.0", nextVersion("1.9.9")
    assert_equal "1.0.0.0", nextVersion("0.9.9.9")
    assert_equal "1.0.0.0.0", nextVersion("0.9.9.9.9")
  end
end


# ================================================================

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

# Test cases
class TestCreateSpiral < Minitest::Test
  def test_create_spiral
    assert_equal [[1]], createSpiral(1)
    assert_equal [[1, 2], [4, 3]], createSpiral(2)
    assert_equal [[1, 2, 3], [8, 9, 4], [7, 6, 5]], createSpiral(3)
    assert_equal [[1, 2, 3, 4], [12, 13, 14, 5], [11, 16, 15, 6], [10, 9, 8, 7]], createSpiral(4)
    assert_equal [], createSpiral(0)
    assert_equal [], createSpiral(-1)
  end
end
