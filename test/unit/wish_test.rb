#-*- coding: utf-8 -*-
require 'test_helper'

class WishTest < ActiveSupport::TestCase
  test 'should create a wish with an item and a price' do
    saved_wish = Wish.create item: 'Televisão', price: 500

    refute_nil saved_wish
    assert_present saved_wish.item
    assert_present saved_wish.price
  end

  test 'should not create wish without an item' do
    wish = Wish.create price: 500

    refute wish.valid?
  end

  test 'should not create wish without an price' do
    wish = Wish.create item: 'Televisão'

    refute wish.valid?
  end

  test 'should group and count wishes' do
    counted_wishes = Wish.grouped
    assert_not_nil counted_wishes
    assert_equal counted_wishes.keys, ['Samsung LCD 55" FullHD', 'Samsung BluRay Player']
    assert_equal counted_wishes['Samsung LCD 55" FullHD'], 2
    assert_equal counted_wishes['Samsung BluRay Player'], 1
  end
end
