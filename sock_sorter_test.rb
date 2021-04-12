require 'minitest/autorun'
require_relative './sock_sorter'

class SockSorterTest < MiniTest::Test
  def setup
    @input1 = 'white red black'
    @input2 = 'white pink pink white'
    @input3 = 'white pink pink white pink white checkered checkered'

    @list1 = list(@input1)
    @list2 = list(@input2)
    @list3 = list(@input3)

    @groups1 = groups(@list1)
    @groups2 = groups(@list2)
    @groups3 = groups(@list3)
    
    @pairs1 = pairs(@groups1)
    @pairs2 = pairs(@groups2)
    @pairs3 = pairs(@groups3)
  end

  def test_list
    assert_equal(@list1, list(@input1))
    assert_equal(@list2, list(@input2))
    assert_equal(@list3, list(@input3))
  end

  def test_groups
    assert_equal(@groups1, groups(@list1))
    assert_equal(@groups2, groups(@list2))
    assert_equal(@groups3, groups(@list3))
  end

  def test_pairs
    assert_equal(@pairs1, pairs(@groups1))
    assert_equal(@pairs2, pairs(@groups2))
    assert_equal(@pairs3, pairs(@groups3))
  end

  def test_to_pairs_string
    assert_equal('No pairs', to_s_from_pairs(@pairs1))
    assert_equal('white: 1 pair, pink: 1 pair', to_s_from_pairs(@pairs2))
    assert_equal('white: 1 pair, pink: 1 pair, checkered: 1 pair', to_s_from_pairs(@pairs3))
  end

  def test_to_s_from_input
    assert_equal('No pairs', to_s_from_input(@input1))
    assert_equal('white: 1 pair, pink: 1 pair', to_s_from_input(@input2))
    assert_equal('white: 1 pair, pink: 1 pair, checkered: 1 pair', to_s_from_input(@input3))
  end
end
