require 'twitter'

# Config
@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["CONSUMER_KEY"]
  config.consumer_secret     = ENV["CONSUMER_SECRET"]
  config.access_token        = ENV["CONSUMER_TOKEN"]
  config.access_token_secret = ENV["CONSUMER_TOKEN_SECRET"]
end

# PRODUCTION ENVIRONMENT -----------------------------------
@client.list_timeline("nananekirinuki", "nanane").each do |tweet|
    if tweet.user.screen_name != "nananekirinuki" && !tweet.retweeted? && !tweet.full_text.include?("specified word")
        @client.retweet(tweet.id)
    end
end

@client.update("success")
