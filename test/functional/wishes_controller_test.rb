#-*- coding: utf-8 -*-
require 'test_helper'

class WishesControllerTest < ActionController::TestCase
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
    assert_select 'title', 'Cartolla | Nossos desejos'
  end

  test 'should have a wish list' do
    get :index
    assert_select 'table#wishes' do
      assert_select 'thead' do
        assert_select 'th', 2
      end

      assert_select 'tbody' do
        assert_select 'tr', 4
        assert_select 'tr' do |trs|
          assert_select trs[0], 'td.wish', 'PS3'
          assert_select trs[0], 'td.total', '5'
        end
      end
    end
  end

  test 'should create a wish' do
    assert_difference('Wish.count') do
      post :create, :wish => { item: 'Televisão', price: 500 }
    end

    assert_redirected_to wishes_path
  end

  test 'should ask for a wish' do
    get :new
    assert_select 'title', 'Cartolla | Faça um desejo'
  end

  test 'should show wishes distributed by price\'s class intervals' do
    wish_description = 'PS3'
    get :show, id: wish_description
    assert_response :success
    assert_select 'title', "Cartolla | Desejos com a descrição: #{wish_description}"
  end
end
