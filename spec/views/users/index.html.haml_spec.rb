require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :email => "Email",
        :encrypted_password => "Encrypted Password",
        :password_salt => "Password Salt"
      ),
      User.create!(
        :email => "Email",
        :encrypted_password => "Encrypted Password",
        :password_salt => "Password Salt"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Encrypted Password".to_s, :count => 2
    assert_select "tr>td", :text => "Password Salt".to_s, :count => 2
  end
end
