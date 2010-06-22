class Tweet < ActiveRecord::Base
  validates_length_of :content, :maximum => 160
  
  belongs_to :user
end
