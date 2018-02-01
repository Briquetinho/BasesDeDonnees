require 'test_helper'

class PinTest < ActiveSupport::TestCase
  def setup
    @pin = Pin.new(url: "http://url.example.com")
  end

  test "link should be present" do 
  	@pin.url = "     "
  	assert_not @pin.valid?
  end
end
