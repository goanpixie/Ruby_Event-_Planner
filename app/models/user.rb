class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :joins, dependent: :destroy
  has_many :events_joined, through: :joins, source: :event
  has_many :comments, dependent: :destroy
  has_many :events_commented, through: :comments, source: :event


  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :presence =>true

  validates :last_name, :presence =>true
  
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }

  validates :location, :presence =>true

  validates :state, :presence=>true
  
  validates :password, :presence => true
end
