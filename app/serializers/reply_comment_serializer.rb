class ReplyCommentSerializer < ActiveModel::Serializer
  attributes :id,
             :reply_comment,
             :nayami_comment_id,
             :user_id
end
