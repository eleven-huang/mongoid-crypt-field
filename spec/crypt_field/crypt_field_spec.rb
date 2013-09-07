require "spec_helper"

describe "Mongoid Crypt Field" do

  it "should add a crypt field and salt" do
    @user = User.new(:password => "hello")

    @user.password.should_not be_blank
    @user.password_salt.should_not be_blank
  end

  it "should authorize the right field value" do
    @user = User.new(:password => "password")

    @user.password_equal_to("password").should be_true
  end

  it "can change field value" do
    @user = User.new(:password => "password")

    @user.save.should be_true
    @user.password_equal_to("password").should be_true

    @user.password = "pass"
    @user.save.should be_true
    @user.password_equal_to("pass").should be_true

    @user.delete
  end

end