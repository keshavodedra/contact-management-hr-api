class LogHistory < ApplicationRecord
  belongs_to :elementable, polymorphic: true
end
