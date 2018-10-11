class NayamiComment < ApplicationRecord
  belongs_to :locate_info
  belongs_to :user
  has_many :reply_comments
  has_many :reactions
end
