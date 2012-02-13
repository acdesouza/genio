#-*- coding: utf-8 -*-
require 'test_helper'

class BidTest < ActiveSupport::TestCase
  test 'should create a bid which grants wishes.' do
    saved_bid = Bid.create  :price    => 100, :due_to => Time.now,
                            :qtd      =>  10, :url    => 'http://submarino.com/produtcts/10?vendor=cartolla',
                            :user     => users(:everton), 
                            :product  => products(:PS3)

    refute_nil saved_bid
    assert_present saved_bid.price
    assert_present saved_bid.due_to
    assert_present saved_bid.qtd
    assert_present saved_bid.url
    assert_present saved_bid.user
    assert_present saved_bid.product
  end

  test 'should not create a bid without a user.' do
      saved_bid = Bid.create  :price  => 100, :due_to => Time.now,
                              :qtd    =>  10, :url    => 'http://submarino.com/produtcts/10?vendor=cartolla',
                              :product  => products(:PS3)

      assert_equal({:user=>["não pode ficar em branco"]}, saved_bid.errors.messages)
  end

  test 'should not create a bid without a product.' do
      saved_bid = Bid.create  :price  => 100, :due_to => Time.now,
                              :qtd    =>  10, :url    => 'http://submarino.com/produtcts/10?vendor=cartolla',
                              :user     => users(:everton)

      assert_equal({:product=>["não pode ficar em branco"]}, saved_bid.errors.messages)
  end
end
