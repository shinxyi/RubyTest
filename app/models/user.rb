class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :comments
  has_many :rosters
  has_many :joined_events, through: :rosters, source: :event

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, :city, :state, presence: true
  validates :password, :password_confirmation, presence: true, :on => :create
  validates :email, :uniqueness => true,:case_sensitive => false, :format => { :with => email_regex }
  validates_length_of :password, :minimum=>8, :message=> "must be at least 8 characters long.", if: :password_digest_changed?
  validates_confirmation_of :password

end

# User.create(
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   email: Faker::Internet.email,
#   city: 'Allen',
#   state: 'TX',
#   password: 'password',
#   password_confirmation: 'password'
# )
