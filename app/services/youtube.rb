class Youtube
  attr_reader :client
  attr_reader :title

  def initialize(title = 'Keyboard Cat 10 hours')
    @client = YouTubeIt::Client.new(dev_key: YouTubeITConfig.dev_key)
    @title  = "#{title} game trailer"
  end

  def first_video
    search_result.videos.first
  end

  private

  def search_result
    client.videos_by(query: title, page: 1, per_page: 1)
  end
end