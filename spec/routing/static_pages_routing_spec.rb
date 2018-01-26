require 'rails_helper'

RSpec.describe "StaticPagesRoutes", :type => :routing do

    it "#home" do
      expect(get("/static_pages/home")).
      to route_to('static_pages#home')
    end

    it "#help" do
      expect(get("/static_pages/help")).
      to route_to('static_pages#help')
    end

    it "#about" do
      expect(get("/static_pages/about")).
      to route_to('static_pages#about')
    end


end
