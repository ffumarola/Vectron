class ConsumerEventType < ActiveRecord::Base
  belongs_to :consumer
  belongs_to :event_type
  belongs_to :interest_level
end
