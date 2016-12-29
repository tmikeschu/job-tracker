class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {in: 10..50}, on: :create
  
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :companies, dependent: :destroy
  has_many :categories, dependent: :destroy
end