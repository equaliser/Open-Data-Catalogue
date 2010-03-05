class Audience < ActiveRecord::Base
  has_many :datasets
end
