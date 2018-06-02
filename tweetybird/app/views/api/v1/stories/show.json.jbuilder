
# json.id @story.id
# json.text @story.text
# json.user_id @story.user_id

json.links do
    json.self api_v1_story_path(@story)
    json.list api_v1_stories_path
    json.update do
        json.method "PUT"
        json.href api_v1_story_path(@story)
    end
    json.delete do
        json.method "DELETE"
        json.href api_v1_story_path(@story)
    end
end
json.data do
    json.id @story.id
    json.attributes do
        json.id @story.id
        json.text @story.text
        json.user_id @story.user_id
    end
end