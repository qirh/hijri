require_relative 'helper'
require 'hijri'

class TestHijri < MiniTest::Unit::TestCase
  def test_conversion
    # correct
    gdate = Date.new(2019, 6, 31)
    hdate = Hijri::Date.new(1440 ,10, 27)
    assert_equal hdate, gdate.to_hijri
  end
  def test_conversion_edge_case
    # this used to be an issue in v0.4.0
    # https://github.com/ecleel/hijri/issues/4
    gdate = Date.new(2016, 9, 9)
    hdate = Hijri::Date.new(1437, 12, 6)
    assert_equal hdate, gdate.to_hijri
  end
  def test_conversion_edge_case_2
    # this breaks too ^^
    gdate = Date.new(2017, 8, 31)
    hdate = Hijri::Date.new(1438,12, 8)
    assert_equal hdate, gdate.to_hijri
  end
end
