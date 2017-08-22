class TweetController < ApplicationController
  before_action :login_required, only: [:timeline]
  require 'twitter'

  def timeline
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = Settings.twitter.consumer_key
      config.consumer_secret = Settings.twitter.consumer_secret
      config.access_token = session[:oauth_token]
      config.access_token_secret = session[:oauth_token_secret]
    end

    @tweets = client.home_timeline(include_entities: true)
  end

end
