class Game
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :sport, :type => String
  field :date, :type => DateTime
  field :location, :type => String

  has_many :players

end