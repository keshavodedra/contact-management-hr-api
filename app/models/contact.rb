class Contact < ApplicationRecord
  #includes
  include Pagination
  include Elementable
  
  #validations
  validates_uniqueness_of :email
  validates_presence_of :email, :first_name, :last_name, :phone

  #associations
  
  #callbacks

  #scopes
  scope :latest, -> { order('created_at DESC')}
end
