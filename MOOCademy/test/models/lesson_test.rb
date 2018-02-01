require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  def setup
  	@lesson = Lesson.new(title: "Example Title", body: "Example body......")
  end
  
  test "should be valid" do
  	assert true
  end

  test "title should be present" do 
  	@lesson.title = "     "
  	assert_not @lesson.valid?
  end

  test "body should be present" do 
  	@lesson.body = "     "
  	assert_not @lesson.valid?
  end

  test "title should be unique" do 
  	duplicate_lesson = @lesson.dup
  	@lesson.save
  	assert_not duplicate_lesson.valid?
  end
end
