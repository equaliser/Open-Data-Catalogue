class CreateFormatType < ActiveRecord::Migration
  def self.up
    create_table :format_types do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :format_types
  end
end
