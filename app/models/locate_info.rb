class LocateInfo < ApplicationRecord
  belongs_to :user
  has_many :nayami_comments
end
