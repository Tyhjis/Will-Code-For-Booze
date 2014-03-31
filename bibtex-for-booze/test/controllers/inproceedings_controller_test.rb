require 'test_helper'

class InproceedingsControllerTest < ActionController::TestCase
  setup do
    @inproceeding = inproceedings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inproceedings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inproceeding" do
    assert_difference('Inproceeding.count') do
      post :create, inproceeding: {  }
    end

    assert_redirected_to inproceeding_path(assigns(:inproceeding))
  end

  test "should show inproceeding" do
    get :show, id: @inproceeding
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inproceeding
    assert_response :success
  end

  test "should update inproceeding" do
    patch :update, id: @inproceeding, inproceeding: {  }
    assert_redirected_to inproceeding_path(assigns(:inproceeding))
  end

  test "should destroy inproceeding" do
    assert_difference('Inproceeding.count', -1) do
      delete :destroy, id: @inproceeding
    end

    assert_redirected_to inproceedings_path
  end
end
