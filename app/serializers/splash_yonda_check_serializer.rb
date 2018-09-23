class SplashYondaCheckSerializer < ActiveModel::Serializer
  attributes :id,
             :locate_info_id,
             :yonda_flag
  has_one :locate_info
end
