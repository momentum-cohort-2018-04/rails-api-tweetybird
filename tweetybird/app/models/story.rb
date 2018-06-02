# == Schema Information
#
# Table name: stories
#
#  id         :bigint(8)        not null, primary key
#  text       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Story < ApplicationRecord
  belongs_to :user
  validates :text, presence: true, length: { min: 2, maximum: 250 }
end
