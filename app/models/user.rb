class User < ApplicationRecord
  has_secure_token :auth_token
  attr_accessor :file
  has_many :locate_infos
  has_many :nayami_comments
  has_one :user_locate
  # has_many :target_users
  # has_and_belongs_to_many :shabon_alerts

  validates :email, uniqueness: true
end
