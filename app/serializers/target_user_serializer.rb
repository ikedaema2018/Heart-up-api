class TargetUserSerializer < ActiveModel::Serializer
  attributes :id, 
             :locate_info_id,
             :user_id, 
             :life_flag
  belongs_to :locate_info
end
