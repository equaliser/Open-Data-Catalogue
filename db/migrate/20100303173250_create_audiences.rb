class CreateAudiences < ActiveRecord::Migration
  def self.up
    create_table :audiences do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :audiences
  end
end
