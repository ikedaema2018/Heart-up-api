class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :user_name,
             :email,
             :password_digest,
             :age,
             :gender,
             :self_introduce

  has_many :nayami_comments
  has_many :locate_infos
end
