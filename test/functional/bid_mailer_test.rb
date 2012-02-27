require 'test_helper'

class BidMailerTest < ActionMailer::TestCase
  test 'bid_created' do
    bid = Bid.new qtd: 10, price: 100, url: 'http://submarino.com.br/promo/10?partner=cartolla'
    bid.product = Product.new name: 'PS3'
    bid.user = User.new name: 'Submarino'
    users = [users(:everton), users(:acdesouza)]

    # Send the email, then test that it got queued
    email = BidMailer.bid_created(bid, users).deliver
    assert !ActionMailer::Base.deliveries.empty?
  end
end
