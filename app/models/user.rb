class User < ActiveRecord::Base
  has_secure_password
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, :email, :city, :state, :birthday, :description, presence: true
  validates :password, :password_confirmation, presence: true, :on => :create
  validates :email, :uniqueness => true,:case_sensitive => false, :format => { :with => email_regex }
  validates_length_of :password, :minimum=>8, :message=> "must be at least 8 characters long.", if: :password_digest_changed?
  validates_confirmation_of :password
  validate :bday_is_past

  def bday_is_past
    errors.add(:date, "can't be in the future") if !birthday || birthday >Date.today
  end


end
