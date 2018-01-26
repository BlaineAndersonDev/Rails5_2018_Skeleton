require 'rails_helper'

RSpec.describe "RootRoutes", :type => :routing do
  it "#root" do
    expect(get("/")).
    to route_to('static_pages#home')
  end
end
