class User < ActiveRecord::Base
  has_many :jobs
  has_many :contacts
end