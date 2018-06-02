# == Schema Information
#
# Table name: stories
#
#  id         :bigint(8)        not null, primary key
#  text       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  story_id   :integer
#

class Story < ApplicationRecord
  belongs_to :user
  belongs_to :story, optional: true

  validates :text, presence: true 
  validates_length_of :text, :minimum => 2, :maximum => 250 
end
