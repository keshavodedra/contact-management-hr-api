class ContactSerializer < ActiveModel::Serializer
  attributes :id,:first_name, :last_name, :email, :phone, :created_at
  has_many :log_histories
end
