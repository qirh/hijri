require_relative 'helper'
require 'hijri'

class TestHijri < MiniTest::Unit::TestCase

  def test_conversion
    # correct
    gdate = Date.new(2016, 9, 9)
    hdate = Hijri::Date.new(1437, 12, 6)
    assert_equal hdate, gdate.to_hijri
    assert_equal gdate, hdate.to_greo
  end

  def test_conversion_edge_case
    # this used to be an issue in v0.4.0
    # https://github.com/ecleel/hijri/issues/4
    gdate = Date.new(2017, 8, 31)
    hdate = Hijri::Date.new(1438, 12, 8)
    assert_equal hdate, gdate.to_hijri
    assert_equal gdate, hdate.to_greo
  end

  def test_conversion_edge_case_2
    # this breaks too ^^
    gdate = Date.new(2019, 6, 30)
    hdate = Hijri::Date.new(1440, 10, 27)
    assert_equal hdate, gdate.to_hijri
    assert_equal gdate, hdate.to_greo
  end

  def test_conversion_edge_case_3
    # this breaks too ^^
    gdate = Date.new(2013, 12, 31)
    hdate = Hijri::Date.new(1435, 2, 27)
    assert_equal hdate, gdate.to_hijri
    assert_equal gdate, hdate.to_greo
  end

  def test_plus_and_minus
    gdate = Date.new(2014, 1, 1)
    hdate = Hijri::Date.new(1435, 2, 28)

    assert_equal gdate, hdate.to_greo
    assert_equal hdate, gdate.to_hijri

    (1..5000).each do |n|
      puts "#{n} #{gdate-n}, #{hdate.to_greo(-n)} -- #{hdate-n}, #{gdate.to_hijri(-n)}"
      assert_equal gdate-n, hdate.to_greo(-n)
      assert_equal hdate-n, gdate.to_hijri(-n)

      assert_equal gdate+n, hdate.to_greo(+n)
      assert_equal hdate+n, gdate.to_hijri(+n)
    end
  end
end
