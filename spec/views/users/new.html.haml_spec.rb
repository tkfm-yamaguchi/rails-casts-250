require 'rails_helper'

RSpec.describe "users/new", :type => :view do
  before(:each) do
    assign(:user, User.new(
      :email => "MyString",
      :encrypted_password => "MyString",
      :password_salt => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_encrypted_password[name=?]", "user[encrypted_password]"

      assert_select "input#user_password_salt[name=?]", "user[password_salt]"
    end
  end
end
