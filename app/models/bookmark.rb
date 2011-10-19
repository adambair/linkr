class Bookmark < ActiveRecord::Base
  attr_accessor :url

  acts_as_taggable_on :tags

  default_scope :order => 'created_at DESC'
  scope :public, where(:private => false)

  belongs_to  :location
  belongs_to  :user

  delegate :url, :to => :location, :allow_nil => true
  before_save :find_or_generate_location

  validates_presence_of :title

  def find_or_generate_location
    self.location = Location.find_or_create_by_url(@url)
  end
end
