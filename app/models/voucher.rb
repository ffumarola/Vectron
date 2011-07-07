include ActionView::Helpers

class Voucher < ActiveRecord::Base
  belongs_to :business
  
  def print_discount_price
    number_to_currency(self.voucher_price_cents / 100.0)
  end
  
  def print_normal_price
    number_to_currency(self.full_value_cents / 100.0)
  end
  
  
end
