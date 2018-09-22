class ShabonAlert < ApplicationRecord
  # has_and_belongs_to_many :users
  belongs_to :locate_info
  belongs_to :user
end
