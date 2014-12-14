require 'rails_helper'

describe Youtube do
  let(:title) { 'title' }
  let(:yt) { described_class.new(title) }

  describe "#initialize" do
    it "assigns title" do
      expect(yt.title).not_to eq(nil)
    end

    it "appends 'game trailer' to title" do
      expect(yt.title).to eq("#{title} game trailer")
    end

    it "creates client" do
      expect(yt.client).not_to eq(nil)
    end

    it "assigns detault title" do
      yt = described_class.new
      expect(yt.title).not_to eq(nil)
    end
  end

  describe "#first_video" do
    it "finds video" do
      expect(yt.first_video).not_to eq(nil)
    end
  end
end
