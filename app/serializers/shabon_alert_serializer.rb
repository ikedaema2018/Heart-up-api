class ShabonAlertSerializer < ActiveModel::Serializer
  attributes :id,
             :locate_info_id,
             :splash
  # has_and_belongs_to_many :users
  belongs_to :locate_info
end
