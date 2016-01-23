json.array!(@accounts) do |account|
  json.extract! account, :id, :name, :consumer_key, :consumer_secret, :access_token, :access_token_secret
  json.url account_url(account, format: :json)
end
