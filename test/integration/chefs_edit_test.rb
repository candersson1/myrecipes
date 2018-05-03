require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.create!(chefname: "Chris", email: "candersson@klarsolutions.com", password: "password", password_confirmation: "password")
  end
  
 
  test "reject an invalid edit" do
    get edit_chef_path(@chef)
    patch chef_path(@chef), params: { chef: { chefname:" ", email:"xswede@gmail.com " } }
    assert_template 'chefs/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  test "accept valid signup" do
   get edit_chef_path(@chef)
    patch chef_path(@chef), params: { chef: { chefname:"Chris Andersson ", email:"xswedeee@gmail.com " } }
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match "Chris Andersson ", @chef.chefname
    assert_match "xswedeee@gmail.com ", @chef.email
  end
  
end
