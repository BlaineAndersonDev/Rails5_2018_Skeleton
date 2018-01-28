require 'rails_helper'

RSpec.describe "UserModel", type: :model do
  let(:user) { User.new(:name => "Blaine", :email => "BlaineEmail123@gmail.com", :password => "BlainesAwesome", :password_confirmation => "BlainesAwesome") }

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

  it "is invalid if email is duplicate" do
      user.save
      duplicate_user = user.dup
      duplicate_user.save
      expect(duplicate_user).to_not be_valid
  end

  it "is invalid if email is duplicate with different case" do
      user.save
      duplicate_user = user.dup
      duplicate_user.email = "bLAINEeMAIL123@GMAIL.COM"
      duplicate_user.save
      expect(duplicate_user).to_not be_valid
  end

  it "is invalid if password <= 5 characters" do
    expect(user.password.length).to be > 5
  end

  it "is invalid if password_confirmation <= 5 characters" do
    expect(user.password_confirmation.length).to be > 5
  end

  it "is invalid if password & password_confirmation do not match" do
    expect(user.password).to eq (user.password_confirmation)
  end

end
