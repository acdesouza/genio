require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should identify valid password' do
    user = User.find_by_email('everton.carpes@gmail.com')
    assert user.valid_password? '123456'
  end
end
