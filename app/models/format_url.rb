class FormatUrl < ActiveRecord::Base
  belongs_to :dataset
  belongs_to :format_type
end
