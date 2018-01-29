require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:only_user) { User.create(:name => "Blaine", :email => "BlaineEmail123@gmail.com", :password => "BlainesAwesome", :password_confirmation => "BlainesAwesome") }

  describe "GET user#new" do
    before { get :index }

    it "assigns @users" do
      expect(assigns(:users)).to eq([only_user])
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end

  describe "GET user#show" do
    before { get :show, params: {id: only_user.id} }

    it "assigns @user" do
      expect(assigns(:user)).to eq(only_user)
    end

    it "renders the show template" do
      expect(response).to render_template("show")
    end
  end

  describe "GET 'new'" do
    before { get :new }

    it "assigns @post" do
      expect(assigns(:post)).to be_a_new(Post)
    end

    it "renders the new template" do
      expect(response).to render_template("new")
    end
  end

end
