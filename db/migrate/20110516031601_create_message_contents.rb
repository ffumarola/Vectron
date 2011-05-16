class CreateMessageContents < ActiveRecord::Migration
  def self.up
    create_table :message_contents do |t|
      t.integer :from_id
      t.string :subject
      t.text :body
      t.integer :message_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :message_contents
  end
end
