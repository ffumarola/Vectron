class CreateInterestLevels < ActiveRecord::Migration
  def self.up
    create_table :interest_levels do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :interest_levels
  end
end
