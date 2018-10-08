class NayamiCommentSerializer < ActiveModel::Serializer
  attributes :id,
             :nayami_comment,
             :locate_info_id,
             :user_id,
             :stamp_id
  belongs_to :locate_info
  belongs_to :user
  has_many :reply_comments

  class LocateInfoSerializer < ActiveModel::Serializer
    attributes :id,
             :nayami,
             :user_id,
             :color,
             :life_flag
    belongs_to :user
  end
end
