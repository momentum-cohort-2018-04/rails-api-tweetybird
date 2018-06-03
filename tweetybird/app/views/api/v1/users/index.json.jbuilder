json.array! @users do |user|
    json.extract! user, :id, :username, :api_token, :stories
  end
