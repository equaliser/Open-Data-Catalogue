class CreateFormatUrl < ActiveRecord::Migration
  def self.up
    create_table :format_urls do |t|
      t.integer :format_type_id
      t.string :url
      t.integer :dataset_id
      t.timestamps
    end
  end

  def self.down
    drop_table :format_urls
  end
end
