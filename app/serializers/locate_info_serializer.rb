class LocateInfoSerializer < ActiveModel::Serializer
  attributes :id,
             :nayami,
             :ido,
             :keido,
             :user_id
             
  belongs_to :user

end
