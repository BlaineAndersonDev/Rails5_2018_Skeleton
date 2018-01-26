require 'rails_helper'

RSpec.describe "StaticPagesRoutes", :type => :routing do

    it "#home" do
      expect(get("/")).
      to route_to('static_pages#home')
    end

    it "#help" do
      expect(get("/help")).
      to route_to('static_pages#help')
    end

    it "#about" do
      expect(get("/about")).
      to route_to('static_pages#about')
    end


end
