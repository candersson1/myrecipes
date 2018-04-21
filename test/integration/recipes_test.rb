require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end
  
  def setup
    @user = Chef.create!(chefname: "Chris", email: "candersson@klarsolutions.com")
    @recipe = Recipe.create(name: "vegetbale sautee", description: "great veggie sautee", chef: @user)
    @recipe2 = @user.recipes.build(name: "chicken sautee", description: "great chicken dish")
    @recipe2.save
  end
  
  test "should get listsing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body
    assert_match @recipe2.name, response.body
  end
    # test "the truth" do
  #   assert true
  # end
end
