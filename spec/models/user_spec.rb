require 'rails_helper'

RSpec.describe "UserModel", type: :model do
  let(:user) { User.new(:name => "Blaine", :email => "BlaineEmail123@gmail.com") }

  it "is valid with all attributes" do
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user.name = nil
    expect(user).to_not be_valid
  end

  it "is invalid without an email" do
    user.email = nil
    expect(user).to_not be_valid
  end

  it "is invalid if name > 50 characters" do
    user.name = "a" * 51
    expect(user).to_not be_valid
  end

  it "is invalid if email > 255 characters" do
    user.email = "a" * 244 + "@example.com"
    expect(user).to_not be_valid
  end

  it "is invalid if email contains errors" do
    invalid_addresses = ["user@example,com", "user_at_foo.org", "user.name@example.foo@bar_baz.com", "foo@bar+baz.com"]
    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user).to_not be_valid
    end
  end

end
