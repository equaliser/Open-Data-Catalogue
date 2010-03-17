class FormatUrl < ActiveRecord::Base
  belongs_to :dataset
  belongs_to :format_type
  
  validates_presence_of :url
  
end
