class InterestLevel < ActiveRecord::Base
     validates_numericality_of :value,
    :less_than_or_equal_to => 5,
    :greater_than_or_equal_to => 1,
    :only_integer => true
end
