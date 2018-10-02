class LocateInfo < ApplicationRecord
  belongs_to :user
  has_many :nayami_comments
  has_many :shabon_alerts
  has_many :first_locates
  has_one :target_user
  has_one :splash_yonda_check
end
