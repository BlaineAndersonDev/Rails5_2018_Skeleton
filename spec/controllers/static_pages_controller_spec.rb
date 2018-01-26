require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views

  before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
      assert_select "title", "Home | #{@base_title}"
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
      assert_select "title", "Help | #{@base_title}"
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
      assert_select "title", "About | #{@base_title}"
    end
  end

end
