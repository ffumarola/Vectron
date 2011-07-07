class VouchersController < ApplicationController
  def index
    @vouchers = Voucher.all
    
    render :xml => @vouchers
  end
  

  
  def create
    #begin
    @voucher = Voucher.new(params[:voucher])
    @voucher.business = current_user.business
    @voucher.active = true
    @consumers = Consumer.all
    @consumer_event_types = ConsumerEventType.all

    respond_to do |format|
      if @voucher.save
	@consumers.each do |consumer|
	  if consumer.zip_code == @voucher.business.zip_code && consumer.consumer_event_types.find(@voucher.event_type_id).interest_level > 0
	    @subject = "You have received an offer for $" + (@voucher.voucher_price_cents / 100).to_s + " " + EventType.find(@voucher.event_type_id).label + " from " + @voucher.business.name + "!"
	    @message = "Test"
	    Emailer.deliver_contact(consumer.user.email, @subject, @message)
	    @voucher_offer = VoucherOffer.new
	    @voucher_offer.consumer = consumer
	    @voucher_offer.voucher = @voucher
	    @voucher_offer.active = true
	    @voucher_offer.accepted = false
	    @voucher_offer.save
	  end
	end
        format.html { redirect_to(:businesses_home, :notice => 'Voucher was successfully created.') }
        format.xml  { render :xml => @voucher, :status => :created, :location => @voucher }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @voucher.errors, :status => :unprocessable_entity }
      end
    end
    #rescue Exception
    #end
  end
  
  def new
    @voucher = Voucher.new
    respond_to do |format|
      format.html
    end
  end

  def show
  end

  def edit
  end

end
