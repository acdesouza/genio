require 'test_helper'

class WishesGroupTest < ActiveSupport::TestCase
  test 'should count informed wish.' do
    wishes_group = WishesGroup.new 'Samsung LCD 55" FullHD'
    assert_equal wishes_group.size, 2
  end

  test 'should calculate top price of each of 5 intervals.' do
    wishes_group_xbox = WishesGroup.new 'XBox 360'
    assert_equal [ 118,  126,  134,  142,  150], wishes_group_xbox.intervals

    wishes_group_ps3 = WishesGroup.new 'PS3'
    assert_equal [1180, 1260, 1340, 1420, 1500], wishes_group_ps3.intervals
  end

  test 'should count frequencies in each price\'s interval' do
    wishes_group_xbox = WishesGroup.new 'XBox 360'
    assert_equal [1, 1, 1, 1, 1], wishes_group_xbox.frequencies

    wishes_group_xbox = WishesGroup.new 'PS3'
    assert_equal [5, 4, 3, 2, 1], wishes_group_xbox.frequencies
  end
end
