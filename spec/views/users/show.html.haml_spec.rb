require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "Email",
      :encrypted_password => "Encrypted Password",
      :password_salt => "Password Salt"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Encrypted Password/)
    expect(rendered).to match(/Password Salt/)
  end
end
