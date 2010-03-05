class Dataset < ActiveRecord::Base
  require 'validates_existence'
  
  belongs_to :licence
  validates_existence_of :licence
  
  belongs_to :language
  validates_existence_of :language
  
  belongs_to :audience
  validates_existence_of  :audience
  
  belongs_to :category
  validates_existence_of  :category
  
end
