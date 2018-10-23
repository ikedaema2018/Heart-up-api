class ResultMessageSerializer < ActiveModel::Serializer
  attributes :id
             :locate_info_id
             :result_message

  belongs_to :locate_info
end
