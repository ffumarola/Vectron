class CreateVoucherOffers < ActiveRecord::Migration
  def self.up
    create_table :voucher_offers do |t|
      t.integer :voucher_id
      t.integer :consumer_id
      t.boolean :accepted
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :voucher_offers
  end
end
