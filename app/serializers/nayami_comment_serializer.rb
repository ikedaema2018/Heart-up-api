class NayamiCommentSerializer < ActiveModel::Serializer
  attributes :id,
             :nayami_comment,
             :locate_info_id,
             :user_id
  belongs_to :locate_info
  belongs_to :user

  class LocateInfoSerializer < ActiveModel::Serializer
    attributes :id,
             :nayami,
             :user_id,
             :color
    belongs_to :user
  end
end
