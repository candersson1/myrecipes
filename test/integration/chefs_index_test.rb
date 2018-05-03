require 'test_helper'

class ChefsIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.create!(chefname: "Chris", email: "candersson@klarsolutions.com", password: "password", password_confirmation: "password")
    @chef2 = Chef.create!(chefname: "Christopher", email: "candersso1n@klarsolutions.com", password: "password", password_confirmation: "password")
  end
  
  test "should get listsing" do
    get chefs_path
    assert_template 'chefs/index'
    assert_select "a[href=?]", chef_path(@chef), text: @chef.chefname
    assert_select "a[href=?]", recipe_path(@chef2), text: @chef2.chefname
  end
  
end
