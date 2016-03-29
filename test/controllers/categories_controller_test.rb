require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  def setup
    @category = Category.create(name: "Doctor")
    @user = User.create(username:"john", email:"john@gmail.com", password:"password", admin:true)
  end

  test "Should get route new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  test "Should get route show" do
    get(:show, {'id' => @category.id})
    assert_response :success
  end

  test "Should get route index" do
    get :index
    assert_response :success
  end

  test "Should render error creating a category when user is not an admin or not logged in" do
    assert_no_difference 'Category.count' do
      post :create, category: {name: "travel"}
    end
    assert_redirected_to categories_path
  end


end
