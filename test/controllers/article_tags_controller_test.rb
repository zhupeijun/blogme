require 'test_helper'

class ArticleTagsControllerTest < ActionController::TestCase
  setup do
    @article_tag = article_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:article_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article_tag" do
    assert_difference('ArticleTag.count') do
      post :create, article_tag: { article_id: @article_tag.article_id, tag: @article_tag.tag }
    end

    assert_redirected_to article_tag_path(assigns(:article_tag))
  end

  test "should show article_tag" do
    get :show, id: @article_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @article_tag
    assert_response :success
  end

  test "should update article_tag" do
    patch :update, id: @article_tag, article_tag: { article_id: @article_tag.article_id, tag: @article_tag.tag }
    assert_redirected_to article_tag_path(assigns(:article_tag))
  end

  test "should destroy article_tag" do
    assert_difference('ArticleTag.count', -1) do
      delete :destroy, id: @article_tag
    end

    assert_redirected_to article_tags_path
  end
end
