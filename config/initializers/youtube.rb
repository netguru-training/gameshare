require 'ostruct'
raw_config = File.read(::Rails.root.to_s + "/config/youtube.yml") || ''
YouTubeITConfig = OpenStruct.new(YAML.load(raw_config)[Rails.env])
