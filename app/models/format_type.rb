class FormatType < ActiveRecord::Base
  belongs_to :format_url
  
  validates_presence_of :name
  validates_length_of :description, :in => 0..255
end
