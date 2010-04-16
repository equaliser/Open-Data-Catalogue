class Page < ActiveRecord::Base
  validates_uniqueness_of   :title
  validates_presence_of     :title
  
  belongs_to :user, :foreign_key=>"author"
  
  has_friendly_id :title, :use_slug => true, :approximate_ascii => true
  
  def self.published
    Page.find(:all, :conditions => {:status => "Published"}, :order => "display_order DESC")
  end
  
end
