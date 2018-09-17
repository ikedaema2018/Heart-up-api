class User < ApplicationRecord
  has_secure_token :auth_token
  has_many :locate_infos
  has_many :nayami_comments
  # has_and_belongs_to_many :shabon_alerts

  validates :email, uniqueness: true
end
