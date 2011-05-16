class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.integer :master_id
      t.integer :slave_id
      t.integer :value
      t.integer :relationship_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :relationships
  end
end
