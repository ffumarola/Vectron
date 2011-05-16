class CreateBusinesses < ActiveRecord::Migration
  def self.up
    create_table :businesses do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.string :zip_code
      t.string :address
      t.string :phone
      t.string :operating_hours

      t.timestamps
    end
  end

  def self.down
    drop_table :businesses
  end
end
