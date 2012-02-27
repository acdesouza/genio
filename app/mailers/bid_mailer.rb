#-*- coding: utf-8 -*-
class BidMailer < ActionMailer::Base
  default from: "ofertador@cartolla.com.br"

  def bid_created(bid, users)
    @bid = bid
    @partner = bid.user

    users.each do |user|
      mail(to: user.email, subject: '[Cartolla] Você recebeu uma oferta para seu desejo.')
    end
  end
end
