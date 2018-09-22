class LocateInfoSerializer < ActiveModel::Serializer
  attributes :id,
             :nayami,
             :ido,
             :keido,
             :user_id,
             :color,
             :life_flag
  belongs_to :user
  has_many :nayami_comments
  has_many :shabon_alerts
  has_one :target_user
  has_one :splash_yonda_check
  class NayamiCommentSerializer < ActiveModel::Serializer
    attributes :id,
             :nayami_comment,
             :user_id,
             :yonda_flag
  belongs_to :user
  end
end
