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
end
