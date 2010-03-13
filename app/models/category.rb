class Category < ActiveRecord::Base
  has_many :datasets
  before_destroy :no_referenced_datasets
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true
  
  private

  def no_referenced_datasets
    return if datasets.empty?
    errors.add_to_base("<strong>Can't delete this category</strong> - it's referenced by datasets(s): #{datasets.map(&:name).to_sentence}")
    false # If you return anything else, the callback will not stop the destroy from happening
  end
end
