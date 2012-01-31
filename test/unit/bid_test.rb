#-*- coding: utf-8 -*-
require 'test_helper'

class BidTest < ActiveSupport::TestCase
  test 'should create a bid which grants wishes.' do
    saved_bid = Bid.create  :price  => 100, :due_to => Time.now,
                            :qtd    =>  10, :url    => 'http://submarino.com/produtcts/10?vendor=cartolla'

    refute_nil saved_bid
    assert_present saved_bid.price
    assert_present saved_bid.due_to
    assert_present saved_bid.qtd
    assert_present saved_bid.url
  end
end
