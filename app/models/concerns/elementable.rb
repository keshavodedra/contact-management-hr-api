module Elementable
  extend ActiveSupport::Concern

  included do

    #associations
    has_many :log_histories, -> { order(created_at: :desc) } , as: :elementable
    
    #callbacks
    after_update :log_history

    # Methods
    def log_history
      new_version = Hash.new
      new_values = self.dup
      old_values = self.dup

      return unless self.previous_changes.present?

      self.previous_changes.each do |key, changes|
        new_values[key] = changes.last
        old_values[key] = changes.first
      end
      new_version['elementable_type'] = self.class.name
      new_version['elementable_id'] = self.id
      new_version['old_values'] = old_values.to_json
      new_version['new_values'] = new_values.to_json
      
      LogHistory.create!(new_version)
      
      end
    end
end