#-*- coding: utf-8 -*-
require 'test_helper'

class WishesControllerTest < ActionController::TestCase
  setup do
    sign_in users(:everton)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wishes)
  end

  test 'should wish list title equals Nossos desejos' do
    get :index
    assert_response :success

    assert_select 'title', 'Nossos desejos | Cartolla'
  end

  test 'should have a wish list' do
    get :index
    assert_response :success

    assert_select 'table#wishes' do
      assert_select 'thead' do
        assert_select 'th', 3
      end

      assert_select 'tbody' do
        assert_select 'tr', 4
        assert_select 'tr' do |trs|
          assert_select trs[0], 'td.wish', 'PS3'
          assert_select trs[0], 'td.total', '15'
        end
      end
    end
  end

  test 'should show only my wishes' do
    sign_in users(:acdesouza)
    get 'user', :id => users(:acdesouza).id
    assert_response :success

    assert_select 'table#wishes' do
      assert_select 'thead' do
        assert_select 'th', 2
      end

      assert_select 'tbody' do |tbody|
        assert_select 'tr', 2

        tds_item = css_select 'tr td.item'
        assert_select tds_item[0], 'td', CGI.escapeHTML(wishes(:televisao_1).item)
        assert_select tds_item[1], 'td', wishes(:ps3_01).item

        tds_price = css_select 'tr td.price'
        assert_select tds_price[0], 'td', wishes(:televisao_1).price.to_s
        assert_select tds_price[1], 'td', wishes(:ps3_01).price.to_s
      end
    end
  end

  test 'should create a wish' do
    assert_difference('Wish.count') do
      post :create, :wish => { item: 'Televisão', price: 500 }
      assert_redirected_to user_wishes_path(users(:everton).id)
    end

  end

  test 'should ask for a wish' do
    get :new
    assert_response :success

    assert_select 'title', 'Faça um desejo | Cartolla'
  end
end
