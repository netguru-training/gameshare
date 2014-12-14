require 'rails_helper'

describe GamePolicy do
  let!(:test_user) {
    User.create(
      email: 'some@email.com',
      password: 'some password',
      firstname: 'fname',
      lastname: 'lname',
      age: 18
    )
  }
  let!(:test_game) {
    Game.create(
      title: 'game title',
      description: 'game description'
    )
  }
  let!(:policy) { GamePolicy.new(test_user, test_game) }

  describe "#add_to_collection?" do
    context "when user has game in collection" do
      let!(:possession) {GameCollectionItem.create!(user: test_user, game: test_game)}

      it { expect(policy.add_to_collection?).to be_falsey }
      it { expect(GameCollectionItem.avaliable(test_user, test_game)).to be_truthy }
    end

    context "when user hasn't game in collection" do
      it { expect(policy.add_to_collection?).to be_truthy }
    end
  end
end