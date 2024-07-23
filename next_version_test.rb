require 'minitest/autorun'
require_relative 'next_version'

class TestNextVersion < Minitest::Test
  def test_next_version
    assert_equal '1.2.4', nextVersion('1.2.3')
    assert_equal '1.0.0', nextVersion('0.9.9')
    assert_equal '2', nextVersion('1')
    assert_equal '1.2.3.4.5.6.7.9', nextVersion('1.2.3.4.5.6.7.8')
    assert_equal '2.0.0', nextVersion('1.9.9')
    assert_equal '1.0.0.0', nextVersion('0.9.9.9')
    assert_equal '1.0.0.0.0', nextVersion('0.9.9.9.9')
  end

  def test_next_version_alternative
    assert_equal '1.2.4', nextVersionAlternative('1.2.3')
    assert_equal '1.0.0', nextVersionAlternative('0.9.9')
    assert_equal '2', nextVersionAlternative('1')
    assert_equal '1.2.3.4.5.6.7.9', nextVersionAlternative('1.2.3.4.5.6.7.8')
    assert_equal '2.0.0', nextVersionAlternative('1.9.9')
    assert_equal '1.0.0.0', nextVersionAlternative('0.9.9.9')
    assert_equal '1.0.0.0.0', nextVersionAlternative('0.9.9.9.9')
  end
end
