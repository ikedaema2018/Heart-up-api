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
end
