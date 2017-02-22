class Event < ActiveRecord::Base
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :users_joined, through: :joins, source: :user
  has_many :comments, dependent: :destroy
  has_many :users_commented, through: :comment, source: :user

  
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end


  validates :name, :presence =>true

  validates :location, :presence =>true

  validates :state, :presence =>true

  validates :date, :presence =>true
end
