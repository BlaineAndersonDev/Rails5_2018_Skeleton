require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:only_user) { User.create(:name => "Blaine", :email => "BlaineEmail123@gmail.com", :password => "BlainesAwesome", :password_confirmation => "BlainesAwesome") }

  describe "GET user#index" do
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

    it "assigns @user" do
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the new template" do
      expect(response).to render_template("new")
    end
  end

  describe "POST 'create'" do
    before { get :create, params: {:user => {:name => "OtherBlaine", :email => "OtherBlaineEmail123@gmail.com", :password => "OtherBlainesAwesome", :password_confirmation => "OtherBlainesAwesome"} } }

    it "will redirect to root path" do
      expect(response).to redirect_to(root_path)
    end

    it "will create a new User" do
      expect{get :create, params: {:user => {:name => "OtherOtherBlaine", :email => "OtherOtherBlaineEmail123@gmail.com", :password => "OtherOtherBlainesAwesome", :password_confirmation => "OtherOtherBlainesAwesome"} }}.to change{User.count}.by(1)
    end
  end

  describe "GET 'edit'" do
    before { get :edit, params: {id: only_user.id} }

    it "assigns @post" do
      expect(assigns(:user)).to eq(only_user)
    end

    it "renders the edit template" do
      expect(response).to render_template("edit")
    end
  end

  describe "PUT 'update'" do
    context "upon success" do
      before { put :update, params: {id: only_user.id, user: {:name => "Blaine", :email => "BlaineEmail123@gmail.com", :password => "BlainesAwesome", :password_confirmation => "BlainesAwesome"} } }
      it "will redirect to root path" do
        expect(response).to redirect_to root_path
      end
    end
    context "upon failure" do
      before { put :update, params: {id: only_user.id, user: {:name => "Blaine", :email => "BlaineEmail123@gmail.com", :password => "BlainesAwesome", :password_confirmation => "BadPassword"} } }

      it "will render :edit template" do
        get :edit, params: { id: only_user.id }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE 'destroy'" do
    before { get :destroy, params: {id: only_user.id} }

    it " will redirect to root path" do
      expect(response).to redirect_to root_path
    end
  end

end
