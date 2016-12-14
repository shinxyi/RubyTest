class Event < ActiveRecord::Base
  belongs_to :host, class_name: 'User', foreign_key: 'user_id'
  has_many :comments, dependent: :destroy
  has_many :rosters, dependent: :destroy
  has_many :users, through: :rosters

  validate :name, :date, :city, :state, presence: true
  validate :date_is_future

  def date_is_future
    errors.add(:date, "can't be in the past") if !date || date <Date.today
  end
end
