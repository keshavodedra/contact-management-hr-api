class LogHistorySerializer < ActiveModel::Serializer
  attributes :id, :elementable_type, :elementable_id, :old_values, :new_values, :created_at

  def new_values
    JSON.parse(object.new_values)
  end

  def old_values
    JSON.parse(object.old_values)
  end

end
