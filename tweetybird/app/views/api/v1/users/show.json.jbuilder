
# json.id @user.id
# json.username @user.username
# json.api_token @user.api_token
# json.stories @user.stories

json.links do
    json.self api_v1_user_path(@user)
    json.list api_v1_users_path
    json.update do
        json.method "PUT"
        json.href api_v1_user_path(@user)
    end
    json.delete do
        json.method "DELETE"
        json.href api_v1_user_path(@user)
    end
end
json.data do
    json.id @user.id
    json.attributes do
        json.id @user.id
        json.username @user.username
        json.api_token @user.api_token
        json.stories @user.stories
    end
end