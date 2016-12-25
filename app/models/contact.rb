class Contact < ActiveRecord::Base
  validates  :first_name, presence: true
  validates  :email, uniqueness: true

  belongs_to :company
  belongs_to :user
end
