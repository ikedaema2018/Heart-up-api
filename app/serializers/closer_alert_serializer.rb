class CloserAlertSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :locate_info_id,
             :close_flag
  belongs_to :user
  belongs_to :locate_info
  class LocateInfoSerializer < ActiveModel::Serializer
    attributes :id,
             :user_id
  belongs_to :user
  end
end
