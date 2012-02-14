#-*- coding: utf-8 -*-
require 'test_helper'
require 'mocha'

class BidsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:everton)
  end

  test 'should frequency distribute wishes by price\'s so I can make a bid for then' do
    #WishesGroup.any_instance.stubs( :intervals   => [100, 200, 300, 400, 500],
                                    #:frequencies => [10, 20, 30, 40, 50])

    wish_description = 'PS3'
    get :new, :wish_id => wish_description
    assert_response :success

    assert_select 'title', "Fazer uma oferta para os desejos do produto: #{wish_description} | Cartolla"

    assert_select 'table#wishes' do |table|
      assert_select 'thead' do
        assert_select 'th' do |ths|
          assert_select ths[0], 'th', 'Intervalos de valores'
          assert_select ths[1], 'th', '1180'
          assert_select ths[2], 'th', '1260'
          assert_select ths[3], 'th', '1340'
          assert_select ths[4], 'th', '1420'
          assert_select ths[5], 'th', '1500'
        end
      end

      assert_select 'tbody' do
        assert_select 'td' do |tds|
          assert_select tds[0], 'td', '5'
          assert_select tds[1], 'td', '4'
          assert_select tds[2], 'td', '3'
          assert_select tds[3], 'td', '2'
          assert_select tds[4], 'td', '1'
        end
      end
    end

    assert_select 'input#product_name[type=hidden]', :attributes => {:value => wish_description}
  end

  test "should create a bid" do
    assert_difference('Bid.count') do
      post :create, :bid => { price: 100, due_to: Time.now, 
                              qtd: 10, url: 'http://ofertador.com/produto/10?parceiro=cartolla', 
                               },
                    :product_name => products(:PS3).name 
      assert_redirected_to wishes_path
    end
  end
end
