class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  
  belongs_to :category
  belongs_to :company
  
  has_many :comments
end
