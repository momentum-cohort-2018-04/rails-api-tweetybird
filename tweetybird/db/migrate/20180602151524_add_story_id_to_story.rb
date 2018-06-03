class AddStoryIdToStory < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :story_id, :integer
  end
end
