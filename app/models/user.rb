class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {in: 10..50}, on: :create
  
  has_many :jobs
  has_many :contacts

  def companies
    Companies.joins(:jobs).where("jobs.user_id = ?", current_user.id)
  end
end