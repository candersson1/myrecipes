require 'test_helper'

class ChefsIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.create!(chefname: "Chris", email: "candersson@klarsolutions.com", password: "password", password_confirmation: "password")
    @chef2 = Chef.create!(chefname: "Christopher", email: "candersso1n@klarsolutions.com", password: "password", password_confirmation: "password")
    @admin_user = Chef.create!(chefname: "Christopher1", email: "candersso11n@klarsolutions.com", password: "password", password_confirmation: "password", admin: true)
  end
  
  test "should get listsing" do
    get chefs_path
    assert_template 'chefs/index'
    assert_select "a[href=?]", chef_path(@chef), text: @chef.chefname.capitalize
    assert_select "a[href=?]", chef_path(@chef2), text: @chef2.chefname.capitalize
  end
  
  test "should delete chef" do
  sign_in_as(@admin_user, "password")  
  get chefs_path
  assert_template 'chefs/index'
  assert_difference 'Chef.count', -1 do
    delete chef_path(@chef2)
  end
  assert_redirected_to chefs_path
  assert_not flash.empty?
  end
  
end
