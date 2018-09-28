class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :user_name,
             :email,
             :password_digest,
             :age,
             :gender,
             :self_introduce,
             :auth_token,
             :profile_image

  has_many :nayami_comments
  has_many :locate_infos
  has_one :user_locate
  # has_many :target_users
end
