class Dataset < ActiveRecord::Base
  require 'validates_existence'
  acts_as_taggable_on :tags
  
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
  
end
