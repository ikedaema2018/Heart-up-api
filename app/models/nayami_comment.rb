class NayamiComment < ApplicationRecord
  belongs_to :locate_info
  belongs_to :user
end
