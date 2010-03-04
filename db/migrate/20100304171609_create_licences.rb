class CreateLicences < ActiveRecord::Migration
  def self.up
    create_table :licences do |t|
      t.string :name
      t.text :description
      t.string :link
      t.timestamps
    end
  end

  def self.down
    drop_table :licences
  end
end
