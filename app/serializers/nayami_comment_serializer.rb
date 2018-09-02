class NayamiCommentSerializer < ActiveModel::Serializer
  attributes :id,
             :nayami_comment,
             :locate_info_id,
             :user_id
  belongs_to :locate_info
end
