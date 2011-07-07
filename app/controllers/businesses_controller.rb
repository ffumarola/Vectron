class BusinessesController < ApplicationController
  def show
    @business = current_user.business
  end
  
  def new
    @business = Business.new
        respond_to do |format|
      format.html # new.html.erb
	end
  end

  def create
    @business = Business.new(params[:business])
    current_user.business = @business
    respond_to do |format|
      @business.save
      #redirect_to 'business/home'
      format.html
    end
  end

  def edit
  end

end
