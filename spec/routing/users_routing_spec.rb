require 'rails_helper'

RSpec.describe "UsersRoutes", :type => :routing do

    it "#new" do
      expect(get("/signup")).
      to route_to('users#new')
    end

end
