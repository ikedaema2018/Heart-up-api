class UserLocateSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :ido,
             :keido
  belongs_to :user
end
