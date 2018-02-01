require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
  	@comment = Comment.new(commentaire: "Example of body")
  end

  test "body should be present" do 
  	@comment.commentaire = "     "
  	assert_not @comment.valid?
  end

end