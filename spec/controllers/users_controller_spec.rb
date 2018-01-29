require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:only_user) { User.create(:name => "Blaine", :email => "BlaineEmail123@gmail.com", :password => "BlainesAwesome", :password_confirmation => "BlainesAwesome") }

  describe "GET #new" do
    before { get :index }

    it "assigns @users" do
      expect(assigns(:users)).to eq([only_user])
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end

end
