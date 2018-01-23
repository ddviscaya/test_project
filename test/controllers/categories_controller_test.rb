require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get categories_index_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference('Categories.count') do
      post categories_index_url, params: { category: { categoryid: @category.categoryid, categoryname: @category.categoryname, description: @category.description } }
    end

    assert_redirected_to category_url(Categories.last)
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: { categoryid: @category.categoryid, categoryname: @category.categoryname, description: @category.description } }
    assert_redirected_to category_url(@category)
  end

  test "should destroy category" do
    assert_difference('Categories.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_index_url
  end
end
