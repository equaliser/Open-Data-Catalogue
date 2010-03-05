class Licence < ActiveRecord::Base
  has_many :datasets
end
