class Dataset < ActiveRecord::Base
  require 'validates_existence'
  acts_as_taggable_on :tags
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true
  
  validates_presence_of     :name, :description
  
  belongs_to :licence
  validates_existence_of :licence
  
  belongs_to :language
  validates_existence_of :language
  
  belongs_to :audience
  validates_existence_of  :audience
  
  belongs_to :category
  validates_existence_of  :category
  
  def self.published
    Dataset.find(:all, :conditions => {:status => "published"}, :order=> "name ASC")
  end
  
  def self.latest(x)
    Dataset.find(:all, :conditions => {:status => "published"}, :order=> "publish_date DESC", :limit=> x)
  end
  
  
end
