#-*- coding: utf-8 -*-
require 'test_helper'

class WishesControllerTest < ActionController::TestCase
  test "should get make" do
    get :make
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
    assert_not_nil assigns(:wishes)
  end

  test "should wish list title equals Nossos desejos" do
    get :list
    assert_select 'title', "Cartolla | Nossos desejos"
  end

  test 'should have a wish list' do
    get :list
    assert_select 'table#wishes' do
      assert_select 'header' do
        assert_select 'th', 2
      end

      assert_select 'body' do
        assert_select 'tr', 2
        assert_select 'tr' do |trs|
          assert_select trs[0], 'td.item', 'Samsung LCD 55&quot; FullHD'
          assert_select trs[0], 'td.price', '1000'
        end
      end
    end
  end
end
