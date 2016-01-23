class Account < ActiveRecord::Base
	def twit_client
		@client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = self.consumer_key
		  config.consumer_secret     = self.consumer_secret
		  config.access_token        = self.access_token
		  config.access_token_secret = self.access_token_secret
		end
		return @client
	end

	def send_tweet(text)
		@client = self.twit_client
		tweet = text.to_s
		@client.update(tweet)
		return true
	end

	def twit_fave(search, number, retweet)
		@client = self.twit_client
		if retweet
			retweet = " -rt"
		else !retweet
			retweet = ""
		end
		@client.search(search + retweet).take(number).collect do |tweet|
			user = 	tweet.user.screen_name
			begin
				@client.favorite(tweet)
				puts tweet.text
				sleep 2
			rescue => e
				next
			end
		end
		return true
	end	

	def twit_retweet(search, number)
		@client = self.twit_client
		@client.search(search).take(number).collect do |tweet|
			begin
				@client.retweet(tweet)
				sleep 2
			rescue => e
				next
			end
		end
		return true
	end

	def follow_user(search, number)
		@client = self.twit_client
		@client.search(search).take(number).collect do |tweet|
			begin
				client.retweet(tweet)
				sleep 2
			rescue => e
				next
			end
		end
		return true
	end
end
