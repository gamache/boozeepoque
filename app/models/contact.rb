class Contact < ActiveRecord::Base
  PARAMS = %w(
    name
    email
    comment
  )

  validates_presence_of :name, :email
end
