require 'minitest/autorun'
require_relative 'create_spiral'

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
