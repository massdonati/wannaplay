class Game
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :sport, :type => String, :default => "Calcetto a 5"
  field :date, :type => Date
  field :location, :type => String, :default => "Zambon"
  field :price, :type => Integer
  field :allowed_number_of_players, :type => Integer, :default => 10

  

  has_and_belongs_to_many :players
  has_many :comments, :as => :commentable 
  
  validates_numericality_of :allowed_number_of_players, :greater_than => 0

  def validate!
    errors.add(:players, "Too many players for this game") if players.count > allowed_number_of_players
  end

  def enough_players
   self.allowed_number_of_players <= self.players.count
  end

end