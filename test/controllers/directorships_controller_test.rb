require 'test_helper'

class DirectorshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @directorship = directorships(:one)
  end

  test "should get index" do
    get directorships_url
    assert_response :success
  end

  test "should get new" do
    get new_directorship_url
    assert_response :success
  end

  test "should create directorship" do
    assert_difference('Directorship.count') do
      post directorships_url, params: { directorship: { director: @directorship.director, name: @directorship.name } }
    end

    assert_redirected_to directorship_url(Directorship.last)
  end

  test "should show directorship" do
    get directorship_url(@directorship)
    assert_response :success
  end

  test "should get edit" do
    get edit_directorship_url(@directorship)
    assert_response :success
  end

  test "should update directorship" do
    patch directorship_url(@directorship), params: { directorship: { director: @directorship.director, name: @directorship.name } }
    assert_redirected_to directorship_url(@directorship)
  end

  test "should destroy directorship" do
    assert_difference('Directorship.count', -1) do
      delete directorship_url(@directorship)
    end

    assert_redirected_to directorships_url
  end
end
