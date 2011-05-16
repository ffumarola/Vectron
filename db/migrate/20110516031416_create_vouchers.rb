class CreateVouchers < ActiveRecord::Migration
  def self.up
    create_table :vouchers do |t|
      t.integer :business_id
      t.integer :event_type_id
      t.string :name
      t.string :description
      t.datetime :event_time
      t.integer :offer_lifespan_minutes
      t.integer :max_offers
      t.integer :voucher_price_cents
      t.integer :full_value_cents
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :vouchers
  end
end
