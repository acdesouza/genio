require 'test_helper'

class WishesGroupTest < ActiveSupport::TestCase
  test 'should count informed wish.' do
    wishes_group = WishesGroup.new 'Samsung LCD 55" FullHD'
    assert_equal wishes_group.size, 2
  end
end
