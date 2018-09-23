class SplashYondaCheckSerializer < ActiveModel::Serializer
  attributes :id,
             :locate_info_id,
             :yonda_flag
  belongs_to :locate_info
end
