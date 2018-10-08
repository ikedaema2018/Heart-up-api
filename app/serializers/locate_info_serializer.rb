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
  has_one :first_locate
  class NayamiCommentSerializer < ActiveModel::Serializer
    attributes :id,
             :nayami_comment,
             :user_id,
             :yonda_flag,
             :stamp_id,
             :created_at
  belongs_to :user
  has_many :reply_comments
    class ReplyCommentSerializer < ActiveModel::Serializer
      attributes :id,
             :reply_comment,
             :nayami_comment_id,
             :user_id
      belongs_to :user
    end
  end
end
