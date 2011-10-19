class Location < ActiveRecord::Base
  has_many :bookmarks
  default_scope :order => 'created_at DESC'

  validates_presence_of :url
end
