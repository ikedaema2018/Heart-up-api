class LocateInfo < ApplicationRecord
  belongs_to :user
  has_many :nayami_comments
  has_many :shabon_alerts
  has_many :result_messages
  has_one :first_locate
  has_one :target_user
  has_one :splash_yonda_check
end
