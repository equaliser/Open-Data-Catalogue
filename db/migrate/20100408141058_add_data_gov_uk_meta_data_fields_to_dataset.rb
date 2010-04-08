class AddDataGovUkMetaDataFieldsToDataset < ActiveRecord::Migration
  def self.up
    add_column :datasets, :author, :string
    add_column :datasets, :maintainer_email, :string
    add_column :datasets, :taxonomy_url, :string
    add_column :datasets, :updated_date, :datetime
    add_column :datasets, :geo_granularity_id, :integer
    add_column :datasets, :geo_coverage_id, :integer
    add_column :datasets, :temporal_granularity_id, :integer
    add_column :datasets, :precision, :string
    add_column :datasets, :geo_granularity_other, :string
    add_column :datasets, :geo_granularity_point, :string
    add_column :datasets, :temporal_granularity_other, :string
    add_column :datasets, :local_authority_id, :integer
  end

  def self.down
    remove_column :datasets, :local_authority_id
    remove_column :datasets, :temporal_granularity_other
    remove_column :datasets, :geo_granularity_point
    remove_column :datasets, :geo_granularity_other
    remove_column :datasets, :precision
    remove_column :datasets, :temporal_granularity_id
    remove_column :datasets, :geo_coverage_id
    remove_column :datasets, :geo_granularity_id
    remove_column :datasets, :updated_date
    remove_column :datasets, :taxonomy_url
    remove_column :datasets, :maintainer_email
    remove_column :datasets, :author
  end
end
