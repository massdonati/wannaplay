require "spec_helper"

describe GamesController do
  include Devise::TestHelpers
  describe "Games#index" do
    
    xit "should get all the games" do
      game = FactoryGirl.create(:game)
      get :index
      response.should be eq(200)
    end

    it "should create a new Match" do
      valid_attributes = {
        :sport => "calcetto a 5",
        :date => Date.tomorrow,
        :location => "Zambon",
        :time => "21:30"
      }

      post :create, :game => valid_attributes
      
      assigns(:game).should redirect_to(:game)
      assigns(:game).should be_persisted
    end

  end
end