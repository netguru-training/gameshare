require 'rails_helper'

describe SearchController do
  let(:search_query) { { title: 'title' } }
  let(:game_params) { { title: 'Title', description: 'description' } }
  let(:game) { Game.create! game_params}

  describe "GET index" do
    it 'finds game on index action' do
      get :index, { search: { title: game.title } }
      expect(controller.games).to eq [game]
    end

    it 'not finds game on index action' do
      get :index, { search: { title: 'game not found' } }
      expect(controller.games).to eq []
    end

    it 'exposes all games' do
      get :index
      expect(controller.games).to eq []
    end
  end
end
