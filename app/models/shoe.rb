class Shoe < ActiveRecord::Base
  belongs_to :user
  has_many :purchases
  has_many :bought_by_user, through: :purchases, source: :user

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than: 0 }

end
