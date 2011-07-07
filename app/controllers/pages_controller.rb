class PagesController < ApplicationController
  def home
    @featured_theater = Voucher.all[0]
    @featured_music = Voucher.all[1]
  end
  
  def landing
    @new_user = User.new
  end
  
  def account
    @consumer = current_user.consumer
  end
  
  def about
  end
  
  def abuse
  end
  
  def contact
  end
  
  def deal
  end
  
  def dev
  end
  
  def jobs
  end
  
  def landing
  end
  
  def login
  end
  
  def privacy
  end
  
  def signup
  end
  
  def terms
  end
  
  
end
