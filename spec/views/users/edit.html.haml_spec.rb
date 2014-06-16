require 'rails_helper'

RSpec.describe "users/edit", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "MyString",
      :encrypted_password => "MyString",
      :password_salt => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_encrypted_password[name=?]", "user[encrypted_password]"

      assert_select "input#user_password_salt[name=?]", "user[password_salt]"
    end
  end
end
