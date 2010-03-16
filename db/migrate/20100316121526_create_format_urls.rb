class CreateFormatUrls < ActiveRecord::Migration
  def self.up
    create_table :format_urls do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :format_urls
  end
end
