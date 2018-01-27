require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(:name => "Blaine", :email => "BlaineEmail123@gmail.com") }

  it "is not valid without a name" do
    user.name = nil
    expect(user).to_not be_valid
  end

  it "is not valid without an email" do
    user.email = nil
    expect(user).to_not be_valid
  end

end
