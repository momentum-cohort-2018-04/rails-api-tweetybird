# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string
#  password_digest :string
#  api_token       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  is_admin        :boolean          default(FALSE), not null
#

class User < ApplicationRecord
  has_many :stories
  
  has_secure_password
  has_secure_token :api_token
  
  validates :username, presence: true
  validates_uniqueness_of :username
  validates :password_digest, presence: true
end
