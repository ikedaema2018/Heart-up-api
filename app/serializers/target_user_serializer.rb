class TargetUserSerializer < ActiveModel::Serializer
  attributes :id, 
             :locate_info_id,
             :user_id, 
             :life_flag
  has_one :locate_info
end
