class User < ActiveRecord::Base
  include Friendships
  has_secure_password
  
  validates_presence_of   :nickname, :email
  validates_presence_of   :password, :on => :create
  validates_uniqueness_of :nickname, :email

  has_many :bookmarks

  def self.by_login(login)
    u = User.arel_table
    where(u[:nickname].eq(login).or(u[:email].eq(login)))
  end
end
