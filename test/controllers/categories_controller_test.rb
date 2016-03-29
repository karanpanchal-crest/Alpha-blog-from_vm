require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  def setup
    @category = Category.create(name: "Doctor")
  end

  test "Should get route new" do
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

end
