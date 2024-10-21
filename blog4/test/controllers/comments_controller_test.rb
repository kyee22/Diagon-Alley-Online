require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog = blogs(:one)
    @comment = comments(:one)
  end

  test "should get index" do
    get blog_comments_url(@blog)
    assert_response :success
  end

  test "should get new" do
    get new_blog_comment_url(@blog)
    assert_response :success
  end

  test "should create comment" do
    assert_difference("Comment.count") do
      post blog_comments_url(@blog), params: { comment: { blog_id: @comment.blog_id, contont: @comment.contont } }
    end

    # assert_redirected_to comment_url(Comment.last)
    # assert_redirected_to blog_comment_url(@blog, Comment.last)
    assert_redirected_to blog_url(@blog)
  end

  test "should show comment" do
    # get comment_url(@comment)
    get blog_comment_url(@blog, @comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_blog_comment_url(@blog, @comment)
    assert_response :success
  end

  test "should update comment" do
    patch blog_comment_url(@blog, @comment), params: { comment: { blog_id: @comment.blog_id, contont: @comment.contont } }
    assert_redirected_to blog_comment_url(@blog, @comment)
  end

  test "should destroy comment" do
    assert_difference("Comment.count", -1) do
      delete blog_comment_url(@blog, @comment)
    end

    assert_redirected_to blog_comments_url(@blog)
  end
end
