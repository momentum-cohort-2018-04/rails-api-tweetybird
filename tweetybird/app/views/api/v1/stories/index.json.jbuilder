json.array! @stories do |story|
    json.extract! story, :id, :text, :user_id
  end
