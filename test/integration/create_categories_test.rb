require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username:"jack", email:"jack@gmail.com", password:"password", admin:true)
    sign_in_as(@user, "password")
  end

  test "get new category form and create category" do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: {name:"Health Care"}
    end
    assert_template 'categories/index'
    assert_match "HEALTH CARE", response.body 
  end
 
  test "Invalid category submission results in failures" do
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, category: {name: "ss"}
    end
    assert_template 'categories/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

end
