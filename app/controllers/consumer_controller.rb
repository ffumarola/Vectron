class ConsumerController < ApplicationController
  def home
  end

  def create
    @consumer = Consumer.new
    #@consumer.consumer_event_types = ConsumerEventType.new(EventType.count)
    
    i = 0
    event_types = EventType.all
    event_types.each do |event_type|
      @consumer.consumer_event_types[i] = ConsumerEventType.new
      @consumer.consumer_event_types[i].event_type_id = event_type.id
      i += 1
    end
    respond_to do |format|
      @consumer.save
      format.html
    end
  end

  def edit
  end

end
