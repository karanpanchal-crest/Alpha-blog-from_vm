require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports") 
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "category should not be null" do
    @category = Category.new(name: " ")
    assert_not @category.valid?
  end

  test "category should have unique value" do
    @category = Category.new(name: "sports")
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end

  test "category name should not be too long" do
    name = "a" * 26
    @category = Category.new(name: name)
    assert_not @category.valid?
  end

  test "category name should not be too short" do
    name = "aa"
    @category = Category.new(name: name)
    assert_not @category.valid?
  end

end

