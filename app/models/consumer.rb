class Consumer < ActiveRecord::Base
  #attr_accessible :user_id

  has_many :consumer_event_types
  has_many :event_types, :through => :consumer_event_types
  has_many :interest_levels, :through => :consumer_event_types
end
