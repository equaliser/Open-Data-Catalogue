class Licence < ActiveRecord::Base
  has_many :datasets
  before_destroy :no_referenced_datasets
  
  
  private

  def no_referenced_datasets
    return if datasets.empty?
    errors.add_to_base("<strong>Can't delete this licence</strong> - it's referenced by datasets(s): #{datasets.map(&:name).to_sentence}")
    false # If you return anything else, the callback will not stop the destroy from happening
  end
  
end
