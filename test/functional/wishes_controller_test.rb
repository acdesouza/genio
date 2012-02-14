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

  test 'should create a wish' do
    assert_difference('Wish.count') do
      post :create, :wish => { item: 'Televisão', price: 500 }
      assert_redirected_to wishes_path
    end

  end

  test 'should ask for a wish' do
    get :new
    assert_response :success

    assert_select 'title', 'Faça um desejo | Cartolla'
  end
end
