require 'rails_helper'

describe GamePolicy do
  let!(:user) {
    User.create(
      email: 'some@email.com',
      password: 'some password',
      firstname: 'fname',
      lastname: 'lname',
      age: 18
    )
  }
  let!(:game) {
    Game.create(
      title: 'game title',
      description: 'game description'
    )
  }
  let!(:policy) { GamePolicy.new(user, game) }

  context "when user has game in collection" do
    let!(:possession) { GameCollectionItem.create!(user: user, game: game) }

    it { expect(policy.add_to_collection?).to be_falsey }
    it { expect(policy.add_to_wishlist?).to be_falsey }

    it { expect(policy.remove_from_collection?).to be_truthy }
    it { expect(policy.remove_from_wishlist?).to be_falsey }
  end

  context "when user hasn't game in collection" do
    it { expect(policy.add_to_collection?).to be_truthy }
    it { expect(policy.add_to_wishlist?).to be_truthy }

    it { expect(policy.remove_from_collection?).to be_falsey }
    it { expect(policy.remove_from_wishlist?).to be_falsey }
  end

  context "when user has game in wishlist" do
    let!(:possession) {WishlistItem.create!(user: user, game: game)}

    it { expect(policy.add_to_collection?).to be_truthy }
    it { expect(policy.add_to_wishlist?).to be_falsey }

    it { expect(policy.remove_from_collection?).to be_falsey }
    it { expect(policy.remove_from_wishlist?).to be_truthy }
  end

  context "whe user hasn't game in wishlist" do
    it { expect(policy.add_to_collection?).to be_truthy }
    it { expect(policy.add_to_wishlist?).to be_truthy }

    it { expect(policy.remove_from_collection?).to be_falsey }
    it { expect(policy.remove_from_wishlist?).to be_falsey }
  end
end