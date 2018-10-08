class ReplyCommentSerializer < ActiveModel::Serializer
  attributes :id,
             :replt_comment,
             :nayami_comment_id,
             :user_id
end
