class CreateConsumerEventTypes < ActiveRecord::Migration
  def self.up
    create_table :consumer_event_types do |t|
      t.integer :consumer_id
      t.integer :event_type_id
      t.integer :user_value
      t.integer :system_value

      t.timestamps
    end
  end

  def self.down
    drop_table :consumer_event_types
  end
end
