class ShabonAlertSerializer < ActiveModel::Serializer
  attributes :id,
             :locate_info_id,
             :splash
  # has_and_belongs_to_many :users
  belongs_to :locate_info
  
  class LocateInfoSerializer < ActiveModel::Serializer
    attributes :id,
             :nayami,
             :ido,
             :keido,
             :user_id,
             :color,
             :life_flag
  belongs_to :user
  end
end
