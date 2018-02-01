require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(pseudo: "Pseudonyme", firstname: "ExampleFirstName", lastname: "ExampleLastName", email: "example@email.com", password: "passwordexample", password_confirmation: "passwordexample")
  end

  test "pseudo should be present" do 
  	@user.pseudo = "     "
  	assert_not @user.valid?
  end

  test "first name should be present" do 
  	@user.firstname = "     "
  	assert_not @user.valid?
  end

  test "last name should be present" do 
  	@user.lastname = "     "
  	assert_not @user.valid?
  end

  test "email should be present" do 
  	@user.email = "     "
  	assert_not @user.valid?
  end

  test "password should be present" do 
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "pseudo should not be too long" do
    @user.pseudo = "a" * 12 
    assert_not @user.valid?
  end

  test "pseudo should not be too short" do
    @user.pseudo = "a" * 4 
    assert_not @user.valid?
  end

  test "first name should not be too long" do
    @user.firstname = "a" * 50 
    assert_not @user.valid?
  end

  test "first name should not be too short" do
    @user.firstname = "a" * 2 
    assert_not @user.valid?
  end

  test "last name should not be too long" do
    @user.lastname = "a" * 50 
    assert_not @user.valid?
  end

  test "last name should not be too short" do
    @user.lastname = "a" * 2 
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "password should not be too short" do 
    @user.password = @user.password_confirmation = "a" * 8
    assert_not @user.valid?
  end

  test "password should not be too long" do
    @user.password = @user.password_confirmation = "a" * 50
    assert_not @user.valid?
  end

  test "pseudo & email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com STUDENT@foo.COM S_T-ENT@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert true, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com student_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
end