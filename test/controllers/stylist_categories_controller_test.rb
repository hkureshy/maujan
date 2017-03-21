require 'test_helper'

class StylistCategoriesControllerTest < ActionController::TestCase
  setup do
    @stylist_category = stylist_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stylist_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stylist_category" do
    assert_difference('StylistCategory.count') do
      post :create, stylist_category: { branch_id: @stylist_category.branch_id, category: @stylist_category.category, salon_id: @stylist_category.salon_id, service_category_id: @stylist_category.service_category_id }
    end

    assert_redirected_to stylist_category_path(assigns(:stylist_category))
  end

  test "should show stylist_category" do
    get :show, id: @stylist_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stylist_category
    assert_response :success
  end

  test "should update stylist_category" do
    patch :update, id: @stylist_category, stylist_category: { branch_id: @stylist_category.branch_id, category: @stylist_category.category, salon_id: @stylist_category.salon_id, service_category_id: @stylist_category.service_category_id }
    assert_redirected_to stylist_category_path(assigns(:stylist_category))
  end

  test "should destroy stylist_category" do
    assert_difference('StylistCategory.count', -1) do
      delete :destroy, id: @stylist_category
    end

    assert_redirected_to stylist_categories_path
  end
end
