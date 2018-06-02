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

require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
