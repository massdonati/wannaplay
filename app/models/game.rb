class Game
  include Mongoid::Document
  include Mongoid::Timestamp
  
  field :sport, :type => String
  field :date, :type => DateTime
  
  has_many :players

end