# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Vectron::Application.initialize!

ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => 'smtp.gmail.com',
  :port => 587,
  :domain => 'gmail.com',
  :authentication => :plain,
  :user_name => 'jcsicsek',
  :password => 'bigwig'
}

module ActiveMerchant
  module Utils
    def get_payment_gateway
      gateway = ActiveMerchant::Billing::AuthorizeNetCimGateway.new(
        :login => "58gNu2ByE",
        :password => "22sUy3K33u37uEq5",
        :test => ENV['RAILS_ENV'] != 'production' ? true : false
      )
      if not gateway
        raise AuthenticationFailed, 'Authentication with CIM Gateway could not be completed.'
      end
      return gateway
    end
  end
end
