module PagesHelper
  def currency(val_in_cents)
    number_to_currency(val_in_cents / 100.0)
  end
end
