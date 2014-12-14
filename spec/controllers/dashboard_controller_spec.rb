require 'rails_helper'

describe DashboardController do
  let(:user) {
    User.create(
      email: 'some@email.com',
      password: 'some password',
      firstname: 'fname',
      lastname: 'lname',
      age: 18
    )
  }

  before do
    sign_in user
    controller.stub(:user_signed_in?).and_return(true)
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(user)
  end

  describe "GET wishlist" do
    it "expose wished_games" do
      get :wishlist
      expect(controller.wished_games).to eq([])
    end
  end

  describe "GET game_collection" do
    it "expose owned_games" do
      get :game_collection
      expect(controller.owned_games).to eq([])
    end
  end
end