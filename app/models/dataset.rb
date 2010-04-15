class Dataset < ActiveRecord::Base
  require 'validates_existence'
  acts_as_taggable_on :tags
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true
  
  #include RFC822
  #validates_format_of :contact_email,  :with => EmailAddress
  
  validates_presence_of     :name, :description
  validates_uniqueness_of   :name
  
  belongs_to :licence
  validates_existence_of :licence
  
  belongs_to :language, :foreign_key => 'language_id'
  validates_existence_of :language
  
  belongs_to :audience
  validates_existence_of  :audience
  
  belongs_to :category, :foreign_key => 'category_id'
  validates_existence_of  :category
  
  belongs_to :geo_granularity
  validates_existence_of :geo_granularity
  
  belongs_to :local_authority
  validates_existence_of :local_authority
  
  belongs_to :temporal_granularity
  validates_existence_of :temporal_granularity
  
  has_many :format_urls, :dependent => :destroy
  accepts_nested_attributes_for :format_urls, :reject_if => lambda { |a| a[:url].blank? }, :allow_destroy => true
  
  has_many :format_types, :through => :format_urls
  
  
  def self.published
    Dataset.find(:all, :conditions => {:status => "Published"}, :order=> "name ASC")
  end
  
  def self.latest(x)
    Dataset.find(:all, :conditions => {:status => "Published"}, :order=> "publish_date DESC", :limit=> x)
  end
  
  # strips commas and downcases tags before saving 
  def before_save
     self.tag_list.map!(&:downcase) 
     self.tag_list.map!{|item| item.gsub(',','')}
  end
  
end
