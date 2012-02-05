require 'test_helper'

class BidsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:everton)
  end

  test "should get new" do
    get :new
    assert_response :success

    assert_select 'title', "Cartolla | Fazer uma oferta"
  end

  test "should create a bid" do
    assert_difference('Bid.count') do
      post :create, :bid => { price: 100, due_to: Time.now, qtd: 10, url: 'http://ofertador.com/produto/10?parceiro=cartolla' }
      assert_redirected_to wishes_path
    end
  end
end
