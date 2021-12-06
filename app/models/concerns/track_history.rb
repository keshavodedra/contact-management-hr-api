module TrackHistory
  extend ActiveSupport::Concern
  
  included do

    after_commit :send_changes_to_version_history

    def send_changes_to_version_history
      
      self.previous_changes.each do |key, changes|
        # next if key == ("updated_at" || "created_at") || non_versioned_attributes.include?(key)
        # new_version[key] = changes.last
        puts "'#{key}' - '#{changes.first}' - '#{changes.last}'"
      end             
    end

  end

end