class LocateInfo < ApplicationRecord
  belongs_to :user
  has_many :nayami_comments
  has_many :shabon_alerts
  has_one :target_user
end
