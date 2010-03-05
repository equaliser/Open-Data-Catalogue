class CreateDatasets < ActiveRecord::Migration
  def self.up
    create_table :datasets do |t|
      t.string :name
      t.integer :audience_id
      t.text :description
      t.integer :version
      t.string :display_title
      t.string :info_url
      t.string :xml_url
      t.string :csv_url
      t.integer :language_id
      t.string :geo_extent
      t.string :maintainer
      t.string :contact_email
      t.string :update_frequency
      t.datetime :date_range_start
      t.datetime :date_range_end
      t.date :publish_date
      t.date :metadata_date
      t.integer :licence_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :datasets
  end
end
