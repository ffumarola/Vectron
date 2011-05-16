class CreateMessageRecipients < ActiveRecord::Migration
  def self.up
    create_table :message_recipients do |t|
      t.integer :message_content_id
      t.integer :recipient_id
      t.boolean :unread
      t.boolean :archive

      t.timestamps
    end
  end

  def self.down
    drop_table :message_recipients
  end
end
